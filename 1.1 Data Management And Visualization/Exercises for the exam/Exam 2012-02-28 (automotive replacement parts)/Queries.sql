-- QUERY (1) --
SELECT Agency, CarModel, PaymentType, Month,
    SUM(Turnover) AS TotTurnover,
    SUM(Turnover) / COUNT(DISTINCT Date) AS AVGDailyTurnover,
    SUM(SUM(Turnover)) OVER (
        PARTITION BY Agency, CarModel, PaymentType, Year
        ORDER BY Month
        ROWS UNBOUNDED PRECEDING
    ) AS CumulativeYearlyTurnover
FROM STATS S, AGENCIES A, SPAREPARTS SP, TIME T
WHERE
    -- join
        S.AgencyID = A.AgencyID
    AND S.SparePartID = SP.SparePartID
    AND S.TimeID = T.TimeID
    --constraints
    AND State = 'Italy'
GROUP BY AgencyID, Agency, CarModel, PaymentType, Month, Year

-- QUERY (2) --
SELECT SparePart, Agency, Year,
    SUM(Turnover) AS TotTurnover
FROM STATS S, AGENCIES A, SPAREPARTS S, TIME T
WHERE
    -- join
        S.AgencyID = A.AgencyID
    AND S.SparePartID = SP.SparePartID
    AND S.TimeID = T.TimeID
    -- constraints
    AND State = 'China'
GROUP BY SparePartID, SparePart, AgencyID, Agency, Year

-- QUERY (3) --
SELECT SparePart, City, Region, Month,
    SUM(Turnover) AS CityMonthlyTurnover,
    COUNT() AS MonthlyDistributedSpareParts,
    SUM(SUM(Turnover)) OVER (PARTITION BY Region) AS RegionalTotMonthlyTurnover
FROM STATS S, AGENCIES A, SPAREPARTS S, TIME T
WHERE
    -- join
        S.AgencyID = A.AgencyID
    AND S.SparePartID = SP.SparePartID
    AND S.TimeID = T.TimeID
    -- constraints
    AND CarManufacturer = 'FIAT'
    AND Year = '2011'
    AND Continent = 'Europe'
GROUP BY SparePartID, SparePart, City, Region, Month

-- QUERY (4) --
SELECT 3M, SparePart, PaymentType,
    SUM(Turnover) AS TotTurnover
FROM STATS S, SPAREPARTS S, TIME T
WHERE
    -- join
        S.SparePartID = SP.SparePartID
    AND S.TimeID = T.TimeID
    -- constraints
    AND (Year = 2006 OR Year = 2007)
GROUP BY 3M, SparePartID, SparePart, PaymentType