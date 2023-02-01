CREATE VIEW Query10
as
WITH FIN
AS
(SELECT DATEPART(YY, DepartureDate) AS YearOfFlight, EOMONTH(DepartureDate) AS MonthOfFlight, IdCar, SUM(Distance) / COUNT(IdFlight) AS DistSum
FROM Flights 
GROUP BY DATEPART(YY, DepartureDate), EOMONTH(DepartureDate), IdFlight, IdCar)

SELECT YearOfFlight, MONTH(FIN.MonthOfFlight) AS MonthOfFlight, IdCar, SUM(FIN.DistSum) AS DistSum, IIF(SUM(FIN.DistSum) -  SUM(DISTINCT Pm.Distsum) IS NULL, 0, SUM(FIN.DistSum) -  SUM(DISTINCT Pm.Distsum))   AS DiffDist
FROM FIN
LEFT JOIN (SELECT MonthOfFlight,  DistSum  FROM FIN) AS PM
ON (MONTH(FIN.MonthOfFlight) = MONTH(PM.MonthOfFlight) + 1)
GROUP BY YearOfFlight, FIN.MonthOfFlight, IdCar
;