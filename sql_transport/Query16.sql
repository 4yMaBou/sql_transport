CREATE VIEW [dbo].[Query16]
AS
WITH Q
AS
(SELECT DISTINCT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, AVG(UnitPrice*Amount) OVER(PARTITION BY YEAR(OrderDate), MONTH(OrderDate))  AS OrdPrice, IdFlight, Price, Distance, ROW_NUMBER() OVER (PARTITION BY F.IdFlight ORDER BY DateOfChange DESC) RN 
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

SELECT distinct  Month, 
	ROUND(OrdPrice, 2) OrdPrice,
	COUNT(IdFlight) OVER(PARTITION BY Month) AS FlightNum,
	ROUND(AVG(Price * Distance) OVER(PARTITION BY Month, Year), 2) AS AVGFlightPrice
FROM Q
WHERE rn = 1
;
