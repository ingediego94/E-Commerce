/* https://www.youtube.com/watch?v=16N5OhcrLws&list=PLx2nia7-PgoDptcrh4k4ZStjpVLZbS7rU&ab_channel=CodigoEstudiante */

/*CREAR LA BD*/
CREATE DATABASE DBCARRITO

GO

USE DBCARRITO

GO

/*CREAR LAS TABLAS*/

/*Crear tabla de CATEGORIA*/
CREATE TABLE CATEGORIA(
IdCategoria int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
);

GO

/*Crear tabla de MARCA*/
CREATE TABLE MARCA(
IdMarca int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
);

GO

/*Crear tabla de PRODUCTO*/
CREATE TABLE PRODUCTO(
IdProducto int primary key identity,
Nombre varchar(500),
Descripcion varchar (500),
IdMarca int references Marca(IdMarca), /*Establece una relacion con el campo en cuestion*/
IdCategoria int references Categoria(IdCategoria),
Precio decimal (10,2) default 0,   /*Un campo decimal de 10 digitos y precision de 2 decimales*/
Stock int,
RutaImagen varchar(100), /*Ruta donde se alojara la imagen*/
NombreImagen varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
);

GO

/*Crear tabla de CLIENTE*/
CREATE TABLE CLIENTE(
IdCliente int primary key identity, 
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(150),
Clave varchar(150),
Restablecer bit default 0,	/*Usado para restablecer contrasena*/
FechaRegistro datetime default getdate()
);

GO

/*Crear tabla de CARRITO*/
CREATE TABLE CARRITO(
IdCarrito int primary key identity,
IdCliente int references CLIENTE(IdCliente),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int	
);

GO

/*Crear tabla de VENTA*/
CREATE TABLE VENTA(
IdVenta int primary key identity,
IdCliente int references CLIENTE(IdCliente),
TotalProducto int,
MontoTotal decimal(10,2),
Contacto varchar (50),
IdDistrito varchar(10),
Telefono varchar(50),
Direccion varchar(500),
IdTransaccion varchar (50),  /*Para guardar el numero de transaccion de paypal*/
FechaVenta datetime default getdate()
);

GO

/*Crear tabla de DETALLE_VENTA*/
CREATE TABLE DETALLE_VENTA(
IdDetalleVenta int primary key identity,
IdVenta int references Venta (IdVenta),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int,
Total decimal(10,2)
);

GO


/*Crear tabla de USUARIO*/
CREATE TABLE USUARIO(
IdUsuario int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Reestablecer bit default 1, /*Para restablecer la contrasena*/
Activo bit default 1,
FechaRegistro datetime default getdate()
);

GO

/*Crear tabla de DEPARTAMENTO*/
CREATE TABLE DEPARTAMENTO(
IdDepartamento varchar(2) NOT NULL,
Descripcion varchar(45) NOT NULL,
);

GO


/*Crear tabla de PROVINCIA*/
CREATE TABLE PROVINCIA(
IdProvincia varchar (4) NOT NULL,
Descripcion varchar(45) NOT NULL,
IdDepartamento varchar(2) NOT NULL
);

GO


/*Crear tabla de DISTRITO*/
CREATE TABLE DISTRITO(
IdDistrito varchar(6) NOT NULL,
Descripcion varchar(45) NOT NULL,
IdProvincia varchar(4) NOT NULL,
IdDepartamento varchar(2) NOT NULL
);

GO




/*-------------------------*/
/* https://www.youtube.com/watch?v=zWBCDJueNJc&list=PLx2nia7-PgoDptcrh4k4ZStjpVLZbS7rU&index=4&ab_channel=CodigoEstudiante */

/*INSERCION DE ALGUNOS DATOS*/

/*INSERCION DATOS TABLA USUARIO*/
SELECT *
	FROM USUARIO;

INSERT INTO USUARIO(Nombres, Apellidos, Correo, Clave) 
	VALUES ('test nombre', 'test apellido', 'test@example.com', 'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae');
/*No se ingresan los tres campos del final de esta tabla, porque ya traen valores por defecto*/
/*En esta pagina se puede encriptar la contrasena:*/
/*https://emn178.github.io/online-tools/sha256.html */



/*INSERCION DATOS TABLA CATEGORIA*/
SELECT *
	FROM CATEGORIA;


/*No se ingresan los datos de IdCategoria, Activo y FechaRegistro, porque se llenan por defecto*/
INSERT INTO CATEGORIA(Descripcion) VALUES 
	('Tecnologia'),
	('Muebles'),
	('Dormitorio'),
	('Deportes');



/*INSERCION DATOS TABLA MARCA*/
SELECT *
	FROM MARCA;

	/*No se ingresan los datos de IdMarca, Activo y FechaRegistro porque se llenan por defecto automaticamente*/
INSERT INTO MARCA(Descripcion) VALUES
	('SONYTE'),
	('HPTE'),
	('LGTE'),
	('HYUNDAITE'),
	('CANONTE'),
	('ROBERTA ALLENTE');

/*INSERCION DATOS TABLA DEPARTAMENTO*/
SELECT *
	FROM DEPARTAMENTO;

INSERT INTO DEPARTAMENTO (IdDepartamento, Descripcion) VALUES
	('01','Arequipa'),
	('02','Ica'),
	('03','Lima');

/*INSERCION DATOS DE TABLA PROVINCIA*/
SELECT *
	FROM PROVINCIA;

INSERT INTO PROVINCIA (IdProvincia, Descripcion, IdDepartamento) VALUES
	('0101','Arequipa','01'),
	('0102','Camaná','01'),

	-- ICA PROVINCIAS
	('0201','Ica','02'),
	('0202','Chincha','02'),

	-- LIMA PROVINCIAS
	('0301','Lima','03'),
	('0302','Barranca','03')

-- INSERTAR DATOS TABLA DISTRITO
SELECT *
	FROM DISTRITO;

INSERT INTO DISTRITO (IdDistrito, Descripcion, IdProvincia, IdDepartamento)
VALUES
	('010101','Nieva','0101','01'),
	('010102','El Cenepa', '0101', '02'),

	('010201','Camaná','0102','01'),
	('010202','José María Quimper','0102','01'),
	
	--ICA DISTRITO
	('020101','Ica','0201','02'),
	('020102','La Tinguiña','0201','02'),
	('020201','Chincha Alta','0202','02'),
	('020202','Alto Laran','0202','02'),

	-- LIMA DISTRITO
	('030101','Lima','0301','03'),
	('030102','Ancón','0301','03'),
	('030201','Barranca','0302','03'),
	('030202','Paramonga','0302','03');

