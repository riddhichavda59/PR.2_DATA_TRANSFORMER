[5:28 pm, 02/11/2026] Archana R&W: CREATE DATABASE DataTransformer;

USE DataTransformer;

CREATE TABLE Customer_table (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE);

CREATE TABLE Order_table (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID)
    REFERENCES Customer_table(CustomerID));

CREATE TABLE Employee_table (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2));

INSERT INTO Customer_table VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

INSERT INTO Order_table VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

INSERT INTO Employee_table VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000);

SELECT * FROM Customer_table;

SELECT * FROM Order_table;

SELECT * FROM Employee_table;

DESC Customer_table;

DESC Order_table;

DESC Employee_table;

SELECT *
FROM Customer_table c
INNER JOIN Order_table o
ON c.CustomerID = o.CustomerID;

SELECT *
FROM Customer_table c
LEFT JOIN Order_table o
ON c.CustomerID = o.CustomerID;

SELECT *
FROM Customer_table c
RIGHT JOIN Order_table o
ON c.CustomerID = o.CustomerID;

SELECT *
FROM Customer_table c
LEFT JOIN Order_table o
ON c.CustomerID = o.CustomerID
UNION
SELECT *
FROM Customer_table c
RIGHT JOIN Order_table o
ON c.CustomerID = o.CustomerID;

SELECT *
FROM Order_table O
WHERE O.TotalAmount > (
    SELECT AVG(O2.TotalAmount)
    FROM Order_table O2);

SELECT *
FROM Employee_table e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee_table e2);

SELECT
    o.OrderID,
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
FROM Order_table o;

SELECT
    o.OrderID,
    DATEDIFF(CURDATE(), o.OrderDate)
FROM Order_table o;

SELECT
    o.OrderID,
    DATE_FORMAT(o.OrderDate, '%d-%b-%Y')
FROM Order_table o;

SELECT
    CONCAT(c.FirstName, ' ', c.LastName)
FROM Customer_table c;

SELECT
    REPLACE(c.FirstName, 'John', 'Jonathan')
FROM Customer_table c;

SELECT
    UPPER(e.FirstName),
    LOWER(e.LastName)
FROM Employee_table e;

SELECT
    TRIM(e.FirstName),
    TRIM(e.LastName)
FROM Employee_table e;

SELECT
    o.OrderID,
    o.TotalAmount,
    SUM(o.TotalAmount) OVER (
        ORDER BY o.OrderID)
FROM Order_table o;

SELECT
    o.OrderID,
    o.TotalAmount,
    RANK() OVER (
        ORDER BY o.TotalAmount DESC)
FROM Order_table o;

SELECT
    o.OrderID,
    o.TotalAmount,
    CASE
        WHEN o.TotalAmount > 1000 THEN '10% Off'
        WHEN o.TotalAmount > 500 THEN '5% Off'
        ELSE 'No Discount'
    END
FROM Order_table o;

SELECT
    e.FirstName,
    e.Salary,
    CASE
        WHEN e.Salary >= 80000 THEN 'High'
        WHEN e.Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END
FROM Employee_table e;

