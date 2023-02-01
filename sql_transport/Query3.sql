CREATE VIEW Query3 AS
SELECT T.CarModel, T.LoadCapacity, T.OneKmPrice
FROM Flights AS F
JOIN Transport AS T
ON F.IdCar = T.IdCar
WHERE T.IdCar NOT IN (SELECT IdCar FROM Flights WHERE MONTH(DepartureDate) = 10 AND YEAR(DepartureDate) = 2022)
GROUP BY T.CarModel, T.LoadCapacity, T.OneKmPrice
;