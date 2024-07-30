create database Arvind;

use arvind;

CREATE TABLE McDonalds (
    `Year` INT,
    `Market cap ($B)` DECIMAL(10, 2),
    `Revenue ($B)` DECIMAL(10, 2),
    `Earnings ($B)` DECIMAL(10, 2),
    `P/E ratio` DECIMAL(5, 2),
    `P/S ratio` DECIMAL(5, 2),
    `P/B ratio` DECIMAL(5, 2),
    `Operating Margin (%)` DECIMAL(5, 2),
    `EPS ($)` DECIMAL(5, 2),
    `Shares Outstanding ($B)` DECIMAL(10, 2),
    `Cash on Hand ($B)` DECIMAL(10, 2),
    `Dividend Yield (%)` DECIMAL(5, 2),
    `Dividend (stock split adjusted) ($)` DECIMAL(5, 2),
    `Net assets ($B)` DECIMAL(10, 2),
    `Total assets ($B)` DECIMAL(10, 2),
    `Total debt ($B)` DECIMAL(10, 2),
    `Total liabilities ($B)` DECIMAL(10, 2)
);


/*
Problem 1: Write a query to retrieve the Year and Revenue ($B) for all records.
*/

SELECT `Year`, 
       `Revenue ($B)` 
FROM McDonalds;


/* Problem 2: Conditional Query
Task: Write a query to retrieve the Year, Market cap ($B), and Revenue ($B) for years where the Revenue ($B) is greater than $20 billion.*/

select Year, `Market cap ($B)`, `Revenue ($B)` 
from Mcdonalds where `Revenue ($B)`> 20;


/*Problem 3: Aggregation
Task: Write a query to find the average Earnings ($B) over all the years.
*/

select avg(`Earnings ($B)`) as Average_Earnging from Mcdonalds;


/*Problem 4: Filtering and Ordering
Task: Write a query to find the top 5 years with the highest Operating Margin (%).
*/

select `Year`, `Operating Margin (%)` from McDonalds order by `Operating Margin (%)` desc Limit 5;



/*Problem 5: Grouping and Aggregation
Task: Write a query to calculate the total Dividend (stock split adjusted) ($) for all years combined.*/

select sum(`Dividend (stock split adjusted) ($)`) as totaldividend from McDonalds;


/*Problem 6: Conditional Aggregation
Task: Write a query to find the average P/E ratio for years where the Dividend Yield (%) is greater than 2%.*/

select avg(`P/E ratio`) as averageratio from McDonalds where `Dividend Yield (%)` > 2;

/*Problem 7: Subquery
Task: Write a query to find the Year and Revenue ($B) for the year with the highest Market cap ($B).*/

select `Year`, `Revenue ($B)` from McDonalds where `Market cap ($B)` = (select max(`Market cap ($B)`) from McDonalds);


/*Problem 8: Derived Columns
Task: Write a query to calculate the Debt to Equity Ratio (Total debt / Net assets) for each year and display it alongside the Year.*/

select `Year`, (`Total Debt ($B)` / `Net Assets ($B)`) as debtToequityratio from McDonalds;


/*Problem 9: Window Functions
Task: Write a query to calculate the running total of Earnings ($B) over the years.*/

select `Year`, `Earnings ($B)`, sum(`Earnings ($B)`) over (order by `year` asc) as runningtotal from McDonalds order by `year` asc;



/*Problem 10: Complex Aggregation
Task: Write a query to find the average Operating Margin (%), P/E ratio, and P/B ratio for the first half (2002-2012) and the second half (2013-2022) of the time period.*/


SELECT
    -- Averages for the first half (2002-2012)
    AVG(CASE WHEN `year` BETWEEN 2002 AND 2012 THEN `Operating margin (%)` ELSE NULL END) AS avg_operating_margin_firsthalf,
    AVG(CASE WHEN `year` BETWEEN 2002 AND 2012 THEN `P/E ratio` ELSE NULL END) AS avg_PEratio_firsthalf,
    AVG(CASE WHEN `year` BETWEEN 2002 AND 2012 THEN `P/B ratio` ELSE NULL END) AS avg_PBratio_firsthalf,

    -- Averages for the second half (2013-2022)
    AVG(CASE WHEN `year` BETWEEN 2013 AND 2022 THEN `Operating margin (%)` ELSE NULL END) AS avg_operating_margin_secondhalf,
    AVG(CASE WHEN `year` BETWEEN 2013 AND 2022 THEN `P/E ratio` ELSE NULL END) AS avg_PEratio_secondhalf,
    AVG(CASE WHEN `year` BETWEEN 2013 AND 2022 THEN `P/B ratio` ELSE NULL END) AS avg_PBratio_secondhalf
FROM
    McDonalds;




/*Problem 11: Ranking
Task: Write a query to rank the years by EPS ($) in descending order.*/

select `Year`, `EPS ($)`, rank() over(order by `eps ($)` desc) as ranks from McDonalds order by ranks;

/*Problem 12: Case Statement
Task: Write a query to categorize each year based on Operating Margin (%) into 'Low' (<20%), 'Medium' (20%-40%), and 'High' (>40%).*/

select `year`, `operating margin (%)`, case when `operating margin (%)` <20 then 'low'
 when `operating margin (%)` between 20 and 40 then 'Medium'
 when `operating margin (%)` >40 then 'High'
 else 'unknown'
 end as margin
 from mcdonalds;



/*Problem 13: Filtering
Task: Write a query to find all years where Total liabilities ($B) are greater than Total assets ($B).*/
select `year`,
 `total liabilities ($B)`, 
 `total assets ($B)` from mcdonalds
where `total liabilities ($B)` > `total assets ($B)`;