CREATE VIEW Query8
AS
SELECT TOP 2 IdFlight, IdCar, DATEDIFF(d, DepartureDate, ArrivalDate) AS Duration
FROM Flights AS F
GROUP BY IdFlight, IdCar, DATEDIFF(d, DepartureDate, ArrivalDate)
ORDER BY Duration DESC, IdFlight 
;