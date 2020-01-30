Note: "`*`" means "primary key"

#### Fact table
```DOWNLOADS(#Downloads, €Income, TotDownloadTime, *SongID, *PaymentMethod, *CityID, *Timeslot, *TimeOfDay, *TimeID)```

#### Attributes

```SONGS(*SongID, Song, Singer, Nationality, Label, Author, Genre, Album, RecordingYear)```

```CITIES(*CityID, City, Province, Region, Country)```

```TIME(*TimeID, Date, Month, 3M, 4M, 6M, Year)```