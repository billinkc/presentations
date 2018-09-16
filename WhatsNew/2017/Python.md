# Python



> Can't find the stored procedure, `sp_execute_external_script`? It means you probably haven't finished configuring the instance to support external script execution. After running SQL Server 2017 setup and selecting Python as the machine learning language, you must also explicitly enable the feature using `sp_configure`, and then restart the instance.



Rampant speculation, what other languages could we specify?



`EXECUTE sys.sp_execute_external_script @language = N'Python',` 
`@script = N'print(3+4)'`

