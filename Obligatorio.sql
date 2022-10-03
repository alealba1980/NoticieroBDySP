-- Crear DB --
USE master
GO

DROP DATABASE IF EXISTS NoticieroDB

CREATE DATABASE NoticieroDB


USE NoticieroDB
GO

-- Creacion de tablas

CREATE TABLE Secciones
( 
	Codigo varchar(3) PRIMARY KEY,
	Nombre varchar(20) not null
)
GO

CREATE TABLE Periodistas
(
	Codigo int PRIMARY KEY,
	Nombre varchar(30) not null,
	Email varchar(50) not null
)
GO

CREATE TABLE PeriodistasTelefonos
(
	CodigoPeriodista int  not null FOREIGN KEY REFERENCES Periodistas(Codigo),
	Telefono varchar(10) not null
	PRIMARY KEY (CodigoPeriodista, Telefono)
)
GO

CREATE TABLE Noticias
(
	Codigo int IDENTITY(1,1) PRIMARY KEY,
	FechaHora datetime not null,
	Titulo varchar(30) not null,
	Resumen varchar(100) not null,
	Contenido varchar (250) not null,
	CodigoPeriodista int  not null FOREIGN KEY REFERENCES Periodistas(Codigo),
	CHECK (FechaHora >= GETDATE())
)
GO

CREATE TABLE NoticiasNacionales
(
	CodigoNoticia int not null FOREIGN KEY REFERENCES Noticias(Codigo),
	CodigoSeccion varchar(3) not null FOREIGN KEY REFERENCES Secciones(Codigo)
	PRIMARY KEY (CodigoNoticia)
)
GO

CREATE TABLE NoticiasInternacionales
(
	CodigoNoticia int not null FOREIGN KEY REFERENCES Noticias(Codigo),
	Pais varchar(20) not null,
	PRIMARY KEY (CodigoNoticia)
)
GO



-- * * * * A G R E G A N D O    D A T O S    * * * *
INSERT Secciones (Codigo,Nombre) VALUES 
('POL','Policiales'),
('PLA','Politicas'),
('FIN','Finanzas'),
('DEP','Deportes'),
('ESP','Espectaculos'),
('ART','Arte'),
('CUL','Cultura'),
('ECO','Economia'),
('CLA','Clasificados'),
('OPT','Opiniones'),
('SOC','Sociedad')

GO

INSERT Periodistas(Codigo,Nombre,Email) VALUES
(1,'Alberto Kesman','alberto@gmail.com'),
(2,'Ignacio Alvarez','ignacio@gmail.com'),
(3,'Sergio Gorzy','sergio@gmail.com'),
(4,'Jorge Traverso','jorge@gmail.com'),
(5,'Neber Araujo','neber@gmail.com'),
(6,'Aldo Silva','aldo@gmail.com'),
(7,'Fernando Pereira','fernando@gmail.com'),
(8,'Mariano Lopez','mariano@gmail.com'),
(9,'Blanca Rodriguez','blanca@gmail.com'),
(10,'Yisela Moreira','yisela@gmail.com'),
(11,'Nicolas Nuñez','nicolas@gmail.com')

GO

INSERT PeriodistasTelefonos(CodigoPeriodista,Telefono) VALUES
(1,'095111222'),
(1,'091131242'),
(1,'091451252'),
(2,'099588431'),
(2,'093554258'),
(3,'096558148'),
(3,'091158479'),
(3,'091384687'),
(4,'095118231'),
(5,'095884546'),
(5,'095445713'),
(6,'091358434'),
(6,'099524753'),
(6,'093451338'),
(7,'095338771'),
(8,'098554378'),
(9,'099543485'),
(9,'095315432'),
(10,'091354773'),
(11,'091547984'),
(11,'095731583'),
(11,'095101500')
GO

