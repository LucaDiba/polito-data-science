SELECT
    l.province,
    SUM(f.numberofcalls) AS TotalNumberOfCalls,
    100*(SUM(f.numberofcalls) / SUM(SUM(f.numberofcalls)) OVER (PARTITION BY l.region)) AS CallsNumberRespectOfRegion

FROM facts f, location l

WHERE
    -- JOIN CONDITIONS
        f.id_location_caller = l.id_location
        
GROUP BY l.province, l.region