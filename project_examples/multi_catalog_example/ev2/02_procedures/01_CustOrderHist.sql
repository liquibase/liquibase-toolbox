--liquibase formatted sql

--changeset amalik:procedure_01 context:DEV,QA,PROD labels:release1 runOnChange:"true"
CREATE PROCEDURE [dbo].[CustOrderHist] @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName
--rollback DROP PROCEDURE [dbo].[CustOrderHist]