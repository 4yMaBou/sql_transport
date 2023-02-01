
INSERT INTO Clients
VALUES('���	�������', '1234567890'),
	('��� ���� � ������', '6664567890'),
	('��� �����', '8796540123'),
	('��� �������', '5584871290'),
	('��� ������', '8885552220')
	;
	
	

INSERT INTO Transport
VALUES ('Ford', 5000.000, 70.00),
	('������', 10000.000, 30.00)
	;


INSERT INTO Product
VALUES ('����� �������� �������� �������������� 4.2�� 51�� ��.10 ��', 0.25, 25.50),
	('����� �������� �������� ������ 3.5�� 16�� ��.10 ��', 0.20, 30.00),
	('������ �������� Mosklapan OPN24025 �/� D 25�� 40��� ������������ AISI 316 ����������� ����� +250��', 0.2, 78.00),
	('���� ������� ������������� 840�690�230 ������ ������', 7.00, 2585.00),
	('������� �5 �����-����� ���� �������/ar.�40-6929 40 � ������ ������� "�������"', 0.25, 45.50),
	('����� ������ Transcend SDHC Class 10 256Gb', 0.05, 999.95),
	('��������� ������� ������. ���������. � �������, 2,0%, 290�', 0.29, 89.50),
	('��������� ������� ������. ���������. ������, 8,7%, 320�', 0.32, 95.80)
	;

INSERT INTO Warehouses
VALUES ('������ ������� 10\1'),
	('������ �������� 18'),
	('������ ������� 25'),
	('������ ������� 13')
	;
	

INSERT INTO Orders (IdClient, OrderDate, IdWarehouseFrom, IdWarehouseTo, OrderStatus)
VALUES(1, '2022-08-02', 3, 1, 1),
	(2, '2022-08-02', 3, 1, 1),
	(1, '2022-08-03', 4, 2, 1),
	(4, '2022-08-04', 4, 2, 1),
	(3, '2022-08-04', 4, 2, 1),
	(4, '2022-08-04', 4, 2, 1),
	(3, '2022-09-03', 4, 1, 1),
	(4, '2022-09-03', 4, 1, 1),
	(4, '2022-09-05', 4, 1, 1),
	(2, '2022-10-08', 3, 1, 1),
	(5, '2022-10-10', 3, 1, 1),
	(3, '2022-10-14', 3, 2, 0),
	(4, '2022-10-15', 4, 1, 0),
	(3, '2022-10-15', 3, 2, 0)
	;

INSERT INTO Product
VALUES ('����� �������� �������� �������������� 4.2�� 51�� ��.10 ��', 0.25, 25.50),
	('����� �������� �������� ������ 3.5�� 16�� ��.10 ��', 0.2, 30.00),
	('������ �������� Mosklapan OPN24025 �/� D 25�� 40��� ������������ AISI 316 ����������� ����� +250��', 0.2, 78.00),
	('���� ������� ������������� 840�690�230 ������ ������', 7, 2585.00),
	('������� �5 �����-����� ���� �������/ar.�40-6929 40 � ������ ������� "�������"', 0.25, 45.50),
	('����� ������ Transcend SDHC Class 10 256Gb', 0.05, 999.95),
	('��������� ������� ������. ���������. � �������, 2,0%, 290�', 0.29, 89.50),
	('��������� ������� ������. ���������. ������, 8,7%, 320�', 0.32, 95.80)
	;

INSERT INTO ProductsInOrder
VALUES(1, 1, 300),
	(1, 2, 300),
	(1, 3, 50),
	(1, 4, 5),
	(2, 5, 30),
	(2, 6, 20),
	(2, 4, 2),
	(3, 7, 200),
	(3, 8, 200),
	(4, 7, 240),
	(4, 8, 200),
	(5, 7, 300),
	(5, 8, 200),
	(6, 7, 200),
	(6, 8, 250),
	(7, 7, 280),
	(7, 8, 300),
	(8, 7, 580),
	(9, 8, 250),
	(10, 1, 200),
	(10, 3, 150),
	(10, 4, 2),
	(11, 5, 30),
	(11, 6, 20),
	(11, 4, 2),
	(11, 2, 500),
	(12, 7, 300),
	(12, 8, 200),
	(13, 7, 240),
	(13, 8, 200),
	(14, 7, 500)
	;
	
INSERT INTO Flights
VALUES (1, 1, 1, 1000, '2022-08-03', '2022-08-04'),
	(1, 1, 2, 1000, '2022-08-03', '2022-08-04'),
	(2, 2, 3, 1100, '2022-08-05', '2022-08-06'),
	(2, 2, 4, 1100, '2022-08-05', '2022-08-06'),
	(3, 1, 5, 1100, '2022-08-06', '2022-08-06'),
	(3, 1, 6, 1100, '2022-08-06', '2022-08-06'),
	(4, 2, 7, 1000, '2022-09-09', '2022-09-10'),
	(4, 2, 8, 1000, '2022-09-09', '2022-09-10'),
	(4, 2, 9, 1000, '2022-09-09', '2022-09-10'),
	(5, 1, 10, 1000, '2022-10-11', '2022-10-11'),
	(5, 1, 11, 1000, '2022-10-11', '2022-10-11')
	;







