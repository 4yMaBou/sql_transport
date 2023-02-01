CREATE VIEW Query1 AS
SELECT O.IdOrder, C.CompanyName, O.OrderDate, F.IdFlight, T.CarModel, F.DepartureDate
FROM Orders AS O 
JOIN Flights AS F
ON F.IdOrder = O.IdOrder
JOIN Clients AS C
ON O.IdClient = C.IdClient
JOIN Transport AS T
ON F.IdCar = T.IdCar
;