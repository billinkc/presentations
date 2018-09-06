# SESSION_CONTEXT

Like CONTEXT_INFO, but better. Key-value pairs of text instead of a single bitmasked values



Session_context offers a more secure, key-value pairs alternative to context_info for storing session variables.



SESSION_CONTEXT permits
you define key value pairs for a total of 256 KB of data, and a key
can be marked as read_only. This is a great replacement to context_info.



```
SET NOCOUNT ON;
DECLARE @message varchar(300) = (SELECT CONCAT(SUSER_NAME(), ' is the greatest'))
EXEC sp_set_session_context 'Who is the greatest', @message, 1;
SELECT SESSION_CONTEXT(N'Who is the greatest');

EXEC sp_set_session_context 'Who is the greatest', 'Mike is the greatest';
```



sp_set_session_context





https://docs.microsoft.com/en-us/sql/t-sql/functions/session-context-transact-sql?view=sql-server-2017

https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-set-session-context-transact-sql?view=sql-server-2017