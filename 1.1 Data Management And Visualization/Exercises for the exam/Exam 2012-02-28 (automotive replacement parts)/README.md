Course: "Data Science And Database Technology"  
Exam of the 28/02/2012

## Data Warehouse design
An international company distributes automotive replacement parts (e.g., lamps, suspensions, brakes, and other spare parts). The company would like to evaluate the distribution efficiency of its agencies around the world by analyzing the turnover of each agency andtheir distribution policies. A spare part can be used for a single car model, while the same car model can use different spare parts. In addition, a spare part can be distributed to several agencies and the same agency can deploy multiple parts.

Currently, each agency has an independent database to manage his business, but the company is interested in designing and implementing a data warehouse allowing to analyze the average daily turnover and average revenue for spare part of its agencies. The analysis has to be performed according to:
- date, month, three-month period, four-month period, semester, year of the turnover,
- holiday, day of the week, day of the month,
- agency
- payment method, which means both the payment type (e.g., credit card, bank transfer, etc.) and the payment time (within 30 days, 60 days, etc.),
- spare part, and its type,
- car model (e.g., Punto, Golf, Focus, etc.) where the spare part can be used,
- car manufacturer (e.g., FIAT, Volkswagen, Ford, etc.) where the spare part can be used,
- spare model and manufacturer,
- city, region, state and continent where the agency is located.

The following are some of the frequent analyses the company is interested in:
1) Considering only Italian agencies, for each agency and each car model, select the monthly turnover, the average daily turnover for each month, and thecumulative monthly turnover since the beginning of the year, separately for each payment type.
2) For each spare part, select the total yearly turnover foreach Cinese agency.
3) For each spare part of cars manufactured by FIAT and considering only the turnover of the European agencies in 2011, for each city where an agency is located, select the monthly turnover, the monthly number of distributed spare parts, and the total monthly turnover for the region where the agency is located.
4) For each three-month period in 2006 and 2007, select the total turnover and the average turnover per spare part, separately for each payment type.