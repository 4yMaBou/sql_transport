CREATE VIEW  Query7
AS
SELECT TOP 1 p.ProductName, SUM(PIO.amount) AS Volume
FROM Orders AS O
JOIN ProductsInOrder AS PIO
ON O.IdOrder = PIO.IdOrder
JOIN Product AS P
ON P.IdProduct = PIO.IdProduct
GROUP BY P.ProductName, YEAR(O.OrderDate)
HAVING YEAR(O.OrderDate) = 2022
ORDER BY Volume DESC
;