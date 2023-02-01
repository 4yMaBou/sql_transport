CREATE VIEW Query11
AS

WITH C
AS
(
select  MONTH(OrderDate) AS MonthOfOrder, IdClient, SUM(UnitPrice * Amount) OVER (PARTITION BY O.IdClient, MONTH(OrderDate)) AS ClientSpending, O.IdOrder,
ROW_NUMBER() OVER(PARTITION BY O.IdClient, MONTH(OrderDate) order by IdClient) AS Rnk
from orders as o
join ProductsInOrder as PIO
on o.IdOrder = pio.IdOrder
join Product as p
on pio.IdProduct = p.IdProduct
)

SELECT TOP 50 MonthOfOrder, IdClient, ClientSpending, SUM(ClientSpending) OVER (PARTITION BY MonthOfOrder) AS SpendInMonth
FROM C
WHERE Rnk = 1
ORDER BY MonthOfOrder, IdClient, rnk
;
