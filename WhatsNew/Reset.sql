USE master;
-- drop with extreme prejudice
IF EXISTS(SELECT * FROM sys.databases AS D WHERE D.name = 'DemoDb')
BEGIN
	ALTER DATABASE DemoDb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DemoDb;
END
GO
DECLARE
    @logPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultLogPath'))
,   @dataPath sysname = CONVERT(sysname, SERVERPROPERTY('InstanceDefaultDataPath'));

DECLARE @MakeDemoDb nvarchar(max) = N'
CREATE DATABASE DemoDb CONTAINMENT = NONE
ON PRIMARY
(
    NAME = N''DemoDb''
,   FILENAME = N'''+ @dataPath + 'DemoDb.mdf''
,   SIZE = 8192KB
,   FILEGROWTH = 65536KB
)
LOG ON
(
    NAME = N''DemoDb_log''
,   FILENAME = N'''+ @logPath + 'DemoDb_log.ldf''
,   SIZE = 8192KB
,   FILEGROWTH = 65536KB
);'

EXECUTE sys.sp_executesql @MakeDemoDb, N'';
