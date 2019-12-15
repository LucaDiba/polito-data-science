SELECT l.province, l.region, t.dayofmonth,
    AVG(f.numberofcalls) AS DailyNumberOfCallsForProvince,
    AVG(AVG(f.numberofcalls)) OVER (PARTITION BY l.region, t.dayofmonth) AS DailyNumberOfCallsForRegion

FROM FACTS F, LOCATION L, timedim T

WHERE
    -- JOINS
        f.id_location_caller = l.id_location
    AND f.id_time = t.id_time

GROUP BY l.province, l.region, t.dayofmonth