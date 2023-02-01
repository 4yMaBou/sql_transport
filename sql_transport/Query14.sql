CREATE VIEW Query14
as

with dispatch AS (
SELECT DATEPART(YY, DepartureDate) Year, DATEPART(MM, DepartureDate) Month, IdWarehouseFrom AS IdWarehouse, ProductName, -SUM(Amount) SumMinus, 0 as SumPlus
FROM Flights AS F
LEFT JOIN Orders AS O
ON F.IdOrder = O.IdOrder
JOIN ProductsInOrder AS PIO
ON O.IdOrder = PIO.IdOrder
JOIN Product AS P
ON P.IdProduct = PIO.IdProduct
GROUP BY DATEPART(YY, DepartureDate), DATEPART(MM, DepartureDate), IdWarehouseFrom, ProductName
)

, 
delivery as (
SELECT DATEPART(YY, ArrivalDate) Year, DATEPART(MM, ArrivalDate) Month, IdWarehouseTo AS IdWarehouse,  ProductName, 0 AS SumMinus, SUM(Amount) SumPlus	
FROM Flights AS F
LEFT JOIN Orders AS O
ON F.IdOrder = O.IdOrder
JOIN ProductsInOrder AS PIO
ON O.IdOrder = PIO.IdOrder
JOIN Product AS P
ON P.IdProduct = PIO.IdProduct
GROUP BY DATEPART(YY, ArrivalDate), DATEPART(MM, ArrivalDate), IdWarehouseTo, ProductName
)
select * , (SumPlus + SumMinus) fullMonth
from(
select Year, Month, IdWarehouse, ProductName, SUM(SumMinus) SumMinus, SUM(SumPlus) SumPlus
from(
select
*
from dispatch 
UNION ALL
SELECT 
*
FROM delivery 
)a
GROUP BY Year, Month, IdWarehouse, ProductName
)t
;
