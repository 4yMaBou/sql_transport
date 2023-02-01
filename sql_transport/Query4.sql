CREATE VIEW Query4 
AS

WITH QueryWhFrom
AS
(SELECT O.IdOrder, O.IdWarehouseFrom, W.WarehouseName
FROM Warehouses AS W
JOIN Orders AS O
ON W.IdWarehouse = O.IdWarehouseFrom
)

SELECT TOP 50 O.IdOrder, C.CompanyName, O.OrderDate, QWH.WarehouseName AS WhFrom, W.WarehouseName AS WhTo, O.OrderStatus
FROM Orders AS O 
JOIN Clients AS C
ON O.IdClient = C.IdClient
JOIN QueryWhFrom AS QWH
ON O.IdOrder = QWH.IdOrder
JOIN Warehouses AS W
ON O.IdWarehouseTo = W.IdWarehouse
WHERE OrderStatus IS NULL
ORDER BY O.IdOrder 
;


