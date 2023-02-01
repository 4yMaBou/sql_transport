CREATE VIEW Query17
AS
WITH RQ
AS
(SELECT MONTH(OrderDate) AS Month, 
	MAX(DATEDIFF(dd, OrderDate, ArrivalDate)) OVER (PARTITION BY IdClient, MONTH(OrderDate)) AS StatusProcessing,
	idFlight, o.IdOrder, IdClient, 
	SUM(UnitPrice*amount) OVER (PARTITION BY IdClient, MONTH(OrderDate), 
	YEAR(OrderDate) ORDER BY DateOfChange DESC) OrderPrice, SUM(ProductWeight * Amount) OVER (PARTITION BY O.IdOrder, O.IdClient)/SUM(ProductWeight * Amount) OVER (PARTITION BY F.IdFlight) Koeff,
	(Price * Distance) AS TransportationPrice,
	ROW_NUMBER() OVER (PARTITION BY IdClient, 
	MONTH(OrderDate), 
	YEAR(OrderDate) ORDER BY DateOfChange DESC) RN
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

SELECT IdClient, Month, StatusProcessing, CAST(ROUND((OrderPrice + (TransportationPrice/Koeff)), 2) AS NUMERIC(10,2)) ClientSpent
FROM RQ
WHERE rn = 1
;


