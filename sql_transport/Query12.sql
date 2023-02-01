CREATE VIEW Query12
as
WITH QT
AS
(SELECT IdFlight, F.IdCar, O.IdOrder, IdClient, (Price * Distance) AS TransportationPrice, 
SUM(UnitPrice * Amount) OVER (PARTITION BY O.IdOrder) AS OrderPrice, ROW_NUMBER() OVER (PARTITION BY F.IdFlight, F.IdOrder ORDER BY DateOfChange DESC) RN, DateOfChange, 
SUM(ProductWeight * Amount) OVER (PARTITION BY F.IdFlight)  AS ProductWeight, SUM(ProductWeight * Amount) OVER (PARTITION BY O.IdOrder, O.IdClient) AS OrderWeight
FROM Flights AS F 
LEFT JOIN Orders AS O
ON F.IdOrder = O.IdOrder
JOIN ProductsInOrder AS PIO
ON O.IdOrder = PIO.IdOrder
JOIN Product AS P
ON P.IdProduct = PIO.IdProduct
JOIN TransportationPrices TP
ON TP.IdCar = F.IdCar and DateOfChange < departureDate
)

SELECT QT.IdFlight, QT.IdCar, SUM(TransportationPrice) OVER(PARTITION BY QT.IdFlight, QT.IdCar) * OrderWeight/ProductWeight AS PriceOfFlightPerClient , QT.IdOrder, QT.IdClient, SUM(TransportationPrice) OVER(PARTITION BY QT.IdFlight, QT.IdCar) PriceOfAllFlights
FROM QT 
LEFT JOIN Flights F
ON F.IdOrder = QT.IdOrder
WHERE RN = 1

;

