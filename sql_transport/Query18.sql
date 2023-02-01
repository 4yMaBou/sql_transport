CREATE VIEW Query18
AS
WITH RQ
AS
(SELECT IdCar, 
	IdFlight, 
	MONTH(DepartureDate) Month, 
	MAX(CEILING(DATEDIFF(dd, DepartureDate, ArrivalDate))) + 1 AS FlightDurring
FROM Flights F
GROUP BY MONTH(DepartureDate), IdCar, IdFlight
)

SELECT IdCar, 
	COUNT(IdFlight) AS FlightNum, 
	Month, AVG(FlightDurring) AS AVGFlightDurring, 
	SUM(FlightDurring)  DaysInFlights
FROM RQ
GROUP BY IdCar, Month 

;
