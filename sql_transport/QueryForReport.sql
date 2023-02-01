CREATE VIEW QueryForReport
AS
SELECT C.CompanyName, P.ProductName, Amount, COUNT(*) OVER(PARTITION BY O.IdClient) AS CountOrder, (Amount * p.UnitPrice) AS OrderPrice, O.OrderDate
FROM Orders O
	JOIN ProductsInOrder PIO
		ON O.IdOrder = PIO.IdOrder
	JOIN Product P
		ON P.IdProduct = PIO.IdProduct
	JOIN Clients C
		ON C.IdClient = O.IdClient
;