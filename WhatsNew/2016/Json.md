# JSON
All the joy of XML with fewer characters.

```
{"CollectionName":
    [
        {"number":1,"type":"A","foo":null}
    ,	{...}
    ]
}
```


- ISJSON	Tests whether a string contains valid JSON.
- JSON_VALUE	Extracts a scalar value from a JSON string.
- JSON_QUERY	Extracts an object or an array from a JSON string.
- JSON_MODIFY	Updates the value of a property in a JSON string and returns the updated JSON string.



# Documentation
https://docs.microsoft.com/en-us/sql/t-sql/functions/json-functions-transact-sql?view=sql-server-2017
https://docs.microsoft.com/en-us/sql/t-sql/functions/isjson-transact-sql?view=sql-server-2017
https://docs.microsoft.com/en-us/sql/t-sql/functions/json-value-transact-sql?view=sql-server-2017
https://docs.microsoft.com/en-us/sql/t-sql/functions/json-query-transact-sql?view=sql-server-2017
https://docs.microsoft.com/en-us/sql/t-sql/functions/json-modify-transact-sql?view=sql-server-2017