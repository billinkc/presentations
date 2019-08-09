
-- Sizes might be small for names
CREATE TABLE
    dbo.PackageBase
(
    PackageSK int IDENTITY(1,1) NOT NULL
,   ProjectSK int NULL
,   ProjectName nvarchar(50)
)
-- I hope we don't need to use a max for the query
CREATE TABLE
    dbo.LookupBase
(
    LookupSK int IDENTITY(1,1) NOT NULL
,   PackageSK int NULL
,   LookupName nvarchar(50) NOT NULL
,   NoMatchBehavior varchar(30) NOT NULL
,   OleDbConnectionName nvarchar(50)
,   SourceQuery nvarchar(4000) NOT NULL
,   CONSTRAINT PK_LookupBase PRIMARY KEY
    (
        LookupSK
    )
,   CONSTRAINT UQ_LookupBase UNIQUE 
    (
        PackageSK
    ,   LookupName
    )
,   CONSTRAINT CK_NoMatchBehvior CHECK (NoMatchBehavior IN ('RedirectRowsToNoMatchOutput', 'IgnoreFailure', 'FailComponent', 'RedirectRowsToNoErrorOutput'))
);


CREATE TABLE
    dbo.LookupInput
(
    LookupInputSK int IDENTITY(1,1) NOT NULL
,   LookupSK int NOT NULL
,   SourceColumn nvarchar(50) NOT NULL
,   TargetColumn nvarchar(50) NOT NULL
,   CONSTRAINT PK_LookupInput PRIMARY KEY
    (
        LookupInputSK
    )
,   CONSTRAINT UQ_LookupInputSource UNIQUE 
    (
        LookupSK
    ,   SourceColumn
    )
,   CONSTRAINT UQ_LookupInputTarget UNIQUE 
    (
        LookupSK
    ,   TargetColumn
    )
);

CREATE TABLE
    dbo.LookupOutput
(
    LookupOutputSK int IDENTITY(1,1) NOT NULL
,   LookupSK int NOT NULL
,   SourceColumn nvarchar(50) NOT NULL
,   TargetColumn nvarchar(50) NOT NULL
,   CONSTRAINT PK_LookupOutput PRIMARY KEY
    (
        LookupOutputSK
    )
,   CONSTRAINT UQ_LookupOutputSource UNIQUE 
    (
        LookupSK
    ,   SourceColumn
    )
,   CONSTRAINT UQ_LookupOutputTarget UNIQUE 
    (
        LookupSK
    ,   TargetColumn
    )
);