INSERT Noticias(FechaHora,Titulo,Resumen, Contenido, CodigoPeriodista) VALUES
(DATEADD(day,3,GETDATE()),'Titulo 1','Resumen 1','Contenido 1',1), 
(DATEADD(day,3,GETDATE()),'Titulo 2','Resumen 1','Contenido 1',1), 
(DATEADD(day,3,GETDATE()),'Titulo 3','Resumen 1','Contenido 1',3), 
(DATEADD(day,4,GETDATE()),'Titulo 4','Resumen 1','Contenido 1',3), 
(DATEADD(day,4,GETDATE()),'Titulo 5','Resumen 1','Contenido 1',3), 
(DATEADD(day,4,GETDATE()),'Titulo 6','Resumen 1','Contenido 1',4), 
(DATEADD(day,4,GETDATE()),'Titulo 7','Resumen 1','Contenido 1',5), 
(DATEADD(day,4,GETDATE()),'Titulo 8','Resumen 1','Contenido 1',5), 
(DATEADD(day,4,GETDATE()),'Titulo 9','Resumen 1','Contenido 1',6), 
(DATEADD(day,4,GETDATE()),'Titulo 10','Resumen 10','Contenido 10',6), 
(DATEADD(day,8,GETDATE()),'Titulo 11','Resumen 11','Contenido 11',6), 
(DATEADD(day,8,GETDATE()),'Titulo 12','Resumen 12','Contenido 12',7), 
(DATEADD(day,8,GETDATE()),'Titulo 13','Resumen 13','Contenido 13',8), 
(DATEADD(day,9,GETDATE()),'Titulo 14','Resumen 14','Contenido 14',1), 
(DATEADD(day,9,GETDATE()),'Titulo 15','Resumen 15','Contenido 15',2),
(DATEADD(day,3,GETDATE()),'Titulo 16','Resumen 16','Contenido 16',9), 
(DATEADD(day,4,GETDATE()),'Titulo 17','Resumen 17','Contenido 17',3), 
(DATEADD(day,5,GETDATE()),'Titulo 18','Resumen 18','Contenido 18',5), 
(DATEADD(day,7,GETDATE()),'Titulo 19','Resumen 19','Contenido 19',7), 
(DATEADD(day,6,GETDATE()),'Titulo 20','Resumen 20','Contenido 20',7), 
(DATEADD(day,5,GETDATE()),'Titulo 21','Resumen 21','Contenido 21',8), 
(DATEADD(day,5,GETDATE()),'Titulo 22','Resumen 22','Contenido 22',2), 
(DATEADD(day,5,GETDATE()),'Titulo 23','Resumen 23','Contenido 23',2), 
(DATEADD(day,5,GETDATE()),'Titulo 24','Resumen 24','Contenido 24',3), 
(DATEADD(day,4,GETDATE()),'Titulo 25','Resumen 25','Contenido 25',6), 
(DATEADD(day,4,GETDATE()),'Titulo 26','Resumen 26','Contenido 26',6), 
(DATEADD(day,4,GETDATE()),'Titulo 27','Resumen 27','Contenido 27',5), 
(DATEADD(day,3,GETDATE()),'Titulo 28','Resumen 28','Contenido 28',4), 
(DATEADD(day,3,GETDATE()),'Titulo 30','Resumen 29','Contenido 29',10),
(DATEADD(day,3,GETDATE()),'Titulo 30','Resumen 29','Contenido 30',9)

GO

INSERT NoticiasNacionales(CodigoNoticia,CodigoSeccion) VALUES
(1,'CLA'),
(3,'CLA'),
(5,'POL'),
(7,'DEP'),
(9,'DEP'),
(11,'FIN'),
(13,'CLA'),
(15,'OPT'),
(16,'OPT'),
(17,'FIN'),
(18,'FIN'),
(19,'FIN'),
(20,'DEP'),
(21,'DEP'),
(22,'DEP'),
(23,'CLA'),
(24,'CLA'),
(25,'CLA'),
(26,'FIN'),
(27,'OPT'),
(29,'SOC'),
(30,'SOC')

GO

INSERT NoticiasInternacionales(CodigoNoticia,Pais) VALUES
(2,'ARGENTINA'),
(4,'BRASIL'),
(6,'BOLIVIA'),
(8,'ARGENTINA'),
(10,'FRANCIA'),
(12,'ALEMANIA'),
(14,'SINGAPUR')
GO


-- *********************************************************
-- ** P R O C E D I M I E N T O S   A L M A C E N A D O S **
-- *********************************************************

