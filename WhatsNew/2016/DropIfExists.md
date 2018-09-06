# Drop if exists

Which would you rather write?

```
IF OBJECT_ID('tempdb..#MyTempTable') IS NOT NULL
BEGIN
  DROP TABLE #MyTempTable;
END


-- or we can write all this
DROP IF EXISTS #MyTempTable;
```



The Drop If Exists, DIE, syntax is available for most objects. 

| Objects         | Objects  |
| --------------- | -------- |
| AGGREGATE       | ASSEMBLY |
| DATABASE        | DEFAULT  |
| FUNCTION        | INDEX    |
| PROCEDURE       | ROLE     |
| RULE            | SCHEMA   |
| SECURITY POLICY | SEQUENCE |
| SYNONYM         | TABLE    |
| TRIGGER         | TYPE     |
| USER            | VIEW     |

Standard rules apply where statements must be the first statement in a query batch (VIEW, SCHEMA)

# Documentation
https://blogs.msdn.microsoft.com/sqlserverstorageengine/2015/11/03/drop-if-exists-new-thing-in-sql-server-2016/
