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

USE DWH_Project
EXEC dbo.summary_order_status @StatusID = 3;
