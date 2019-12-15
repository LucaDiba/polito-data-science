SELECT
    p.phoneratetype,
    t.datemonth,
    SUM(f.price) AS TotalIncome,
    100*(SUM(f.price) / SUM(SUM(f.price)) OVER (PARTITION BY t.datemonth)) AS PercentageRespectToAllRates,
    100*(SUM(f.price) / SUM(SUM(f.price)) OVER () ) AS PercentageRespectToAllMonths
    

FROM facts f, timedim t, phonerate p

WHERE
    -- JOINS
        f.id_time = t.id_time
    AND f.id_phonerate = p.id_phonerate
    
    -- OTHER CONDITIONS
    AND t.dateyear = '2003'
    
GROUP BY
    p.phoneratetype,
    t.datemonth