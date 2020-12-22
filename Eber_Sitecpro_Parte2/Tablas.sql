CREATE TABLE Cliente
(
	Id_Cliente INT IDENTITY PRIMARY KEY,
	Nombre_Cliente NVARCHAR(50) NOT NULL,
	Fecha_Nacimiento DATE NOT NULL
)

CREATE TABLE Video
(
	Id_Titulo NVARCHAR(50) PRIMARY KEY,
	Certificado NVARCHAR(10) NOT NULL,
	Categoria NVARCHAR(20) NOT NULL,
	Precio Money NOT NULL,
	Director NVARCHAR(50) NOT NULL
)

CREATE TABLE Tienda
(
	Id_Tienda NVARCHAR(5) PRIMARY KEY,
	Nombre_Tienda NVARCHAR(50) NOT NULL,
)

CREATE TABLE Disco
(
	Id_NumeroDisco INT PRIMARY KEY,
	Id_Titulo NVARCHAR(50) REFERENCES Video(Id_Titulo), 
	Id_Tienda NVARCHAR(5) REFERENCES Tienda(Id_Tienda)
)

CREATE TABLE Registro
(
	Id_Registro NVARCHAR(5) PRIMARY KEY,
	Id_Tienda NVARCHAR(5) REFERENCES Tienda(Id_Tienda),
	Id_Cliente INT REFERENCES Cliente(Id_Cliente),
	Id_Titulo NVARCHAR(50) REFERENCES Video(Id_Titulo),
	FechaRenta DATE NOT NULL,
	FechaDevolución DATE NOT NULL,
	Estado NVARCHAR(15) NOT NULL,
)


--Clientes
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('Jorge', '1995/01/19');
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('David', '1996/07/01');
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('Maria', '1996/12/29');
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('Josue', '1995/01/07');
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('Martina', '1995/12/21');
INSERT INTO Cliente (Nombre_Cliente,Fecha_Nacimiento) VALUES ('Javier', '1995/12/21');
SELECT * FROM Cliente

--Video
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Mulan', 'PG-13', 'Live-Action', 50,'Niki Caro')
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Toy Story', 'G', 'Animation', 40,'	John Lasseter')
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Toy Story 2', 'G', 'Animation', 45,'	John Lasseter')
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Toy Story 3', 'G', 'Animation', 50,'	John Lasseter')
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Ugly Dolls', 'G', 'Animation', 30, 'Robert Rodriguez')
INSERT INTO Video (Id_Titulo,Certificado,Categoria,Precio,Director) VALUES ('Emojis', 'G', 'Animation', 30, 'Michelle Raimo Kouyate')


SELECT * FROM Video

--Tienda
INSERT INTO Tienda (Id_Tienda,Nombre_Tienda) VALUES ('GP1', 'El duende')
INSERT INTO Tienda (Id_Tienda,Nombre_Tienda) VALUES ('GP2', 'Max')


SELECT * FROM Tienda

--Disco
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (1, 'Mulan', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (2, 'Mulan','GP1')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (3, 'Toy Story', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (4, 'Toy Story', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (5, 'Toy Story 2', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (6, 'Toy Story 3', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (7, 'Toy Story 3', 'GP1' )
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (8, 'Toy Story 3', 'GP1' )

INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (9,'Mulan', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (10,'Mulan', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (11,'Toy Story', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (12,'Toy Story', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (13,'Toy Story 2', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (14,'Toy Story 3', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (15,'Toy Story 3', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (16,'Toy Story 3', 'GP2')
INSERT INTO Disco (Id_NumeroDisco, Id_Titulo, Id_Tienda) VALUES (17,'Mulan', 'GP2')

SELECT * FROM Disco

--Registro
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA1', 'GP1', 1, 'Mulan','2020-12-18', '2020-12-24', 'Disponible');
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA2', 'GP1', 1, 'Toy Story', '2020-12-21', '2020-12-29', 'No Disponible');
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA3', 'GP2', 2, 'Mulan', '2020-12-18',  '2020-12-24', 'No Disponible');
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA4', 'GP1', 3, 'Mulan', '2020-12-01',  '2020-12-12', 'Disponible');
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA5', 'GP1', 2, 'Toy Story 2', '2020-12-21',  '2020-12-29', 'No Disponible');
INSERT INTO Registro(Id_Registro,Id_Tienda,Id_Cliente, Id_Titulo, FechaRenta,FechaDevolución,Estado) VALUES('PPAA6', 'GP1', 4, 'Toy Story 3', '2020-12-21',  '2020-12-29', 'No Disponible');

SELECT * FROM Registro

DROP TABLE Registro
DROP TABLE Disco
DROP TABLE Video
DROP TABLE Cliente

TRUNCATE TABLE DISCO