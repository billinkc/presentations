# Dynamic Data Masking

Dynamic Data Masking is a lightweight feature that allows the _obscuring_ of data without physically changing it.

```
USE WideWorldImporters
CREATE USER TestUser WITHOUT LOGIN;  
GRANT SELECT ON  Purchasing.Suppliers TO TestUser;  

SELECT S.BankAccountName, * FROM Purchasing.Suppliers AS S

EXECUTE AS USER = 'TestUser'
SELECT S.BankAccountName, * FROM Purchasing.Suppliers AS S
REVERT
```

### Super important note from Books Online


> Dynamic Data Masking should not be used as an isolated measure to fully secure sensitive data from users running ad-hoc queries on the database. It is appropriate for preventing accidental sensitive data exposure, but will not protect against malicious intent to infer the underlying data.


Security through obscurity is no security at all.


# Documentation

https://docs.microsoft.com/en-us/sql/relational-databases/security/dynamic-data-masking?view=sql-server-2017