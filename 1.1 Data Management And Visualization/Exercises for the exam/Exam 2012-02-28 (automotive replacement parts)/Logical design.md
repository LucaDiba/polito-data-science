Note: "`*`" means "primary key"

#### Fact table
```STATS(Turnover, Revenue, *AgencyID, *PaymentType, *PaymentTime, *SparePartID, *TimeID)```

#### Attributes

```AGENCIES(*AgencyID, Agency, City, Region, State, Continent)```

```SPAREPARTS(*SparePartID, SparePart, SparePartType, SparePartModel, SparePartManufacturer, CarModel, CarManufacturer)```

```TIME(*TimeID, Date, Holiday, DayOfWeek, DayOfMonth, 3M, 4M, 6M, Year)```