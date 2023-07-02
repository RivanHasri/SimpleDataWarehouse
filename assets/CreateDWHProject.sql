CREATE DATABASE DWH_Project;

USE DWH_Project;

CREATE TABLE DimCustomer (
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(100) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	NoHP VARCHAR(50) NOT NULL
);

CREATE TABLE DimProduct (
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255) NOT NULL,
	ProductCategory VARCHAR(255) NOT NULL,
	ProductUnitPrice INT NOT NULL
);

CREATE TABLE DimStatusOrder (
	StatusID INT PRIMARY KEY,
	StatusOrder VARCHAR(50) NOT NULL,
	StatusOrderDesc VARCHAR(50) NOT NULL
);

CREATE TABLE FactSalesOrder (
	OrderID INT PRIMARY KEY,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusID INT NOT NULL,
	OrderDate DATE NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID) 
);

CREATE PROCEDURE dbo.summary_order_status
(
	@StatusID INT
)
AS
BEGIN
	SELECT fso.OrderID, dc.CustomerName, dp.ProductName, fso.Quantity, dso.StatusOrder
	FROM dbo.FactSalesOrder fso
	JOIN dbo.DimCustomer dc ON fso.CustomerID = dc.CustomerID
	JOIN dbo.DimProduct dp ON fso.ProductID = dp.ProductID
	JOIN dbo.DimStatusOrder dso ON fso.StatusID = dso.StatusID
	WHERE fso.StatusID = @StatusID
END;

DROP PROCEDURE IF EXISTS summary_order_status;

USE DWH_Project
EXEC dbo.summary_order_status @StatusID = 3;

SELECT * FROM FactSalesOrder;

