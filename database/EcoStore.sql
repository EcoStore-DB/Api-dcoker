[EcommerceSostenible]

USE [master]
GO

     

/****** Object:  Database [EcommerceSostenible]    Script Date: 6/6/2025 10:44:20 ******/
CREATE DATABASE [EcommerceSostenible]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceSostenible', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcommerceSostenible.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceSostenible_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcommerceSostenible_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcommerceSostenible] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceSostenible].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceSostenible] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EcommerceSostenible] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceSostenible] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceSostenible] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EcommerceSostenible] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceSostenible] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcommerceSostenible] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceSostenible] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceSostenible] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceSostenible] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceSostenible] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceSostenible] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceSostenible] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcommerceSostenible] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceSostenible] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO

     
[Sofi]

USE [EcommerceSostenible]
GO

     

/****** Object:  User [Sofi]    Script Date: 6/6/2025 10:44:20 ******/
CREATE USER [Sofi] FOR LOGIN [Sofi] WITH DEFAULT_SCHEMA=[dbo]
GO

     
[Mauricio]

/****** Object:  User [Mauricio]    Script Date: 6/6/2025 10:44:20 ******/
CREATE USER [Mauricio] FOR LOGIN [Mauricio] WITH DEFAULT_SCHEMA=[dbo]
GO

     
[Admin]

/****** Object:  User [Admin]    Script Date: 6/6/2025 10:44:20 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO

     
[rol_vendedor]

/****** Object:  DatabaseRole [rol_vendedor]    Script Date: 6/6/2025 10:44:20 ******/
CREATE ROLE [rol_vendedor]
GO

     
[rol_cliente]

/****** Object:  DatabaseRole [rol_cliente]    Script Date: 6/6/2025 10:44:20 ******/
CREATE ROLE [rol_cliente]
GO

     
[rol_admin]

/****** Object:  DatabaseRole [rol_admin]    Script Date: 6/6/2025 10:44:20 ******/
CREATE ROLE [rol_admin]
GO

     
[Sofi]

ALTER ROLE [rol_vendedor] ADD MEMBER [Sofi]
GO

     
[Mauricio]

ALTER ROLE [rol_cliente] ADD MEMBER [Mauricio]
GO

     
[Admin]

ALTER ROLE [rol_admin] ADD MEMBER [Admin]
GO

     
[dbo].[DetallesOrden]

