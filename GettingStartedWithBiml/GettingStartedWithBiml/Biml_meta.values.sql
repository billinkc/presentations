TRUNCATE TABLE dbo.PackageBase
TRUNCATE TABLE dbo.LookupBase
TRUNCATE TABLE dbo.LookupInput
TRUNCATE TABLE dbo.LookupOutput


INSERT INTO 
    dbo.PackageBase
(ProjectSK, ProjectName)
VALUES
(0  -- ProjectSK - int
    , N'LookupTester'  -- ProjectName - nvarchar(50)
);

INSERT INTO dbo.LookupBase
(
    PackageSK
,   LookupName
,   NoMatchBehavior
,   OleDbConnectionName
,   SourceQuery
)
VALUES
(
    (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester')
,   N'LKP Sales_Currency'
,   'IgnoreFailure'
,   N'OLE_CM Adventureworks2012'
,   N'SELECT
    SC.CurrencyCode
,   SC.Name
FROM
    Sales.Currency AS SC;'
)
,(
    (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester')
,   N'LKP Purchasing_ShipMethod'
,   'IgnoreFailure'
,   N'OLE_CM Adventureworks2012'
,   N'SELECT
    SM.ShipMethodID
,   SM.Name
,   SM.ShipBase
,   SM.ShipRate
FROM
    Purchasing.ShipMethod AS SM'
)
;

INSERT INTO
    dbo.LookupInput
(
    LookupSK
,   SourceColumn
,   TargetColumn
)
VALUES
(
    (SELECT LookupSK FROM dbo.LookupBase AS LB WHERE LB.LookupName = 'LKP Sales_Currency' AND LB.PackageSK = (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester'))
,   N'Code'
,   N'CurrencyCode'
)
--,(
--    (SELECT LookupSK FROM dbo.LookupBase AS LB WHERE LB.LookupName = 'LKP Sales_Currency' AND LB.PackageSK = (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester'))
--,   N'CurrencyName'
--,   N'Name'
--)

,(
    (SELECT LookupSK FROM dbo.LookupBase AS LB WHERE LB.LookupName = 'LKP Purchasing_ShipMethod' AND LB.PackageSK = (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester'))
,   N'ShipMethod'
,   N'Name'
)
;


INSERT INTO
    dbo.LookupOutput
(
    LookupSK
,   SourceColumn
,   TargetColumn
)
VALUES
(
    (SELECT LookupSK FROM dbo.LookupBase AS LB WHERE LB.LookupName = 'LKP Sales_Currency' AND LB.PackageSK = (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester'))
,   N'CurrencyCode'
,   N'lkp_CurrencyCode'
)
,(
    (SELECT LookupSK FROM dbo.LookupBase AS LB WHERE LB.LookupName = 'LKP Sales_Currency' AND LB.PackageSK = (SELECT PB.PackageSK FROM dbo.PackageBase AS PB WHERE PB.ProjectName = N'LookupTester'))
,   N'Name'
,   N'lkp_Name'
);

SELECT * FROM dbo.LookupInput AS LI