-- PARTE A: ELIMINAR NOTICIA
CREATE PROCEDURE EliminarNoticia 
@codigoNoticia int
AS
BEGIN
    --SI NO EXISTE LA NOTICIA DEVUELVE -1
	IF NOT EXISTS (SELECT * FROM Noticias WHERE Codigo=@codigoNoticia)
		RETURN -1 -- no existe el codigo de la noticia

	--si sigue es porque la noticia existe.

	BEGIN TRAN
		DELETE FROM NoticiasInternacionales WHERE CodigoNoticia=@codigoNoticia
		IF @@ERROR != 0
			BEGIN
				ROLLBACK TRAN
				RETURN 2
			END
		DELETE FROM NoticiasNacionales WHERE CodigoNoticia=@codigoNoticia
		IF @@ERROR != 0
			BEGIN
				ROLLBACK TRAN
				RETURN 2
			END
		DELETE FROM Noticias WHERE Codigo=@codigoNoticia
		IF @@ERROR != 0
			BEGIN
				ROLLBACK TRAN
				RETURN 2
			END
	COMMIT TRAN --FINALIZA CORRECTAMENTE
	RETURN 1

END
GO

--	* * *  PRUEBA ::::> PARTE A: ELIMINAR NOTICIA * * * 
BEGIN
DECLARE @resultadoA int

EXEC @resultadoA = EliminarNoticia 5

IF (@resultadoA=1)
	PRINT 'La eliminación fue correcta'
IF (@resultadoA=-1)
	PRINT 'El numero interno no exxiste en la base de datos'
IF (@resultadoA=-2)
	PRINT 'Otro tipo de error'
END
GO



-- PARTE B: MODIFICAR SECCION
CREATE PROCEDURE ModificarSeccion
@codigo varchar(3),
@nombre varchar(20) 
AS
BEGIN
	-- Si no existe el codigo de la seccion devuelve -1
	IF NOT EXISTS (SELECT * FROM Secciones WHERE Codigo=@codigo) 
		RETURN -1

	-- Si tiene noticas asociadas no se puede modificar por lo que devuelve -2
	IF EXISTS (SELECT * FROM NoticiasNacionales WHERE CodigoSeccion=@codigo)
		RETURN -2
	
	-- Si llega hasta aqui es porque las dos condiciones anteriores se complieron y no salio del SP.
	
	UPDATE Secciones SET Nombre=@nombre WHERE Codigo=@codigo
	RETURN 1
END
GO

--			* * * PRUEBA ::::>  PARTE B: MODIFICAR SECCION * * * *  
BEGIN
DECLARE @resultadoB int

EXEC @resultadoB = ModificarSeccion 'CAL','Clasificados' 

IF (@resultadoB=1)
	PRINT 'La modificacion fue correcta'
IF (@resultadoB=-1)
	PRINT 'El CODIGO no existe en la base de datos'
IF (@resultadoB=-2)
	PRINT 'tiene noticias nacionales asociadas, no se puede MODIFICAR'
END
GO


-- PARTE C: AGREGAR NOTICIA NACIONAL
CREATE PROCEDURE AgregarNoticiaNacional
@fecha datetime,
@Title varchar(30),
@Resum varchar(100),
@Content varchar(250),
@NroPeriodista int,
@CodSeccion varchar(3)
AS 
BEGIN

	--Para agregar una noticia tiene que tener un periodista
	IF NOT EXISTS (SELECT * FROM Periodistas WHERE Codigo=@NroPeriodista)
		RETURN -1  -- EL PERIODISTA NO EXISTE 

	--Para agregar una noticia nacional tiene que antes existir la seccion
	IF NOT EXISTS (SELECT * FROM Secciones WHERE Codigo=@CodSeccion)
		RETURN -2  -- LA SECCION NO EXISTE

    -- AGREGAR LA NOTICIA NACIONAL 
	BEGIN TRAN
		INSERT Noticias (FechaHora,Titulo,Resumen, Contenido, CodigoPeriodista) 
		VALUES (@fecha,	@Title,	@Resum,	@Content, @NroPeriodista)
	

		IF (@@ERROR !=0)
		BEGIN
			ROLLBACK TRAN
			RETURN -3 -- ERROR AL INSERTAR LA NOTICIA
		END 

		INSERT NoticiasNacionales(CodigoNoticia,CodigoSeccion) 
		VALUES (@@IDENTITY,@CodSeccion)
		
		IF (@@ERROR !=0)
		BEGIN
			ROLLBACK TRAN
			RETURN -4 -- ERROR AL INSERTAR LA NOTICIA NACIONAL
		END 
	COMMIT TRAN
	RETURN  IDENT_CURRENT('Noticias')  -- DEVUELVE EL ULTIMO NRO REGISTRADO 
