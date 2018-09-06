# TRUNCATE

Truncate can now target a specific partition(s)



TRUNCATE TABLE dbo.MyTable WITH (PARTITIONS (2, 4, 6 TO 8));



https://docs.microsoft.com/en-us/sql/t-sql/statements/truncate-table-transact-sql?view=sql-server-2017