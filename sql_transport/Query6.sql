CREATE VIEW Query6
AS

WITH M AS (select o.Idorder, sum(P.UnitPrice * Amount) as Price
from orders as o
join ProductsInOrder as PIO
on o.idorder = PIO.idorder
join product as p
on pio.idproduct = p.idproduct
group by o.idorder
)

SELECT  IdORDER, Price 
FROM M 
order by Price desc
OFFSET 1 ROWS
		FETCH NEXT 1 ROWS ONLY;
;
