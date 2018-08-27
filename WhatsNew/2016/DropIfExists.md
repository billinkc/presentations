# Drop if exists X

Which is better

```
DROP IF EXISTS #MyTempTable;
-- or we can write all this
IF OBJECT_ID('tempdb..#MyTempTable') IS NOT NULL
BEGIN
  DROP TABLE #MyTempTable;
END
```

- AGGREGATE
- PROCEDURE
- TABLE
- ASSEMBLY
- ROLE
- TRIGGER
- VIEW
- RULE
- TYPE
- DATABASE
- SCHEMA
- USER
- DEFAULT
- SECURITY POLICY
- VIEW
- FUNCTION
- SEQUENCE
- INDEX
- SYNONYM 

# Documentation
https://blogs.msdn.microsoft.com/sqlserverstorageengine/2015/11/03/drop-if-exists-new-thing-in-sql-server-2016/
