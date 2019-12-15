SELECT P.PHONERATETYPE,
        t.datemonth,
        AVG(f.price) AS AVGDailyIncome,
        AVG(f.price / f.numberofcalls) AS AVGNumberOfCalls

FROM FACTS F, TIMEDIM T, PHONERATE P

WHERE
    -- JOINS
        f.id_time = t.id_time
    AND f.id_phonerate = p.id_phonerate
    
    -- OTHER CONDITIONS    
    AND T.DATEYEAR = '2003'

GROUP BY P.ID_PHONERATE, P.PHONERATETYPE, t.datemonth