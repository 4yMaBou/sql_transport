
CREATE VIEW Query5
AS

WITH QMD
AS
(
SELECT IdFlight, IdCar, SUM(Distance)/COUNT(IdFlight) AS DistanceInMonth, MONTH(departuredate) AS MonthOfFlight
FROM Flights
GROUP BY IdFlight, IdCar, MONTH(departuredate)
)

SELECT QMD.IdCar, SUM(DistanceInMonth) AS DistanceInMounth, MonthOfFlight
FROM  QMD
GROUP BY MonthOfFlight, IdCar

;




