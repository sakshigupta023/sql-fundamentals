-- Create Database
CREATE DATABASE sample2;

-- Select Database
USE sample2;

-- Create Table
CREATE TABLE customer (
    customerid INT AUTO_INCREMENT PRIMARY KEY,
    customernumber INT NOT NULL UNIQUE CHECK (customernumber > 0),
    lastname VARCHAR(30) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    areacode INT DEFAULT 71000,
    address VARCHAR(50),
    country VARCHAR(50) DEFAULT 'Malaysia'
);

-- Insert Records
INSERT INTO customer
(customernumber, lastname, firstname, areacode, address, country)
VALUES
(100, 'Fang Ying', 'Sham', 418888, 'sdaass', DEFAULT),
(200, 'Albert', 'Jen', 419999, 'fddaass', 'Thailand'),
(300, 'Ben', 'John', 410000, 'kdaaass', DEFAULT);

-- Display All Records
SELECT * FROM customer;

-- Add New Column
ALTER TABLE customer
ADD phonenumber VARCHAR(30);

-- Update Records
UPDATE customer
SET phonenumber = '1234567898'
WHERE customerid = 1;

UPDATE customer
SET phonenumber = '9999977777'
WHERE customerid = 2;

-- Display Updated Records
SELECT * FROM customer;

-- Delete Column
ALTER TABLE customer
DROP COLUMN phonenumber;

-- Delete Specific Record
DELETE FROM customer
WHERE customerid = 2;

-- Delete Table
DROP TABLE customer;

-- Display Tables
SHOW TABLES;
