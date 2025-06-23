


CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Category 
(
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL

)

CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100),
	CONSTRAINT UQ_Email UNIQUE (Email)

);

CREATE TABLE [ORDER](
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE OrderItem (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

USE ECommerceDB;  -- or your actual database name
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
