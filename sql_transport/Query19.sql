CREATE VIEW Query19
AS
WITH RQ
AS
(SELECT YEAR(OrderDate) Year,
	MONTH(OrderDate) AS Month,
	MAX(DATEDIFF(dd, OrderDate, ArrivalDate)) OVER (PARTITION BY IdClient, MONTH(OrderDate)) AS StatusProcessing,
	idFlight,
	o.IdOrder, 
	IdClient,
	SUM(UnitPrice*amount) OVER (PARTITION BY IdClient, MONTH(OrderDate), 
	YEAR(OrderDate) ORDER BY DateOfChange DESC) OrderPrice, (price*distance) FlightPrice,
	ROW_NUMBER() OVER (PARTITION BY IdClient, MONTH(OrderDate), YEAR(OrderDate) ORDER BY DateOfChange DESC) RN
FROM Orders O
	LEFT JOIN Flights F
		ON O.IdOrder = F.IdOrder
	JOIN ProductsInOrder PIO
		ON O.IdOrder = PIO.IdOrder
	JOIN Product p
		ON PIO.IdProduct = P.IdProduct
	JOIN TransportationPrices TP
		ON TP.IdCar = F.IdCar and DateOfChange < departureDate
)

SELECT top 50 RQ.IdClient, 
	Year, 
	Month, 
	ROUND(OrderPrice / SUM(OrderPrice) OVER (Partition by Month), 2) AS PartInMonth
FROM RQ
WHERE RN = 1 
ORDER BY Month
;

