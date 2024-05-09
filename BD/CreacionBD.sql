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
Descripçion varchar(100),
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