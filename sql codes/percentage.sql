-- Create Database
CREATE DATABASE salesdb2;

-- Use Database
USE salesdb2;

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    CustomerID INT,
    SalesAmount DECIMAL(10,2)
);

-- Insert Records
INSERT INTO Sales (SaleID, SaleDate, CustomerID, SalesAmount)
VALUES
(1, '2025-01-05', 101, 1000),
(2, '2025-01-12', 102, 2500),
(3, '2025-01-20', 103, 1500),
(4, '2025-02-03', 101, 1800),
(5, '2025-02-08', 104, 2200),
(6, '2025-02-18', 105, 2500),
(7, '2025-03-02', 101, 3500),
(8, '2025-03-10', 106, 1800),
(9, '2025-03-22', 107, 1700),
(10, '2025-04-05', 102, 5000);

with msales as(
select year(saledate) as syear,
month(saledate) as smonth,
sum(salesamount) as totalsales
from sales
group by syear, smonth
),
salesgrowth as(
select syear, smonth,totalsales, lag(totalsales)
over (order by syear, smonth ) as pvmonth from msales) 
select 
syear, smonth,pvmonth, totalsales, totalsales -pvmonth as changeinsales,
round (((totalsales -pvmonth)  * 100) / NULLIF(pvmonth,0), 2) as pregrowth
from salesgrowth order by syear, smonth;

