# Create or Alter

Seen this curious nugget inside sp_whoisactive?

```
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'sp_WhoIsActive')
EXEC ('CREATE PROC dbo.sp_WhoIsActive AS SELECT ''stub version, to be replaced''')
GO
ALTER PROC dbo.sp_WhoIsActive --...
```

No more! We can now use the Create or Alter syntax to simplify object interactions.



Valid for 

- STORED PROCEDURES
- FUNCTIONS
- TRIGGERS
- VIEWS



Preserves permissions compared to [DIE](./DropIfExists.md)

```
CREATE OR ALTER VIEW dbo.WhatsNew AS SELECT 1 AS MyView;
GO
CREATE OR ALTER VIEW dbo.WhatsNew AS SELECT 2 AS MyView;
GO
SELECT * FROM dbo.WhatsNew;
```

[Live Demo](https://dbfiddle.uk/?rdbms=sqlserver_2016&fiddle=41576c563bf9c4190125f9d753135d9b)


# Documentation

https://support.microsoft.com/en-us/help/3190548/update-introduces-create-or-alter-transact-sql-statement-in-sql-server

https://blogs.msdn.microsoft.com/sqlserverstorageengine/2016/11/17/create-or-alter-another-great-language-enhancement-in-sql-server-2016-sp1/

