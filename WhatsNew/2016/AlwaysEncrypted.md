# AlwaysEncrypted

Finally, the DBA is defeated

>  Always Encrypted provides a separation between those who own the data (and can view it) and those who manage the data (but should have no access)



Database changes

- Where do we store the master key - Windows Certificate Store or Azure Key Vault
- Encryption - Deterministic or Randomized

- Run encryption wizard



Application changes

- Connection string gets an additional attribute

- Queries must be parameterized

Period. Trivial amount of work to reap the security benefits





# Documentation

https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/always-encrypted-database-engine?view=sql-server-2016

https://docs.microsoft.com/en-us/azure/sql-database/sql-database-always-encrypted