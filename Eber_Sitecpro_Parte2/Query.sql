--Obtener la cardinalidad de la tabla Videos
SELECT COUNT(*) AS [Cardinalidad] FROM Video

--Entrada Titulo, Salida Titulo y Director
SELECT Id_Titulo as [Titulo],
		Director
FROM Video
WHERE Id_Titulo = 'Toy Story'

--Entrada Titulo, Salida Titulo de Video y Cantidad de copias
SELECT Id_Titulo as [Titulo], 
	   COUNT(Id_Titulo) as [Cantidad de Peliculas],
	   Nombre_Tienda as [Nombre Tienda]
FROM Disco
	INNER JOIN Tienda
	ON Disco.Id_Tienda = Tienda.Id_Tienda
GROUP BY Id_Titulo, Tienda.Nombre_Tienda

-- Salida: Cantidad de titulos por categoria de forma ordenada
SELECT Categoria,
COUNT(Categoria) as [Total Por Categoria] FROM Video
GROUP BY Categoria
ORDER BY [Total Por Categoria] ASC

-- Salida: Clientes que no han devuelto peliculas
SELECT Nombre_Cliente as [Nombre Cliente],
	Estado,
	Video.Id_Titulo
FROM Registro
INNER JOIN Cliente
	ON Registro.Id_Cliente = Cliente.Id_Cliente
INNER JOIN Video
	ON Registro.Id_Titulo = Video.Id_Titulo
WHERE Estado = 'No Disponible'

--Obtener los cumpleañero por fecha del sistema
SELECT Nombre_Cliente as [Nombre Cliente],
	   Fecha_Nacimiento as [Fecha Nacimiento]
FROM Cliente
WHERE MONTH(Fecha_Nacimiento) = MONTH(GETDATE()) AND DAY(Fecha_Nacimiento) = DAY(GETDATE())

--Obtener las peliculas no vistas
SELECT ISNULL(ESTADO, '-') as [Estado],
	Video.Id_Titulo as [Titulo]
into #Temp_View
FROM Registro
RIGHT JOIN Video
ON Registro.Id_Titulo = Video.Id_Titulo  

SELECT * FROM #Temp_View
WHERE Estado = '-'


--Obtener el maximo precio de renta
SELECT Top 1(Precio) AS [Precio Renta],
	   Id_Titulo AS [Titulo]
FROM Video
GROUP BY Id_Titulo, Precio
ORDER BY Precio DESC
