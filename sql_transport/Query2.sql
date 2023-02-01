CREATE VIEW Query2 AS
SELECT C.IdClient, C.CompanyName, COUNT(EOMONTH(O.OrderDate)) AS OrdersPerMounth,COUNT(YEAR(O.OrderDate)) AS OrdersPerYear, COUNT(O.IdOrder) AS NumOfOrders
FROM Orders AS O
LEFT JOIN Clients AS C
ON O.IdClient = C.IdClient
GROUP BY C.CompanyName, C.IdClient
;