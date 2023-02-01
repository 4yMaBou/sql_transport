CREATE VIEW Query9 
as
SELECT DATEPART(YY, DepartureDate) AS Year, DATEPART(QQ, Orderdate) AS Quartal,  COUNT(DISTINCT IdFlight) AS FlightsNum, 
AVG(Distance) AS AverageDistance, COUNT(DISTINCT O.IdOrder) AS OrdersNum, SUM(Amount*UnitPrice) AS Price
FROM Orders AS O
LEFT OUTER JOIN Flights AS F
ON O.IdOrder = F.IdOrder
JOIN ProductsInOrder AS PIO
ON O.IdOrder = PIO.IdOrder
JOIN Product AS P
ON P.IdProduct = PIO.IdProduct
WHERE Distance IS NOT NULL
GROUP BY  DATEPART(QQ, OrderDate), DATEPART(YY, DepartureDate)
;

