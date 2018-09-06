# FORMATMESSAGE

```
SELECT FORMATMESSAGE('Using hex numbers makes me a hacker %#x, padded value -> %#06x', 16, 16);
```

Given a starting value of 16 (int)

|code|description|result|
|----|------|---|
|%i|integer|16|
|%u|unsigned integer|16|
|%o|unsigned octal|20|
|%x|unsigned hex|10|
|%#o|prefixed octal|020|
|%#x|prefixed hex|0x10|
|%#06x|prefixed hex, in 6 characters|0x0010|
|%010i|10 integer digits|0000000016|
|%020i|20 integer digits|00000000000000000016|

Given a starting value of '16' (n)(var)char

|code|description|result|
|----|------|---|
|%s|string|16|
|%-20s|string 30 wide, left justified|16                  x|
|%20s|string 30 wide, right justified|x                  16|

The x is not present in the above data but is used to prevent whitespace trimming

# Documentation
https://docs.microsoft.com/en-us/sql/t-sql/functions/formatmessage-transact-sql?view=sql-server-2017
https://www.le.ac.uk/users/rjm1/cotter/page_30.htm