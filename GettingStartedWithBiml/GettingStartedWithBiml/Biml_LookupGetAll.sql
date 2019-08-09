CREATE PROCEDURE dbo.LookupGetAll
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        LB.LookupName
    ,   LB.NoMatchBehavior
    ,   LB.OleDbConnectionName
    ,   LB.SourceQuery
    FROM
        dbo.LookupBase AS LB
    ORDER BY
        LB.LookupName;

    SELECT
        LB.LookupName
    ,   LI.SourceColumn
    ,   LI.TargetColumn
    FROM
        dbo.LookupBase AS LB
        INNER JOIN
            dbo.LookupInput AS LI
            ON LI.LookupSK = LB.LookupSK
    ORDER BY
        LB.LookupName;

    SELECT
        LB.LookupName
    ,   LO.SourceColumn
    ,   LO.TargetColumn
    FROM
        dbo.LookupBase AS LB
        LEFT OUTER JOIN
            dbo.LookupOutput AS LO
            ON LO.LookupSK = LB.LookupSK
    ORDER BY
        LB.LookupName;
END