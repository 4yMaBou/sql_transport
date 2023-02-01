CREATE TABLE Clients
	(IdClient INT PRIMARY KEY IDENTITY(1,1),
	CompanyName NVARCHAR(50) UNIQUE,
	INN VARCHAR(10) UNIQUE
	);

CREATE TABLE Transport
	(IdCar INT PRIMARY KEY IDENTITY(1,1),
	CarModel VARCHAR(50),
	LoadCapacity NUMERIC(9, 3),
	OneKmPrice NUMERIC(9, 2),
	);

CREATE TABLE Warehouses
	(IdWarehouse INT PRIMARY KEY IDENTITY(1,1),
	 WarehouseName NVARCHAR(19)
	);

CREATE TABLE Product
	(IdProduct INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(200),
	ProductWeight NUMERIC(6, 2),
	UnitPrice SMALLMONEY
	);

CREATE TABLE Orders
	(IdOrder INT PRIMARY KEY IDENTITY(1,1),
	IdClient INT FOREIGN KEY REFERENCES Clients ON DELETE CASCADE,
	OrderDate DATE,
	OrderType NVARCHAR(19),
	IdWarehouseFrom INT FOREIGN KEY REFERENCES Warehouses (IdWarehouse),
	IdWarehouseTo INT FOREIGN KEY REFERENCES Warehouses (IdWarehouse),
	OrderStatus BIT NOT NULL,
	);

CREATE TABLE Flights
	(IdFlight INT,
	IdCar INT FOREIGN KEY REFERENCES Transport ON DELETE CASCADE,
	IdOrder INT FOREIGN KEY REFERENCES Orders ON DELETE CASCADE,
	Distance NUMERIC(6, 1),
	DepartureDate DATE,
	ArrivalDate DATE
	);

CREATE TABLE PriceChanges
	(IdCar INT FOREIGN KEY REFERENCES Transport ON DELETE CASCADE,
	OneKmPrice NUMERIC(9, 2)
	);

CREATE TABLE ProductsInOrder
	(IdOrder INT FOREIGN KEY REFERENCES Orders(IdOrder),
	IdProduct INT FOREIGN KEY REFERENCES Product(IdProduct),
	Amount INT);