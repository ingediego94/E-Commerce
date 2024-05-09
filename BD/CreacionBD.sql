/*CREAR LA BD*/
CREATE DATABASE DBCARRITO

GO

USE DBCARRITO

GO

/*CREAR LAS TABLAS*/
CREATE TABLE CATEGORIA(
IdCategoria int primary key identity,
Descripçion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
);

GO
CREATE TABLE MARCA(

);


