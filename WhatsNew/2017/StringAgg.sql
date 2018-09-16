-- What does an order look like?
SELECT
    OL.*
FROM
    Sales.OrderLines AS OL
WHERE
    OL.OrderID = 26866;

-- Aggregate the details into a single line
SELECT
    STRING_AGG(CONCAT(Quantity, N' @ ', OL.Description), N'|') AS AllDetails
,   OL.OrderID
FROM
    Sales.OrderLines AS OL
WHERE
    OL.OrderID = 26866
GROUP BY
    OL.OrderID;

-- Aggregate details with an explicit order by
SELECT
    STRING_AGG(CONCAT(Quantity, N' @ ', OL.Description), N'|') 
        WITHIN GROUP(ORDER BY OL.Quantity) AS AllDetails
,   OL.OrderID
FROM
    Sales.OrderLines AS OL
WHERE
    OL.OrderID = 26866
GROUP BY
    OL.OrderID;

-- "Classic" approach
-- Rerun with actual query plans
SELECT
    STUFF
    (
        (
              SELECT
                  N'|' + CONCAT(OLI.Quantity, N' @ ', OLI.Description)
              FROM
                  Sales.OrderLines AS OLI
              WHERE
                  OLI.OrderID = OL.OrderID
              ORDER BY
                  OLI.Quantity
              FOR XML PATH('')
          )
         , 1
         , 1
         , ''
    ) AS AllDetails
,   OL.OrderID
FROM
    Sales.OrderLines AS OL
WHERE
    OL.OrderID = 26866
GROUP BY
    OL.OrderID;
