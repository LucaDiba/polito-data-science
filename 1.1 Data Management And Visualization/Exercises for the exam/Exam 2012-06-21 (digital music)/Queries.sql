-- QUERY (1) --
SELECT Album,
    SUM(#Downloads) AS TotDownloads,
    SUM(TotDownloadTime) / SUM(#Downloads) AS DownloadTimePerDownload
FROM DOWNLOADS D, SONGS S, TIME T, CITIES C
WHERE
    -- join
        D.SongID = S.SongID
    AND D.TimeID = T.TimeID
    AND D.CityID = C.CityID
    -- constraints
    AND 3M = '2Q-2010'
    AND Region = 'Abruzzo'
GROUP BY Album

-- QUERY (2) --
SELECT Author, Timeslot, Label,
    SUM(#Downloads) AS TotDownloads,
    RANK() OVER (ORDER BY SUM(#Downloads) DESC) AS Rank
FROM DOWNLOADS D, SONGS S
WHERE
    -- join
        D.SongID = S.SongID
GROUP BY Author, Timeslot, Label
ORDER BY TotDownloads DESC

-- QUERY (3) --
SELECT Month, Year, Song, Genre,
    SUM(€Income) AS TotIncome,
    SUM(€Income) / COUNT(DISTINCT Date) AS AVGDailyIncome,
    SUM(#Downloads) / COUNT(DISTINCT Date) AS AVGDailyDownloads,
    SUM(SUM(#Downloads)) OVER (
        PARTITION BY Year, Genre
        ORDER BY MONTH
        ROWS UNBOUNDED PRECEDING
    ) AS CumulativeYearlyTotDownloads
FROM DOWNLOADS D, TIME T, SONGS S
WHERE
    -- join
        D.TimeID = T.TimeID
    AND D.SongID = S.SongID
    -- constraints
    AND Nationality = 'Italian'
    AND Year = '2011'
GROUP BY Month, Year, Song, Genre