/****** Object:  Table [dbo].[DetallesOrden]    Script Date: 6/6/2025 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesOrden](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_orden] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

     
[dbo].[Ordenes]

/****** Object:  Table [dbo].[Ordenes]    Script Date: 6/6/2025 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[id_orden] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[fecha] [datetime] NULL,
	[total] [decimal](10, 2) NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

     
[dbo].[Productos]

/****** Object:  Table [dbo].[Productos]    Script Date: 6/6/2025 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

     
[dbo].[Reseñas]

/****** Object:  Table [dbo].[Reseñas]    Script Date: 6/6/2025 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

     
[dbo].[Usuarios]

/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/6/2025 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[contraseña] [varchar](255) NULL,
	[rol] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

     
[dbo].[DetallesOrden]

SET IDENTITY_INSERT [dbo].[DetallesOrden] ON 
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (1, 1, 1, 2, CAST(5.98 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (2, 1, 2, 1, CAST(1.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (3, 2, 1, 3, CAST(8.97 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesOrden] OFF
GO

     
[dbo].[Ordenes]

SET IDENTITY_INSERT [dbo].[Ordenes] ON 
INSERT [dbo].[Ordenes] ([id_orden], [id_cliente], [fecha], [total], [estado]) VALUES (1, 1, CAST(N'2025-06-06T10:29:19.273' AS DateTime), CAST(7.48 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Ordenes] ([id_orden], [id_cliente], [fecha], [total], [estado]) VALUES (2, 1, CAST(N'2025-06-06T10:29:28.917' AS DateTime), CAST(10.00 AS Decimal(10, 2)), N'Pagado')
SET IDENTITY_INSERT [dbo].[Ordenes] OFF
GO

     
[dbo].[Productos]

SET IDENTITY_INSERT [dbo].[Productos] ON 
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (1, N'Cepillo de bambú', N'Biodegradable y ecoamigable', CAST(2.99 AS Decimal(10, 2)), 97, 2, N'Higiene', 1, CAST(4.50 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (2, N'Bolsa reutilizable', N'Hecha con tela reciclada', CAST(1.50 AS Decimal(10, 2)), 200, 2, N'Hogar', 1, CAST(5.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (3, N'Botella de acero inoxidable', N'Botella térmica libre de BPA', CAST(12.99 AS Decimal(10, 2)), 50, 2, N'Cocina', 1, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (4, N'Jabón artesanal ecológico', N'Sin químicos ni envases plásticos', CAST(3.50 AS Decimal(10, 2)), 150, 2, N'Higiene', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (5, N'Shampoo sólido', N'Alternativa sin plástico para cabello saludable', CAST(6.75 AS Decimal(10, 2)), 120, 2, N'Higiene', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (6, N'Ropa hecha con algodón orgánico', N'Camiseta ecológica y cómoda', CAST(14.99 AS Decimal(10, 2)), 70, 2, N'Moda', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (7, N'Tenis reciclados', N'Fabricados con botellas PET recicladas', CAST(39.99 AS Decimal(10, 2)), 60, 2, N'Moda', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (8, N'Papel reciclado A4', N'Paquete de hojas 100% recicladas', CAST(4.00 AS Decimal(10, 2)), 90, 2, N'Oficina', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (9, N'Cargador solar portátil', N'Ideal para celulares y tablets', CAST(24.99 AS Decimal(10, 2)), 40, 2, N'Tecnología', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (10, N'Cepillo de coco para platos', N'Alternativa natural y compostable', CAST(2.25 AS Decimal(10, 2)), 130, 2, N'Cocina', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (11, N'Cubiertos de bambú', N'Juego de cubiertos reutilizables', CAST(5.99 AS Decimal(10, 2)), 110, 2, N'Cocina', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (12, N'Compresas de tela reutilizables', N'Alternativa ecológica para higiene femenina', CAST(7.50 AS Decimal(10, 2)), 80, 2, N'Salud', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (13, N'Detergente ecológico', N'Sin fosfatos, ideal para ropa y medio ambiente', CAST(8.99 AS Decimal(10, 2)), 95, 2, N'Limpieza', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (14, N'Macetas biodegradables', N'Para cultivo doméstico sustentable', CAST(3.20 AS Decimal(10, 2)), 85, 2, N'Jardinería', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (15, N'Filtros de café reutilizables', N'Hechos de acero inoxidable', CAST(4.99 AS Decimal(10, 2)), 75, 2, N'Cocina', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (16, N'Toallas de cocina compostables', N'Hechas de fibras vegetales', CAST(3.75 AS Decimal(10, 2)), 65, 2, N'Hogar', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (17, N'Velas de soya natural', N'Aroma suave y sin parafina', CAST(6.99 AS Decimal(10, 2)), 50, 2, N'Decoración', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (18, N'Lámpara solar de jardín', N'Funciona con energía solar, sin cables', CAST(10.00 AS Decimal(10, 2)), 70, 2, N'Jardinería', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (19, N'Camiseta con tinta ecológica', N'Impresión sin solventes ni tóxicos', CAST(13.49 AS Decimal(10, 2)), 90, 2, N'Moda', 1, CAST(0.00 AS Decimal(3, 2)))
INSERT [dbo].[Productos] ([id_producto], [nombre], [descripcion], [precio], [stock], [id_vendedor], [categoria], [sostenible], [promedio_calificacion]) VALUES (20, N'Mochila de cáñamo', N'Resistente y sostenible', CAST(29.90 AS Decimal(10, 2)), 45, 2, N'Moda', 1, CAST(0.00 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO

     
[dbo].[Reseñas]

SET IDENTITY_INSERT [dbo].[Reseñas] ON 
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (1, 1, 1, 5, N'Excelente calidad y ecológico', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (2, 1, 1, 4, N'Muy bueno pero podría mejorar el empaque', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (3, 2, 1, 5, N'Perfecta para mis compras sostenibles', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (4, 3, 1, 3, N'Normal, nada sorprendente', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (5, 3, 1, 4, N'Cumple con lo esperado', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reseñas] OFF
GO

     
[dbo].[Usuarios]

SET IDENTITY_INSERT [dbo].[Usuarios] ON 
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (1, N'Mauricio', N'mauri@eco.com', N'pass123', N'cliente')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (2, N'Sofi', N'sofi@eco.com', N'vendedora1', N'vendedor')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (3, N'Admin', N'admin@eco.com', N'admin123', N'admin')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO

     
[UQ__Usuarios__2A586E0B8131AF4F]

SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__2A586E0B8131AF4F]    Script Date: 6/6/2025 10:44:21 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

     
[DF__Ordenes__fecha__3E52440B]

ALTER TABLE [dbo].[Ordenes] ADD  DEFAULT (getdate()) FOR [fecha]
GO

     
[DF__Reseñas__fecha__46E78A0C]

ALTER TABLE [dbo].[Reseñas] ADD  DEFAULT (getdate()) FOR [fecha]
GO

     
[FK__DetallesO__id_or__4222D4EF]

ALTER TABLE [dbo].[DetallesOrden]  WITH CHECK ADD FOREIGN KEY([id_orden])
REFERENCES [dbo].[Ordenes] ([id_orden])
GO

     
[FK__DetallesO__id_pr__4316F928]

ALTER TABLE [dbo].[DetallesOrden]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO

     
[FK__Ordenes__id_clie__3F466844]

ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

     
[FK__Productos__id_ve__3B75D760]

ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([id_vendedor])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

     
[FK__Reseñas__id_prod__47DBAE45]

ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO

     
[FK__Reseñas__id_usua__48CFD27E]

ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

     
[CK__Reseñas__calific__45F365D3]

ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD CHECK  (([calificacion]>=(1) AND [calificacion]<=(5)))
GO

     
[CK__Usuarios__rol__38996AB5]

ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD CHECK  (([rol]='admin' OR [rol]='vendedor' OR [rol]='cliente'))
GO

     
[EcommerceSostenible]

USE [master]
GO

     

ALTER DATABASE [EcommerceSostenible] SET  READ_WRITE 
GO
