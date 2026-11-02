-- =========================================================
-- PROJECT: DATA TRANSFORMER
-- Database: MySQL 8.0+
-- Description: Customers, Orders and Employees data analysis
-- =========================================================

CREATE DATABASE IF NOT EXISTS DataTransformer;
USE DataTransformer;

-- Drop old tables so the complete script can be run again.
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;

-- =========================================================
-- 1. CREATE CUSTOMERS TABLE
-- =========================================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- =========================================================
-- 2. CREATE ORDERS TABLE
-- =========================================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- =========================================================
-- 3. CREATE EMPLOYEES TABLE
-- =========================================================
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- =========================================================
-- INSERT SAMPLE DATA
-- Original sample rows from the assignment are included.
-- Extra rows are added to demonstrate all query conditions.
-- =========================================================

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', ' john.doe@email.com ', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2023-01-10'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2024-05-20');

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-10', 750.00),
(104, 3, '2023-08-15', 1250.00),
(105, 2, '2023-09-05', 600.00);

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Wilson', 'IT', '2022-06-10', 45000.00),
(4, 'Emma', 'Clark', 'Finance', '2019-11-05', 70000.00);

-- =========================================================
-- CHECK TABLE DATA
-- =========================================================
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Employees;

-- =========================================================
-- TASK 1: INNER JOIN
-- Retrieve orders and customer details where orders exist.
-- =========================================================
SELECT
    Orders.OrderID,
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- =========================================================
-- TASK 2: LEFT JOIN
-- Retrieve all customers and their orders, if any.
-- =========================================================
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- =========================================================
-- TASK 3: RIGHT JOIN
-- Retrieve all orders and their corresponding customers, if any.
-- =========================================================
SELECT
    Orders.OrderID,
    Orders.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- =========================================================
-- TASK 4: FULL OUTER JOIN
-- MySQL does not directly support FULL OUTER JOIN.
-- UNION combines LEFT JOIN results and unmatched RIGHT JOIN rows.
-- =========================================================
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- =========================================================
-- TASK 5: SUBQUERY
-- Find customers who have placed orders worth more than
-- the average order amount.
-- =========================================================
SELECT DISTINCT
    CustomerID,
    FirstName,
    LastName,
    Email
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > (
        SELECT AVG(TotalAmount)
        FROM Orders
    )
);

-- =========================================================
-- TASK 6: SUBQUERY
-- Find employees whose salary is above the average salary.
-- =========================================================
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- =========================================================
-- TASK 7: DATE FUNCTIONS
-- Extract year and month from OrderDate.
-- =========================================================
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- =========================================================
-- TASK 8: DATE FUNCTION
-- Calculate days between OrderDate and current date.
-- =========================================================
SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

-- =========================================================
-- TASK 9: DATE FORMAT
-- Display OrderDate in DD-MM-YYYY format.
-- =========================================================
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedOrderDate
FROM Orders;

-- =========================================================
-- TASK 10: STRING FUNCTION
-- Join FirstName and LastName to make a full name.
-- =========================================================
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- =========================================================
-- TASK 11: STRING FUNCTION
-- Replace John with Jonathan in FirstName.
-- =========================================================
SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

-- =========================================================
-- TASK 12: STRING FUNCTIONS
-- Convert FirstName to uppercase and LastName to lowercase.
-- =========================================================
SELECT
    CustomerID,
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;

-- =========================================================
-- TASK 13: STRING FUNCTION
-- Remove extra spaces from Email.
-- =========================================================
SELECT
    CustomerID,
    Email AS OriginalEmail,
    TRIM(Email) AS CleanEmail
FROM Customers;

-- =========================================================
-- TASK 14: WINDOW FUNCTION
-- Calculate running total of TotalAmount for each order.
-- =========================================================
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Orders;

-- =========================================================
-- TASK 15: WINDOW FUNCTION
-- Rank orders based on TotalAmount using RANK().
-- Highest amount gets rank 1.
-- =========================================================
SELECT
    OrderID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

-- =========================================================
-- TASK 16: CASE EXPRESSION
-- Give 10% discount if amount > 1000.
-- Give 5% discount if amount > 500.
-- Otherwise no discount.
-- =========================================================
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN 10
        WHEN TotalAmount > 500 THEN 5
        ELSE 0
    END AS DiscountPercent,
    ROUND(
        TotalAmount *
        CASE
            WHEN TotalAmount > 1000 THEN 0.10
            WHEN TotalAmount > 500 THEN 0.05
            ELSE 0
        END,
        2
    ) AS DiscountAmount,
    ROUND(
        TotalAmount -
        (TotalAmount *
        CASE
            WHEN TotalAmount > 1000 THEN 0.10
            WHEN TotalAmount > 500 THEN 0.05
            ELSE 0
        END),
        2
    ) AS FinalAmount
FROM Orders;

-- =========================================================
-- TASK 17: CASE EXPRESSION
-- Categorize employee salaries as High, Medium or Low.
-- Assumption:
-- High   = 55000 or more
-- Medium = 50000 to 54999.99
-- Low    = below 50000
-- =========================================================
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 55000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

-- =========================================================
-- PROJECT COMPLETED
-- All 17 tasks from the Data Transformer assignment are covered.
-- =========================================================
