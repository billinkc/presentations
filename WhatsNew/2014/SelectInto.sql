USE WideWorldImportersDW
GO
DROP TABLE IF EXISTS dbo.FO_110;
DROP TABLE IF EXISTS dbo.FO_130;
GO
ALTER DATABASE WideWorldImportersDW SET COMPATIBILITY_LEVEL = 110
GO
GO
-- TURN ON QUERY PLAN
SELECT * INTO dbo.FO_110 FROM Fact.[Order]

ALTER DATABASE WideWorldImportersDW SET COMPATIBILITY_LEVEL = 130
GO
SELECT * INTO dbo.FO_130 FROM Fact.[Order]

GO
