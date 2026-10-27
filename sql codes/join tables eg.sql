use orderdb;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT NULL,
    ManagerID INT NULL,
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    DepartmentID INT
);

CREATE TABLE EmployeeProjects (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(30)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQty INT
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE SalaryBands (
    BandName VARCHAR(30) PRIMARY KEY,
    MinSalary DECIMAL(10,2),
    MaxSalary DECIMAL(10,2)
);

INSERT INTO Departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Sales'),
(40, 'Finance'),
(50, 'Research'),
(60, 'Customer Support');
INSERT INTO Employees VALUES
(1,  'Arjun',   10, NULL, 95000, '2022-01-10'),
(2,  'Priya',   10, 1,    78000, '2023-03-15'),
(3,  'Rahul',   20, 6,    62000, '2022-07-20'),
(4,  'Meera',   30, 7,    72000, '2023-05-12'),
(5,  'Karthik', 30, 4,    65000, '2024-02-01'),
(6,  'Divya',   20, 1,    88000, '2021-11-05'),
(7,  'Sanjay',  30, NULL, 95000, '2020-06-18'),
(8,  'Nisha',   NULL, 2,  52000, '2024-08-10'),
(9,  'Omar',    99, 1,    57000, '2023-12-01'),
(10, 'Kavya',   40, 1,    81000, '2022-09-25'),
(11, 'Ishan',   10, 1,    78000, '2024-04-14');
INSERT INTO Projects VALUES
(101, 'Website Revamp',       10),
(102, 'CRM Upgrade',          30),
(103, 'HR Portal',            20),
(104, 'Data Warehouse',       40),
(105, 'AI Pilot',             50),
(106, 'Support Automation',   60);
INSERT INTO EmployeeProjects VALUES
(1,  1,  101, 20),
(2,  2,  101, 30),
(3,  4,  102, 25),
(4,  5,  102, 15),
(5,  3,  103, 12),
(6,  6,  103, 20),
(7,  10, 104, 40),
(8,  2,  104, 10),
(9,  11, 101, 18);
INSERT INTO Customers VALUES
(101, 'Asha',   'Chennai'),
(102, 'Bharat', 'Bengaluru'),
(103, 'Charan', 'Hyderabad'),
(104, 'Deepa',  'Mumbai'),
(105, 'Esha',   'Pune'),
(106, 'Farhan', 'Delhi'),
(107, 'Gopal',  'Kolkata');
INSERT INTO Orders VALUES
(1001, 101, '2025-01-05',  2300, 'Shipped'),
(1002, 102, '2025-01-10',  4000, 'Processing'),
(1003, 101, '2025-02-02',   800, 'Shipped'),
(1004, 103, '2025-02-18', 12000, 'Delivered'),
(1005, 999, '2025-03-01',  1800, 'Pending'),
(1006, 104, '2025-03-15',  7000, 'Delivered'),
(1007, 102, '2025-04-01',  5800, 'Shipped'),
(1008, 106, '2025-04-10',  1500, 'Processing'),
(1009, 107, '2025-04-15',   300, 'Pending');
INSERT INTO Products VALUES
(201, 'Laptop',       'Electronics', 60000, 5),
(202, 'Mouse',        'Accessories',   800, 50),
(203, 'Keyboard',     'Accessories',  1500, 25),
(204, 'Monitor',      'Electronics', 12000, 0),
(205, 'Office Chair', 'Furniture',    7000, 8),
(206, 'Headphones',   'Electronics',  2500, 30),
(207, 'Webcam',       'Accessories',  1800, 10),
(208, 'Power Bank',   'Accessories',  2200, 0);
INSERT INTO OrderItems VALUES
(1,  1001, 202, 1,   800),
(2,  1001, 203, 1,  1500),
(3,  1002, 206, 1,  2500),
(4,  1002, 203, 1,  1500),
(5,  1003, 202, 1,   800),
(6,  1004, 204, 1, 12000),
(7,  1005, 207, 1,  1800),
(8,  1006, 205, 1,  7000),
(9,  1007, 206, 2,  2500),
(10, 1007, 202, 1,   800),
(11, 1008, 203, 1,  1500),
(12, 1009, 999, 1,   300);
INSERT INTO SalaryBands VALUES
('Associate', 0,     59999.99),
('Mid-Level', 60000, 79999.99),
('Senior',    80000, 999999.99);