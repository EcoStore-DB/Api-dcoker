USE EcommerceSostenible1;

-- DetallesOrden
SET IDENTITY_INSERT [dbo].[DetallesOrden] ON 
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (1, 1, 1, 2, CAST(5.98 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (2, 1, 2, 1, CAST(1.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesOrden] ([id_detalle], [id_orden], [id_producto], [cantidad], [subtotal]) VALUES (3, 2, 1, 3, CAST(8.97 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesOrden] OFF
GO

-- Ordenes
SET IDENTITY_INSERT [dbo].[Ordenes] ON 
INSERT [dbo].[Ordenes] ([id_orden], [id_cliente], [fecha], [total], [estado]) VALUES (1, 1, CAST(N'2025-06-06T10:29:19.273' AS DateTime), CAST(7.48 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[Ordenes] ([id_orden], [id_cliente], [fecha], [total], [estado]) VALUES (2, 1, CAST(N'2025-06-06T10:29:28.917' AS DateTime), CAST(10.00 AS Decimal(10, 2)), N'Pagado')
SET IDENTITY_INSERT [dbo].[Ordenes] OFF
GO

-- Productos
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

-- Reseñas
SET IDENTITY_INSERT [dbo].[Reseñas] ON 
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (1, 1, 1, 5, N'Excelente calidad y ecológico', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (2, 1, 1, 4, N'Muy bueno pero podría mejorar el empaque', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (3, 2, 1, 5, N'Perfecta para mis compras sostenibles', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (4, 3, 1, 3, N'Normal, nada sorprendente', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
INSERT [dbo].[Reseñas] ([id_reseña], [id_producto], [id_usuario], [calificacion], [comentario], [fecha]) VALUES (5, 3, 1, 4, N'Cumple con lo esperado', CAST(N'2025-06-06T10:33:34.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reseñas] OFF
GO

-- Usuarios
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (1, N'Mauricio', N'mauri@eco.com', N'pass123', N'cliente')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (2, N'Sofi', N'sofi@eco.com', N'vendedora1', N'vendedor')
INSERT [dbo].[Usuarios] ([id_usuario], [nombre], [correo], [contraseña], [rol]) VALUES (3, N'Admin', N'admin@eco.com', N'admin123', N'admin')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO