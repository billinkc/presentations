DROP TABLE IF EXISTS #TablePeople;
DROP TABLE IF EXISTS #StagePeople;

-- Use JSON as concatenation replacement for computing
-- hash keys
SELECT 
    *
,   HASHBYTES('SHA1', UQ.EntityJson) AS HashKey
,   HASHBYTES('SHA1', CK.ValuesJson) AS ChangeKey
INTO
    #TablePeople
FROM 
    (
        VALUES
            ('Alice', 'Anscombe', '100 Ash St', 'Abiliene', 'KS', '67410', '555-555-1111')
        ,   ('Bob', 'Betteridge','200 Broadway Blvd', 'Broken Bow', 'NE', '68822', '555-555-2222')
        ,   ('Constantine', 'Crock', '300 Cedar Ave', 'Concordia', 'MO', '64020', '555-555-3333')
        ,   ('Delmar', 'Dunworthy' ,'400 Dirt Rd', 'Deepwater', 'MO', '64740', '555-555-4444')
        -- Terrible kerning on El Dorado in results tab
        ,   ('Eunice', 'Elsiver','500 Elm St', 'El Dorado Springs', 'MO', '64744', NULL)
    )D(FirstName, LastName, AddressLine1, AddressCity, AddressState, AddressPostalCode, PhoneNumber)
    CROSS APPLY
    (
        SELECT
            D.FirstName
        ,   D.LastName
        FOR JSON PATH, ROOT('pk'), INCLUDE_NULL_VALUES
    ) UQ(EntityJson)
    CROSS APPLY
    (
        SELECT
            D.AddressLine1, D.AddressCity, D.AddressState, D.AddressPostalCode, D.PhoneNumber
        FOR JSON PATH, ROOT('vals'), INCLUDE_NULL_VALUES
    )CK(ValuesJson);

SELECT
*
,   HASHBYTES('SHA1', UQ.EntityJson) AS HashKey
,   HASHBYTES('SHA1', CK.ValuesJson) AS ChangeKey
INTO
    #StagePeople
FROM
    (
        VALUES
            ('Eunice', 'Elsiver','500 Elm St', 'El Dorado Springs', 'MO', '64744', '555-555-5555')
        ,   ('Francis', 'Fortunado','600 Fehr Rd', 'Faucett', 'MO', '64448', '555-555-6666')
    )D(FirstName, LastName, AddressLine1, AddressCity, AddressState, AddressPostalCode, PhoneNumber)
    CROSS APPLY
    (
        SELECT
            D.FirstName
        ,   D.LastName
        FOR JSON PATH, ROOT('pk'), INCLUDE_NULL_VALUES
    ) UQ(EntityJson)
    CROSS APPLY
    (
        SELECT
            D.AddressLine1, D.AddressCity, D.AddressState, D.AddressPostalCode, D.PhoneNumber
        FOR JSON PATH, ROOT('vals'), INCLUDE_NULL_VALUES
    )CK(ValuesJson);

-- Demo the data at rest
SELECT * FROM #TablePeople AS TP;
-- Simulate the data ready for integration
SELECT * FROM #StagePeople AS SP;

-- Find what's changed
UPDATE
    TP
SET
    -- No need to update keys
--    TP.FirstName = SP.FirstName
--,   TP.LastName = SP.LastName
    TP.AddressLine1 = SP.AddressLine1
,   TP.AddressCity = SP.AddressCity
,   TP.AddressState = SP.AddressState
,   TP.AddressPostalCode = SP.AddressPostalCode
,   TP.PhoneNumber = SP.PhoneNumber
--,   TP.HashKey = SP.HashKey
,   TP.ChangeKey = TP.ChangeKey
FROM
    #TablePeople AS TP
    INNER JOIN
        #StagePeople AS SP
        ON SP.HashKey = TP.HashKey
WHERE
    SP.ChangeKey <> TP.ChangeKey;

INSERT INTO
    #TablePeople 
SELECT
*
FROM
    #StagePeople AS SP
WHERE
    NOT EXISTS (SELECT * FROM #TablePeople AS TP WHERE TP.HashKey = SP.HashKey);

-- Eunice should have a phone number
-- Francis should exist
SELECT * FROM #TablePeople AS TP
ORDER BY
    1;