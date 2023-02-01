CREATE TABLE TransportationPrices
	(IdCar INT  REFERENCES Transport,
	DateOfChange DATE,
	Price TINYINT)
	;
