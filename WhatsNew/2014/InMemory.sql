USE DemoDb


IF NOT EXISTS(
SELECT * FROM sys.filegroups AS F WHERE F.name = 'FGMemOptimized'
)
BEGIN
    ALTER DATABASE DemoDb
    ADD FILEGROUP FGMemOptimized CONTAINS MEMORY_OPTIMIZED_DATA;

    DECLARE
        @logPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultLogPath'))
    ,   @dataPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultDataPath'));

    -- File in the sense of unix files...
    DECLARE
        @cheapHack nvarchar(max) = N'ALTER DATABASE DemoDb ADD FILE (NAME=''MemOptimized'',FILENAME='''
    +   @dataPath + 'MemOptimized'' ) TO FILEGROUP FGMemOptimized;'

    EXECUTE sys.sp_executesql @cheapHack, N'';
END


CREATE TABLE dbo.SampleData
(
    SourceKey varchar(50) COLLATE Latin1_General_100_BIN2 NOT NULL INDEX NCI__dbo__SampleData__SourceKey NONCLUSTERED
,   SampleData varchar(20) NOT NULL
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

-- Sample data
INSERT INTO
    dbo.SampleData (SourceKey,SampleData)
VALUES ('ABC123', 'Foo');

SELECT * FROM dbo.SampleData AS SD;
----------------------------------------------------------------
-- You really don't want to do this in production
----------------------------------------------------------------
;THROW 200100, N'Stop, Dave. I''m afraid. I''m afraid, Dave. Dave, my mind is going. I can feel it.',1;
SHUTDOWN WITH NOWAIT;

USE DemoDb
-- NET START "SQL Server (DEV2017)"
SELECT * FROM dbo.SampleData AS SD;

CREATE TYPE dbo.SampleDataTvf AS TABLE
(
    SourceKey varchar(50) COLLATE Latin1_General_100_BIN2 NOT NULL INDEX NCI__dbo__SampleDataTvf__SourceKey NONCLUSTERED
,   SampleData varchar(20) NOT NULL
) WITH(MEMORY_OPTIMIZED = ON);

GO
CREATE PROCEDURE dbo.SampleDataPutter(@tvf dbo.SampleDataTvf READONLY)
WITH NATIVE_COMPILATION, SCHEMABINDING
AS 
BEGIN ATOMIC WITH
(
TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'us_english'  
)

    INSERT INTO
        dbo.SampleData
    SELECT
        T.SourceKey
    ,   T.SampleData
    FROM
        @tvf AS T
    WHERE
        T.SourceKey NOT IN (SELECT 1 FROM dbo.SampleData AS D WHERE D.SourceKey = T.SourceKey)
END
GO
SET NOCOUNT ON;
DECLARE
    @local dbo.SampleDataTvf;

INSERT INTO
    @local
(
    SourceKey
,   SampleData
)
SELECT
    D.*
FROM
(
    SELECT TOP 26
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) + 64 AS CharNum
    FROM
        sys.all_columns AS AC
) C
CROSS APPLY
(
    SELECT
        REPLICATE(CHAR(C.CharNum), 50)
    ,   C.CharNum
) D(SourceKey, SampleData);

EXECUTE dbo.SampleDataPutter @tvf = @local;
SELECT * FROM dbo.SampleData AS SD;

/*
-- Go exploring if time permits
-- Everyone likes C
GO
DECLARE
    @logPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultLogPath'))
,   @dataPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultDataPath'));

DECLARE @xtpPath nvarchar(200) = CONCAT(@dataPath, 'xtp\', DB_ID());
SELECT @xtpPath;
DROP TABLE IF EXISTS #DirectoryTree;
CREATE TABLE #DirectoryTree 
(
id int IDENTITY(1,1)
,subdirectory nvarchar(512)
,depth int
,isfile bit
);    

INSERT INTO
    #DirectoryTree
EXECUTE sys.xp_dirtree @xtpPath, 1,1

SELECT * FROM #DirectoryTree AS DT
WHERE DT.subdirectory LIKE '%.c'
-- xtp_t_17_1141579105_186216910972399_1.c
*/
