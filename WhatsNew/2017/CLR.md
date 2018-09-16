# CLR

CLR now runs on linux!



Oh they completely changed out how security works



> CLR uses Code Access Security (CAS) in the .NET Framework, which is no longer supported as a security boundary. A CLR assembly created with `PERMISSION_SET = SAFE` may be able to access external system resources, call unmanaged code, and acquire sysadmin privileges. Beginning with SQL Server 2017 (14.x), an `sp_configure` option called `clr strict security`is introduced to enhance the security of CLR assemblies. `clr strict security` is enabled by default, and treats `SAFE` and `EXTERNAL_ACCESS` assemblies as if they were marked `UNSAFE`. The `clr strict security` option can be disabled for backward compatibility, but this is not recommended. Microsoft recommends that all assemblies be signed by a certificate or asymmetric key with a corresponding login that has been granted `UNSAFE ASSEMBLY` permission in the master database. CLR assemblies can be added to a whitelist, as a work-around for the `clr strict security` feature. [sp_add_trusted_assembly](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sys-sp-add-trusted-assembly-transact-sql?view=sql-server-2017), [sp_drop_trusted_assembly](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sys-sp-drop-trusted-assembly-transact-sql?view=sql-server-2017), and [sys.trusted_asssemblies](https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-trusted-assemblies-transact-sql?view=sql-server-2017) are added to support the white list of trusted assemblies.



# Documentation

https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/clr-strict-security?view=sql-server-2017

