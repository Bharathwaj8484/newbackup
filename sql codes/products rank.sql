CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    ReleaseDate DATE,
    Price DECIMAL(10,2)
);

INSERT INTO Products
    (ProductID, ProductName, Category, ReleaseDate, Price)
VALUES
(1, 'Galaxy S25', 'Electronics', '2025-01-15', 79999),
(2, 'Pixel 9', 'Electronics', '2024-08-20', 74999),
(3, 'iPhone 16', 'Electronics', '2024-09-10', 79999),
(4, 'OnePlus 13', 'Electronics', '2025-02-05', 69999),
(5, 'Tablet X', 'Electronics', '2025-03-12', 69999),
(6, 'Smart TV', 'Electronics', '2024-06-18', 89999),
(7, 'Washing Machine', 'Home Appliances', '2025-01-10', 45999),
(8, 'Refrigerator', 'Home Appliances', '2024-04-12', 52999),
(9, 'Dishwasher', 'Home Appliances', '2024-07-22', 52999),
(10, 'Air Conditioner', 'Home Appliances', '2025-03-15', 48999),
(11, 'Microwave', 'Home Appliances', '2025-05-20', 18999),
(12, 'Sofa', 'Furniture', '2024-02-15', 65000),
(13, 'Recliner', 'Furniture', '2025-04-10', 48000),
(14, 'Dining Table', 'Furniture', '2024-06-25', 65000),
(15, 'Wardrobe', 'Furniture', '2025-02-12', 52000),
(16, 'Office Desk', 'Furniture', '2025-07-05', 30000);


select max(price) as mp ,category from products group by category order by mp desc limit 2  ;

select * from (
select * , 
row_number() over(
partition by category, year(releasedate)
order by price Desc)
as ranks from products) as rn
where ranks <=3;