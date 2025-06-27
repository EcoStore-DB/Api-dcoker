IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'EcommerceSostenible1')
BEGIN
    CREATE DATABASE EcommerceSostenible1;
END
GO

USE EcommerceSostenible1;
GO
-- Tabla Usuarios
CREATE TABLE [dbo].[Usuarios](
    [id_usuario] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](100) NULL,
    [correo] [varchar](100) NULL,
    [contraseña] [varchar](255) NULL,
    [rol] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
    [id_usuario] ASC
)
);
GO

-- Tabla Productos
CREATE TABLE [dbo].[Productos](
    [id_producto] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](100) NULL,
    [descripcion] [text] NULL,
    [precio] [decimal](10, 2) NULL,
    [stock] [int] NULL,
    [id_vendedor] [int] NULL,
    [categoria] [varchar](50) NULL,
    [sostenible] [bit] NULL,
    [promedio_calificacion] [decimal](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
    [id_producto] ASC
)
);
GO

-- Tabla Ordenes
CREATE TABLE [dbo].[Ordenes](
    [id_orden] [int] IDENTITY(1,1) NOT NULL,
    [id_cliente] [int] NULL,
    [fecha] [datetime] NULL,
    [total] [decimal](10, 2) NULL,
    [estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
    [id_orden] ASC
)
);
GO

-- Tabla DetallesOrden
CREATE TABLE [dbo].[DetallesOrden](
    [id_detalle] [int] IDENTITY(1,1) NOT NULL,
    [id_orden] [int] NULL,
    [id_producto] [int] NULL,
    [cantidad] [int] NULL,
    [subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
    [id_detalle] ASC
)
);
GO

-- Tabla Reseñas
CREATE TABLE [dbo].[Reseñas](
    [id_reseña] [int] IDENTITY(1,1) NOT NULL,
    [id_producto] [int] NULL,
    [id_usuario] [int] NULL,
    [calificacion] [int] NULL,
    [comentario] [text] NULL,
    [fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
    [id_reseña] ASC
)
);
GO