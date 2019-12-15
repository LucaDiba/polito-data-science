SELECT
    l.region,
    t.datemonth,
    SUM(f.numberofcalls),
    SUM(SUM(f.numberofcalls)) OVER (
        PARTITION BY l.region, t.dateyear
        ORDER BY t.datemonth
        ROWS UNBOUNDED PRECEDING
    ) AS CumulativeMonthlyCalls
    

FROM facts f, location l, timedim t

WHERE
    -- JOIN CONDITIONS
        f.id_location_receiver = l.id_location
    AND f.id_time = f.id_time

GROUP BY l.region, t.datemonth, t.dateyear

ORDER BY l.region, t.dateyear, t.datemonth