CREATE VIEW	Query15
AS
WITH NS
AS
(SELECT IdOrder, OrderDate, OrderStatus
FROM Orders
WHERE OrderStatus IS NULL
),
LastFlight AS
(SELECT top 2 IdCar, ArrivalDate, ROW_NUMBER() OVER (partition by month(arrivaldate) ORDER BY  MONTH(ArrivalDate), YEAR(ArrivalDate)) Rn
FROM Flights
GROUP BY IdCar, ArrivalDate
ORDER BY ArrivalDate DESC
)

SELECT *
FROM NS
	JOIN LastFlight Fl
		ON NS.OrderDate > Fl.ArrivalDate
WHERE RN = 1 
;