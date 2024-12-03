-- SQL Server Comprehensive Tutorial

-- 1. SQL Server Introduction and Syntax
-- SQL Server is a relational database management system developed by Microsoft

-- 2. Basic SELECT Syntax
-- Select all columns from a table
SELECT * FROM Employees;

-- Select specific columns
SELECT FirstName, LastName, Salary FROM Employees;

-- 3. SELECT DISTINCT
-- Get unique values
SELECT DISTINCT Department FROM Employees;

-- 4. WHERE Clause (Filtering)
-- Basic filtering
SELECT * FROM Employees 
WHERE Salary > 50000;

-- Multiple conditions
SELECT * FROM Employees 
WHERE Department = 'Sales' AND Salary > 50000;

-- 5. ORDER BY (Sorting)
-- Ascending order
SELECT * FROM Employees 
ORDER BY LastName;

-- Descending order
SELECT * FROM Employees 
ORDER BY Salary DESC;

-- 6. Logical Operators
-- AND Operator
SELECT * FROM Employees 
WHERE Department = 'Sales' AND Salary > 50000;

-- OR Operator
SELECT * FROM Customers 
WHERE Country = 'USA' OR Country = 'Canada';

-- NOT Operator
SELECT * FROM Products 
WHERE NOT Price < 100;

-- 7. INSERT INTO
-- Insert single row
INSERT INTO Employees 
(FirstName, LastName, Department, Salary)
VALUES 
('John', 'Doe', 'IT', 60000);

-- Insert multiple rows
INSERT INTO Products 
(ProductName, Price, Category)
VALUES 
('Laptop', 1000, 'Electronics'),
('Smartphone', 500, 'Electronics');

-- 8. NULL Values
-- Check for NULL
SELECT * FROM Employees 
WHERE PhoneNumber IS NULL;

-- Check for NOT NULL
SELECT * FROM Employees 
WHERE PhoneNumber IS NOT NULL;

-- 9. UPDATE Statement
UPDATE Employees
SET Salary = 55000, Department = 'Marketing'
WHERE EmployeeID = 1;

-- 10. DELETE Statement
DELETE FROM Employees 
WHERE EmployeeID = 1;

-- 11. TOP Clause (Limit Results)
-- Get top 5 highest paid employees
SELECT TOP 5 * FROM Employees 
ORDER BY Salary DESC;

-- 12. Aggregate Functions
-- COUNT
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- MIN and MAX
SELECT 
    MIN(Salary) AS MinSalary, 
    MAX(Salary) AS MaxSalary 
FROM Employees;

-- SUM
SELECT SUM(Salary) AS TotalPayroll FROM Employees;

-- AVG
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- 13. LIKE and Wildcards
-- Find names starting with 'A'
SELECT * FROM Employees 
WHERE LastName LIKE 'A%';

-- Find names containing 'son'
SELECT * FROM Employees 
WHERE LastName LIKE '%son%';

-- 14. IN Operator
SELECT * FROM Employees 
WHERE Department IN ('Sales', 'Marketing', 'IT');

-- 15. BETWEEN Operator
SELECT * FROM Products 
WHERE Price BETWEEN 100 AND 1000;

-- 16. Aliases
SELECT 
    FirstName + ' ' + LastName AS FullName,
    Salary AS AnnualIncome
FROM Employees;

-- 17. JOIN Operations
-- INNER JOIN
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
INNER JOIN Departments 
ON Employees.DepartmentID = Departments.DepartmentID;

-- LEFT JOIN
SELECT 
    Customers.CustomerName,
    Orders.OrderID
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN
SELECT 
    Employees.FirstName,
    Orders.OrderID
FROM Employees
RIGHT JOIN Orders 
ON Employees.EmployeeID = Orders.EmployeeID;

-- FULL OUTER JOIN
SELECT 
    Customers.CustomerName,
    Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

-- 18. UNION
-- Combine result sets
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

-- 19. GROUP BY and HAVING
SELECT 
    Department, 
    AVG(Salary) AS AverageSalary,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 5;

-- 20. CASE Statement
SELECT 
    FirstName,
    LastName,
    Salary,
    CASE 
        WHEN Salary < 30000 THEN 'Entry Level'
        WHEN Salary BETWEEN 30000 AND 50000 THEN 'Mid Level'
        ELSE 'Senior Level'
    END AS SalaryCategory
FROM Employees;

-- 21. Stored Procedure Example
CREATE PROCEDURE GetEmployeesBySalary
    @MinSalary DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM Employees
    WHERE Salary > @MinSalary
END;

-- 22. CREATE DATABASE
CREATE DATABASE CompanyDatabase;

-- 23. CREATE TABLE with Constraints
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    HireDate DATE DEFAULT GETDATE(),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 24. ALTER TABLE
-- Add a new column
ALTER TABLE Employees
ADD PhoneNumber NVARCHAR(15);

-- 25. INDEX
CREATE INDEX idx_LastName
ON Employees (LastName);

-- 26. Data Types in SQL Server
-- Numeric Types: INT, BIGINT, DECIMAL, NUMERIC
-- String Types: CHAR, VARCHAR, NVARCHAR, TEXT
-- Date Types: DATE, DATETIME, SMALLDATETIME
-- Other Types: BINARY, MONEY, UNIQUEIDENTIFIER

-- 27. Views
CREATE VIEW HighSalaryEmployees AS
SELECT 
    FirstName, 
    LastName, 
    Salary, 
    Department
FROM Employees
WHERE Salary > 75000;

-- Notes on SQL Server-Specific Features:
-- 1. Uses T-SQL (Transact-SQL)
-- 2. IDENTITY column for auto-incrementing primary keys
-- 3. Uses square brackets for reserved keywords or complex names
-- 4. Different from MySQL or PostgreSQL in some syntax details

-- Best Practices:
-- 1. Use schema-bound names
-- 2. Implement proper indexing
-- 3. Use stored procedures for complex queries
-- 4. Implement proper error handling
-- 5. Be cautious with wildcard searches