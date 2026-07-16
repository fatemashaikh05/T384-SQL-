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