CREATE VIEW Query13
AS
WITH temp AS (
  SELECT F.*, Price, ROW_NUMBER() OVER (PARTITION BY F.IdFlight ORDER BY DateOfChange DESC) RN, DateOfChange
  FROM Flights F
  JOIN Transport T 
  ON T.IdCar = F.IdCar
  JOIN TransportationPrices TP
  ON TP.IdCar = F.IdCar and DateOfChange < departureDate
  )

SELECT  IdFlight, IdCar, DepartureDate, ArrivalDate, Price
FROM temp
WHERE rn = 1
;
