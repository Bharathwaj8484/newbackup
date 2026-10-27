CREATE TABLE Employees (
    EmployeeID INT,
    HireDate DATE,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
select * from employees;

INSERT INTO Employees (EmployeeID, HireDate, Department, Salary)
VALUES
(1, '2025-01-05', 'IT', 40000),
(2, '2025-01-12', 'HR', 30000),
(3, '2025-01-20', 'IT', 45000),
(4, '2025-02-03', 'Finance', 35000),
(5, '2025-02-08', 'IT', 50000),
(6, '2025-03-02', 'HR', 32000),
(7, '2025-03-10', 'IT', 55000),
(8, '2025-03-22', 'Finance', 40000),
(9, '2025-04-05', 'IT', 60000),
(10, '2025-04-15', 'HR', 35000),
(11, '2025-04-20', 'Finance', 42000);

WITH monthlyhire AS (
    SELECT
        DATE_FORMAT(hiredate, '%Y-%m') AS hireperiod,
		CAST(COUNT(*) AS decimal(10,2)) AS empcount
    FROM employees
    GROUP BY DATE_FORMAT(hiredate, '%Y-%m')
    order by hireperiod
)
select hireperiod,empcount,concat(hireperiod,'/',empcount), ROUND((empcount - lag(empcount) over())  * 100/ lag(empcount) over() ,2) as growthper, 
(empcount - lag(empcount) over()) as hirechange 
from monthlyhire;


