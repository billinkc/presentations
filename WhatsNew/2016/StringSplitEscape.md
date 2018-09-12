# STRING_SPLIT and STRING_ESCAPE



String splitting will shred a column into multiple rows

```
SELECT * FROM STRING_SPLIT('1,2,3,4,5', ',') AS Demo;
```


String escaping will replace invalid characters with their entity values. Applicable to [JSON](./Json.md)

```
SELECT STRING_ESCAPE('Hello tab' + CHAR(9)+'world', 'json');
```



# Documentation

https://docs.microsoft.com/en-us/sql/t-sql/functions/string-split-transact-sql?view=sql-server-2017

https://docs.microsoft.com/en-us/sql/t-sql/functions/string-escape-transact-sql?view=sql-server-2017