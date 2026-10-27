CREATE DATABASE OrderDB;
USE OrderDB;
SET SQL_SAFE_UPDATES = 0;
SELECT @@SQL_SAFE_UPDATES;
CREATE TABLE SalesOrderLine (
    RecordID INT PRIMARY KEY,
    SalesOrderNo VARCHAR(10),
    LineNo INT,
    ItemCode VARCHAR(10),
    CustomerCode VARCHAR(10),
    OrderDate DATE,
    Qty INT,
    UnitPrice DECIMAL(10,2),
    LastModified DATETIME
);

INSERT INTO SalesOrderLine
(RecordID, SalesOrderNo, LineNo, ItemCode, CustomerCode, OrderDate, Qty, UnitPrice, LastModified)
VALUES
(1, 'SO1001', 1, 'A100', 'C001', '2026-01-01', 10, 25.00, '2026-01-01 09:00:00'),
(2, 'SO1001', 2, 'A200', 'C001', '2026-01-01', 5, 40.00, '2026-01-01 09:05:00'),
(3, 'SO1002', 1, 'A300', 'C002', '2026-01-02', 8, 35.00, '2026-01-02 10:00:00'),
(4, 'SO1003', 1, 'A400', 'C003', '2026-01-03', 12, 18.00, '2026-01-03 11:00:00'),
(5, 'SO1001', 1, 'A100', 'C001', '2026-01-01', 10, 25.00, '2026-01-01 09:30:00'),
(6, 'SO1002', 1, 'A300', 'C002', '2026-01-02', 9, 35.00, '2026-01-02 12:00:00'),
(7, 'SO1003', 1, 'A400', 'C003', '2026-01-03', 12, 18.00, '2026-01-03 11:15:00'),
(8, 'SO1004', 1, 'A500', 'C004', '2026-01-05', 20, 12.00, '2026-01-05 09:00:00'),
(9, 'SO1004', 1, 'A500', 'C004', '2026-01-05', 25, 12.00, '2026-01-05 14:00:00'),
(10, 'SO1005', 1, 'A600', 'C005', '2026-01-06', 15, 50.00, '2026-01-06 10:00:00');

with ranked as(
select *,
row_number() over(
partition by salesorderno, lineno
order by lastmodified desc
) as rn
from salesorderline),
abc as(
select recordid from ranked where rn >1)
delete e 
from salesorderline e
join abc a
where e.recordid = a.recordid;







WITH RankedRecords AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY SalesOrderNo, LineNo
               ORDER BY LastModified DESC, RecordID DESC
           ) AS rn
    FROM SalesOrderLine),
abc as(
select recordid from rankedrecords where rn > 1)
delete e 
from salesorderline e 
join abc a 
on a.recordid = e.recordid;

select * from salesorderline;