END
GO

--			* * * PARTE C: AGREGAR NOTICIA NACIONAL * * * 

BEGIN
	DECLARE @resultadoC int

	EXEC @resultadoC = AgregarNoticiaNacional '20220707','Titulito','Resumensito','contenido', 3,'DEP'

	IF (@resultadoC=-1)
		PRINT 'El periodista no existe, no se puede ingresar la noticia'
	IF (@resultadoC=-2)
		PRINT 'La seccion no existe, no se puede ingresar la noticia'
	IF (@resultadoC=-3)
		PRINT 'Error al insertar la noticia'
	IF (@resultadoC=-4)
		PRINT 'Error al insertar la noticia nacional'
	IF (@resultadoC>0)
		PRINT 'La noticia se creo correctamente. El registro es el Nro.: ' + CAST(@resultadoC AS varchar)
END
GO

--PARTE D: TOTAL NOTICIAS POR PERIODISTAS
CREATE PROCEDURE TotalNoticiasPorPeriodista 
AS
BEGIN
	SELECT	
		Periodistas.Nombre AS 'Nombre Periodista',
		Periodistas.Email AS 'Email Periodista',
		COUNT(Noticias.Codigo) AS 'Cantidad Noticias'
	FROM Noticias 
		INNER JOIN 	Periodistas 
	ON 	Periodistas.Codigo= Noticias.CodigoPeriodista 
		GROUP BY Periodistas.Codigo,Periodistas.Email,Periodistas.Nombre
END
GO

--			* * * PARTE D: TOTAL DE NOTICIAS POR PERIODISTA * * *'
BEGIN
	EXEC TotalNoticiasPorPeriodista
END
GO


-- PARTE E: TOTAL NOTICAS DEL PERIODO
CREATE PROCEDURE TotalNoticasDelPeriodo(@FechaInicio as DateTime, @FechaFin as DateTime)
AS
BEGIN
	DECLARE @cantidad as INT
	
	SELECT 
		@cantidad=COUNT(Noticias.Codigo) 
	FROM
		Noticias 
	WHERE 
		FechaHora BETWEEN @FechaInicio AND @FechaFin
	
	RETURN @cantidad
END
GO

--			* * * PARTE E: TOTAL DE NOTICIAS DENTRO DE UN PERIODO DE FECHAS * * * '

BEGIN
DECLARE @ResultadoE as int

EXEC @ResultadoE= TotalNoticasDelPeriodo '20220808','20220810'

IF (@resultadoE<=0)
	PRINT 'NO HAY NOTICIAS DENTRO DEL PERIODO '
ELSE
	PRINT 'HAY: ' + CAST(@ResultadoE as varchar) + ' noticias'
END
GO



-- PARTE F: TOTAL NOTICIAS POR SECCION Y FECHA
CREATE PROCEDURE TotalNoticiasPorSeccionYFecha 
AS
BEGIN
	SELECT 
		CONVERT(DATe,FechaHora,4) AS Fecha, Secciones.Nombre,COUNT(*) AS Cantidad
	FROM 
		(Noticias
	INNER JOIN 
		NoticiasNacionales
	ON
		Noticias.Codigo = NoticiasNacionales.CodigoNoticia)
	INNER JOIN 
		Secciones ON CodigoSeccion=Secciones.Codigo 
	GROUP BY CONVERT(DATE,Noticias.FechaHora,4),  Secciones.Nombre
	ORDER BY CONVERT(DATE,Noticias.FechaHora,4)	
END
GO


--			* * * PARTE F: TOTAL NOTICIAS POR SECCION Y FECHA * * *'
EXEC TotalNoticiasPorSeccionYFecha 


