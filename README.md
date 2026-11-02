📊 Data Transformer
SQL Project | MySQL 8.0+
📌 Project Overview
Data Transformer is a SQL-based data analysis project that demonstrates how relational data can be retrieved, combined, transformed, and analysed using MySQL.

The project represents a simple corporate data analysis system. It works with customer information, sales orders, and employee records. By completing the assigned tasks, we practise important SQL concepts used in real-world reporting and data analysis.
🎯 Project Objective
The main objective of this project is to build practical knowledge of SQL by working with three related tables and performing different data operations.

This project focuses on:
- Retrieving information from multiple tables.
- Finding records using subqueries.
- Extracting and formatting date values.
- Cleaning and modifying text data.
- Calculating running totals and rankings.
- Applying conditions to classify data and calculate discounts.
🗂️ Database Information
Detail	Description
Project Name	Data Transformer
Database Name	DataTransformer
Database Language	SQL
Database System	MySQL
Recommended Version	MySQL 8.0 or later
Tool	MySQL Workbench


🧱 Database Tables
The database contains three main tables.
1. Customers
This table stores the personal and registration details of customers.
Column	Description
CustomerID	Unique ID of each customer
FirstName	Customer's first name
LastName	Customer's last name
Email	Customer's email address
RegistrationDate	Date when the customer registered


2. Orders
This table stores order and sales transaction information.
Column	Description
OrderID	Unique ID of each order
CustomerID	ID of the customer who placed the order
OrderDate	Date when the order was placed
TotalAmount	Total value of the order


Relationship: CustomerID connects the Orders table with the Customers table.
3. Employees
This table stores employee and salary information.
Column	Description
EmployeeID	Unique ID of each employee
FirstName	Employee's first name
LastName	Employee's last name
Department	Employee's department
HireDate	Employee's joining date
Salary	Employee's salary


📝 Tasks Performed
All 17 tasks from the project assignment are covered.
A. JOIN Operations
1. INNER JOIN – Displays orders with their matching customer details.
2. LEFT JOIN – Displays all customers and their orders, if available.
3. RIGHT JOIN – Displays all orders and their corresponding customer details.
4. FULL OUTER JOIN – Displays matching and non-matching records from both tables.
B. Subqueries
5. Finds customers who have placed orders greater than the average order amount.
6. Finds employees whose salaries are greater than the average employee salary.
C. Date Functions
7. Extracts the year and month from the order date.
8. Calculates the number of days between the order date and the current date.
9. Formats the order date into DD-MM-YYYY format.
D. String Functions
10. Combines the first name and last name to create a full name.
11. Replaces the name John with Jonathan.
12. Converts first names to uppercase and last names to lowercase.
13. Removes extra spaces from customer email addresses.
E. Window Functions
14. Calculates the running total of order amounts.
15. Ranks orders according to their total amount using the RANK() function.
F. CASE Expressions
16. Calculates order discounts according to the order amount:
    - More than 1000: 10% discount
    - More than 500: 5% discount
    - 500 or less: No discount
17. Categorizes employee salaries as High, Medium, or Low.
🛠️ SQL Concepts and Functions Used
Category	SQL concepts / functions
Table operations	CREATE DATABASE, CREATE TABLE, INSERT INTO
Joins	INNER JOIN, LEFT JOIN, RIGHT JOIN, UNION
Subqueries	Nested SELECT statements, AVG()
Date functions	YEAR(), MONTH(), CURDATE(), DATEDIFF(), DATE_FORMAT()
String functions	CONCAT(), REPLACE(), UPPER(), LOWER(), TRIM()
Aggregate functions	AVG(), SUM()
Window functions	SUM() OVER(), RANK() OVER()
Conditional logic	CASE


▶️ How to Run the Project
Follow these steps to execute the project in MySQL Workbench:
1. Install and open MySQL Server and MySQL Workbench.
2. Open the file named Data_Transformer.sql.
3. Connect to your MySQL database server.
4. Open the SQL script in a query tab.
5. Execute the complete script using the lightning icon.
6. Refresh the Schemas panel.
7. Open the DataTransformer database.
8. Expand the Tables section to view Customers, Orders, and Employees.
9. Run the SELECT queries and check their results in the output grid.
📂 Project Files
The project folder contains:
- Data_Transformer.sql – Contains the database creation, sample data, and all 17 SQL tasks.
- README.md – Contains the project overview, table details, SQL concepts, assumptions, and execution instructions.
📋 Assumptions and Notes
- The project is designed for MySQL 8.0 or later.
- The sample records provided in the assignment are included.
- Additional sample records are added to demonstrate different query results, including customers who do not have orders.
- MySQL does not directly support FULL OUTER JOIN. Therefore, this task is performed using LEFT JOIN, RIGHT JOIN, and UNION.
- Salary categories are defined as:
  - High: Salary is 55,000 or above.
  - Medium: Salary is 50,000 or above but below 55,000.
  - Low: Salary is below 50,000.
- The date difference result changes according to the current date.
- The SQL script drops and recreates the project tables when executed. Back up any important existing data before running it again.
✅ Expected Outcome
After successfully executing the project:
- The DataTransformer database will be created.
- Three tables will be available: Customers, Orders, and Employees.
- Sample data will be inserted into all three tables.
- All 17 assigned SQL tasks will be executed.
- Results will demonstrate how SQL can be used to combine, filter, transform, and analyse business data.
🎓 Learning Outcomes
By completing this project, students can understand:
- How relational tables are connected.
- How to retrieve data using different JOIN operations.
- How subqueries help solve data-related questions.
- How to work with date and string functions.
- How window functions calculate running totals and rankings.
- How CASE expressions apply business rules to data.
🙏 Conclusion
The Data Transformer project provides practical experience with important SQL operations. It helps develop a strong foundation in database querying and data analysis. These concepts are useful for working with business data, preparing reports, and solving real-world data problems.

Project: Data Transformer
Technology: MySQL
Purpose: SQL Practice and Data Analysis
