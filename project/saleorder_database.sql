-- Create Database
CREATE DATABASE SaleOrder;

-- Use Database
USE SaleOrder;

-- Create Customer Table
CREATE TABLE customer (
CustomerID INT NOT NULL PRIMARY KEY,
CustomerFirstName VARCHAR(50) NOT NULL,
CustomerLastName VARCHAR(50) NOT NULL,
CustomerAddress VARCHAR(50) NOT NULL,
CustomerSuburb VARCHAR(50),
CustomerCity VARCHAR(50) NOT NULL,
CustomerPostCode CHAR(4),
CustomerPhoneNumber CHAR(12)
);

-- Create Inventory Table
CREATE TABLE inventory (
InventoryID TINYINT NOT NULL PRIMARY KEY,
InventoryName VARCHAR(50) NOT NULL,
InventoryDescription VARCHAR(255)
);

-- Create Employee Table
CREATE TABLE employee (
EmployeeID TINYINT NOT NULL PRIMARY KEY,
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeExtension CHAR(4)
);

-- Create Sale Table
CREATE TABLE sale (
SaleID TINYINT NOT NULL PRIMARY KEY,
CustomerID INT NOT NULL,
InventoryID TINYINT NOT NULL,
EmployeeID TINYINT NOT NULL,
SaleDate DATE NOT NULL,
SaleQuantity INT NOT NULL,
SaleUnitPrice DECIMAL(10,2) NOT NULL,

```
FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
FOREIGN KEY (InventoryID) REFERENCES inventory(InventoryID),
FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID)
```

);

-- Check Tables
SHOW TABLES;

-- View First 2 Rows
SELECT * FROM customer
LIMIT 2;

-- View Specific Columns
SELECT CustomerFirstName, CustomerLastName
FROM customer
ORDER BY CustomerLastName DESC;

-- Distinct Values
SELECT DISTINCT CustomerLastName
FROM customer
ORDER BY CustomerLastName;

-- Save Result into Another Table
CREATE TABLE temp AS
SELECT DISTINCT CustomerLastName
FROM customer;

SELECT * FROM temp;

-- LIKE
SELECT *
FROM customer
WHERE CustomerLastName LIKE '_r%';

-- IN
SELECT *
FROM customer
WHERE CustomerLastName IN ('Brown','Michael','Jim');

-- Greater Than
SELECT *
FROM customer
WHERE CustomerLastName > 'Brown';

-- Not Equal
SELECT *
FROM customer
WHERE CustomerLastName <> 'Brown';

-- IS NULL
SELECT *
FROM customer
WHERE CustomerLastName IS NULL;

-- IS NOT NULL
SELECT *
FROM customer
WHERE CustomerLastName IS NOT NULL;

-- BETWEEN
SELECT *
FROM sale
WHERE SaleUnitPrice BETWEEN 5 AND 10;

-- COUNT
SELECT COUNT(*) AS NumberOfRecords
FROM customer
WHERE CustomerFirstName LIKE 'B%';

-- SUM + GROUP BY
SELECT
sale.EmployeeID,
EmployeeFirstName,
EmployeeLastName,
COUNT(*) AS NumberOfOrders,
SUM(SaleQuantity) AS TotalQuantity
FROM sale
JOIN employee
ON sale.EmployeeID = employee.EmployeeID
GROUP BY
sale.EmployeeID,
EmployeeFirstName,
EmployeeLastName;

-- Monthly Sales Summary
SELECT
MONTH(SaleDate) AS MonthNo,
COUNT(*) AS NumberOfSales,
SUM(SaleQuantity * SaleUnitPrice) AS TotalAmount
FROM sale
GROUP BY MONTH(SaleDate);

-- MAX
SELECT MAX(Salary)
FROM EmployeeSalary;

-- MIN
SELECT MIN(Salary)
FROM EmployeeSalary;

-- AVG
SELECT AVG(Salary)
FROM EmployeeSalary;
