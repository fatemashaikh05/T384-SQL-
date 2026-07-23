create database BankingDB;
show databases;
use BankingDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);
describe customers;
select * from customers;
use BankingDB;
CREATE TABLE Accounts (
     AccountID INT,
     AccountType VARCHAR(20),
     Balance Decimal(10,2)
);
select * from Accounts;
CREATE TABLE Transactions (
     TransactionID INT,
     TransactionDate DATE,
     Amount DECIMAL(10,2),
     TransactionType varchar(20)
);

CREATE TABLE Branches (
     BranchID INT,
     BranchName VARCHAR(100),
     BranchAddress VARCHAR(200),
     BranchPhone VARCHAR(15)
);
show tables;

CREATE TABLE AccountBranches (
     AssignmentDate date
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate date
);

ALTER TABLE Customers
ADD DateOfBirth Date;
select * from Customers;

ALTER TABLE Customers
ADD Location VARCHAR(100) after LastName;
select * from Customers;
ALTER TABLE Customers
ADD Sr_No VARCHAR(100) first;
select * from Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
select * from Customers;

ALTER TABLE Customers
MODIFY CustomerID INT primary key;

-- Arithmetic Operators --
select 2+3 as addition;
select 10-7 as subtraction;
select 5*2 as multiplication;
select 20/5 as division;
select 10%3 as modulus;

-- Comparison Operators --
select 34>=67;
select 34<=67;
select 41>20;
select 41<20;
select 10=10;
select 10!=10;

-- Logical Operators --
select 3>1 and 5>2 as Results;
select 3>1 or 1>2 as Results;

select now(); -- for current date and timing --
select current_date(); -- for current date only --

use BankingDB;
create table voter_table (
Name varchar(20),
Age int check(Age>=18),
Email varchar(20) default "dummy@gmail.com");
desc voter_table;

insert into voter_table values 
("Sachin",19,"sachin1@gmail.com"),("Ruhi",22,"ruhi5@gmail.com"),("Sanika",20,"sanika4@gmail.com"),("Rohan",18,"");
select * from voter_table;
drop table voter_table;
insert into voter_table values 
("Kunal",25,default);

truncate table voter_table; -- Structure of the table exists only all the data in the table are deleted --
drop table voter_table; -- to delete whole table --
show tables;

CREATE TABLE Employee (
EmployeeId INT PRIMARY KEY,
FullName VARCHAR(45) NOT NULL,
Department VARCHAR(45) NOT NULL,
Salary float NOT NULL,
Gender VARCHAR(45) NOT NULL,
Age INT NOT NULL
);

INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25),
(1002, "Mary Smith", "HR", 45000, "Female", 27),
(1003, "James Brown", "Finance", 50000, "Male", 28),
(1004, "Mike Walker", "Finance", 50000, "Male", 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(200) NOT NULL,
 EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME);
    
INSERT INTO Projects VALUES 
(1,'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2,'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(3,'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
(4,'Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(5,'MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(6,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
(7,'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
(8,'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(9,'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
(10,'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
(11,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));

CREATE TABLE Address
(
    AddressId INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeId INT,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack');

select * from Employee;
select * from Projects;
select * from Address;
select * from Employee where department="hr";

CREATE DATABASE company;
Use company;

CREATE TABLE Employee (
     ID INT PRIMARY KEY,
     Name VARCHAR(100) NOT NULL,
     Age int);
     
CREATE TABLE project (
	Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Employee_ID INT,
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(ID)
    ON UPDATE CASCADE
    ON DELETE CASCADE);

INSERT INTO Employee (ID, Name, Age) VALUES
(101, 'Alice Smith', 30),
(102, 'Bob Jones', 28);

INSERT INTO project (Project_ID, Project_Name, Employee_ID) VALUES
(1, 'Website Redesign', 101),
(2, 'Cloud Migration', 101),
(3, 'Mobile App', 102);

select * from Employee;
select * from project;

UPDATE Employee
SET ID = 999
WHERE ID = 101;

DELETE FROM Employee
WHERE ID = 999;

use bankingdb;
ALTER TABLE Accounts 
ADD CONSTRAINT FK_Customers
FOREIGN KEY(AccountID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts ADD Customer_ID INT;
select * from Accounts;
ALTER TABLE Accounts 
ADD CONSTRAINT F_K
FOREIGN KEY(Customer_ID)
REFERENCES Customers(CustomerID);

use bankingdb;
SELECT * FROM Employee;
SELECT FullName, Salary from Employee;
SELECT * FROM Employee
WHERE Department="IT";
SELECT * FROM Employee
WHERE Department="IT" and Age=28;
SELECT * FROM Employee WHERE Age in (23,25);
SELECT * FROM Employee WHERE Salary in (35000,75000);
SELECT * FROM Employee WHERE Salary between 50000 and 75000;
SELECT * FROM Employee WHERE EmployeeId IN (1002,1007,1010);

SELECT * FROM Employee
WHERE FullName LIKE 'M%';
SELECT * FROM Employee
WHERE FullName LIKE '%n';
SELECT * FROM Employee
WHERE FullName LIKE '_a%';
SELECT * FROM Employee
WHERE FullName LIKE '__m%';
SELECT * FROM Employee
WHERE FullName LIKE '%t_';
SELECT * FROM Employee
WHERE FullName LIKE '%l%';

SELECT * FROM Employee order by age; -- by default ascending order --
SELECT * FROM Employee order by age desc; -- for descending order --
SELECT distinct age FROM employee;
SELECT * FROM employee order by EmployeeId desc limit 5;
SELECT * FROM employee order by EmployeeId limit 2,4; -- give records from 3 and only 4 records will display --
SELECT * FROM employee order by EmployeeId limit 5 offset 2; -- 5 records will display and from record 3 --

SELECT * FROM employee order by Fullname;
SELECT * FROM employee order by salary desc limit 5;
SELECT distinct Department FROM employee;
SELECT * FROM employee order by EmployeeId limit 3,4;
SELECT * FROM employee order by EmployeeId limit 4 OFFSET 3; -- same as previous query only other method --

SELECT * FROM projects;
SELECT * FROM projects WHERE EmployeeId is NOT NULL;
SELECT * FROM projects WHERE EmployeeId is NULL;