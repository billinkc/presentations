# Row Level Security (RLS)

2016 introduced a new object, SECURITY POLICY. 

Security policies allow you to **block** actions and force **filtering** by writing custom functions.



`CREATE SECURITY POLICY dbo.FilterCustomerByTerritory`
`ADD FILTER PREDICATE dbo.TerritoryCheck(SalesTerritory)`
    `ON dbo.CUSTOMER,`
`ADD BLOCK PREDICATE dbo.TerritoryCheck(SalesTerritory)`
    `ON dbo.CUSTOMER AFTER UPDATE`
`WITH`
`(STATE = ON, SCHEMABINDING = ON);`



# Documentation

https://docs.microsoft.com/en-us/sql/relational-databases/security/row-level-security?view=sql-server-2016