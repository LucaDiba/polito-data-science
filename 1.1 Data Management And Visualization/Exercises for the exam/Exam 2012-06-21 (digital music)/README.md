Course: "Data Science And Database Technology"  
Exam of the 21/06/2012

## Data Warehouse design
The digital music market is booming and Internet platforms offering legal music downloads grow day by day. Each platform collects data on all the latest song downloads requested by customers. To evaluate the profitability of this new market and predict future developments, a data warehouse providing an overview of the current trends and usage insights is required. In particular, the data warehouse must be designed to analyze:  
- the average download time per song,
- the average daily downloads (number of songs),
- the average daily income per song.

Analysis must be performed according to: 
- date, month, quarter, 4-month period, 6-month period, year of the download,
- time slot (8:00-12:00, 12:00-16:00, 16:00-20:00, etc.) and time of the day (a.m., or p.m.) of the download,
- song, record label (i.e., the company publishing the song), album where the song was published, year of recording of the album,
- song author,
- musical genre of the song,
- singer or band, and their nationality,
- city, province, region, and country of the customer who downloaded the song,
- payment method (credit card, pre-paid, etc.). 

The data warehouse contains data related to the years 2007, 2008, 2009, 2010, and 2011. The data warehouse must allow efficient execution of all the following queries:
1) Considering only downloads in the second quarter of 2010, of customers from the Abruzzo region, select the total number of downloaded songs and the average download time per song, separately for each album.
2) For each author and for each time slot, select the total number of downloaded songs, separately for each record label. Sort and rank the results for increasing total download number.
3) For each song authored by Italian singers/bands and considering only downloads in 2011, for each month select the total income, the average daily income, the average daily number of downloads, and the cumulative number of downloads since the beginning of the year, separately for each musical genre.