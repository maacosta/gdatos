USE [GD1C2016]
GO
-- Eliminar tablas, si existen
IF OBJECT_ID('[gd_esquema].[Cliente]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Cliente]; 

IF OBJECT_ID('[gd_esquema].[Empresa]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Empresa]; 

IF OBJECT_ID('[gd_esquema].[FacturaItem]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[FacturaItem]; 

IF OBJECT_ID('[gd_esquema].[Factura]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Factura]; 

IF OBJECT_ID('[gd_esquema].[FormaPago]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[FormaPago]; 

IF OBJECT_ID('[gd_esquema].[PublicacionCalificacion]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[PublicacionCalificacion]; 

--IF OBJECT_ID('[gd_esquema].[PublicacionPreguntas]', 'U') IS NOT NULL 
 -- DROP TABLE [gd_esquema].[PublicacionPreguntas]; 

IF OBJECT_ID('[gd_esquema].[CompraOferta]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[CompraOferta]; 

IF OBJECT_ID('[gd_esquema].[Publicacion]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Publicacion]; 

IF OBJECT_ID('[gd_esquema].[Rubro]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Rubro]; 

IF OBJECT_ID('[gd_esquema].[Visibilidad]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Visibilidad]; 


IF OBJECT_ID('[gd_esquema].[RolPermiso]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[RolPermiso];  

IF OBJECT_ID('[gd_esquema].[Permiso]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Permiso];  
 
IF OBJECT_ID('[gd_esquema].[UsuarioRol]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[UsuarioRol]; 
 
IF OBJECT_ID('[gd_esquema].[Rol]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Rol]; 

IF OBJECT_ID('[gd_esquema].[Usuario]', 'U') IS NOT NULL 
  DROP TABLE [gd_esquema].[Usuario];  

/*
Creación de nuevas tablas
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [gd_esquema].[Cliente](
	[IdUsuario] [int] NOT NULL,
	[Dni] [numeric](18, 0) NOT NULL,
	[TipoDocumento] [varchar](3) NULL,
	[Apellido] [nvarchar](255) NULL,
	[Nombre] [nvarchar](255) NULL,
	[FechaNacimiento] [datetime] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Cliente_Dni_TipoDocumento] UNIQUE NONCLUSTERED 
(
	[Dni] ASC,
	[TipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [gd_esquema].[CompraOferta]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [gd_esquema].[CompraOferta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPublicacion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cantidad] [numeric](18, 0) NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_CompraOferta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [gd_esquema].[Empresa]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Empresa](
	[IdUsuario] [int] NOT NULL,
	[Cuit] [nvarchar](50) NOT NULL,
	[RazonSocial] [nvarchar](255) NOT NULL,
	[Ciudad] [nvarchar](50) NULL,
	[NombreContacto] [nvarchar](50) NULL,
	[RubroPrincipal] [nchar](10) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Empresa_Cuit] UNIQUE NONCLUSTERED 
(
	[Cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Empresa_RazonSocial] UNIQUE NONCLUSTERED 
(
	[RazonSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Factura]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Factura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[Numero] [numeric](18, 0) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[FacturaItem]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[FacturaItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdCompraOferta] [int] NULL,
	[Monto] [numeric](18, 2) NOT NULL,
	[Cantidad] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_FacturaItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[FormaPago]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[FormaPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Localidad]    Script Date: 15/06/2016 02:37:30 a.m. ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [gd_esquema].[Localidad](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nombre] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]

--GO
/****** Object:  Table [gd_esquema].[Permiso]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Permiso](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Publicacion]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [gd_esquema].[Publicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [numeric](18, 0) NOT NULL,
	[TipoPublicacion] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Stock] [numeric](18, 0) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
	[IdRubro] [int] NOT NULL,
	[IdVisibilidad] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [gd_esquema].[PublicacionCalificacion]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[PublicacionCalificacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPublicacion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Calificacion] [smallint] NOT NULL,
	[Comentario] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PublicacionCalificacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[PublicacionPreguntas]    Script Date: 15/06/2016 02:37:30 a.m. ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [gd_esquema].[PublicacionPreguntas](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[IdPublicacion] [int] NOT NULL,
--	[IdUsuario] [int] NOT NULL,
--	[Pregunta] [nvarchar](255) NOT NULL,
-- CONSTRAINT [PK_PublicacionPreguntas] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]

--GO
/****** Object:  Table [gd_esquema].[Rol]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Rol](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[RolPermiso]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[RolPermiso](
	[IdRol] [int] NOT NULL,
	[IdPermiso] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Rubro]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Rubro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [numeric](18, 0) NOT NULL,
	[DescCorta] [nvarchar](50) NOT NULL,
	[DescLarga] [nvarchar](255) NULL,
 CONSTRAINT [PK_Rubro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Rubro_Codigo] UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Usuario]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PassHash] [nvarchar](64) NULL,
	[PassSalt] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Calle] [nvarchar](255) NULL,
	[Numero] [numeric](18, 0) NULL,
	[Piso] [numeric](18, 0) NULL,
	[Depto] [nvarchar](50) NULL,
	[CodigoPostal] [nvarchar](50) NULL,
	[Localidad] [nvarchar] (255) NULL,
	[Intentos] [int] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Usuario_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[UsuarioRol]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[UsuarioRol](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [gd_esquema].[Visibilidad]    Script Date: 15/06/2016 02:37:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gd_esquema].[Visibilidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [numeric](18, 0) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
	[Porcentaje] [numeric](18, 2) NOT NULL,
	[PorcentajeEnvio] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Visibilidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [gd_esquema].[Cliente] ADD  CONSTRAINT [DF_Cliente_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [gd_esquema].[Empresa] ADD  CONSTRAINT [DF_Empresa_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [gd_esquema].[Publicacion] ADD  CONSTRAINT [DF_Publicacion_Estado]  DEFAULT ('B') FOR [Estado]
GO
ALTER TABLE [gd_esquema].[Usuario] ADD  CONSTRAINT [DF_Usuario_Intentos]  DEFAULT ((0)) FOR [Intentos]
GO
ALTER TABLE [gd_esquema].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [gd_esquema].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [FK_CompraOferta_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [gd_esquema].[Publicacion] ([Id])
GO
ALTER TABLE [gd_esquema].[CompraOferta] CHECK CONSTRAINT [FK_CompraOferta_Publicacion]
GO
ALTER TABLE [gd_esquema].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [FK_CompraOferta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[CompraOferta] CHECK CONSTRAINT [FK_CompraOferta_Usuario]
GO
ALTER TABLE [gd_esquema].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[Empresa] CHECK CONSTRAINT [FK_Empresa_Usuario]
GO
ALTER TABLE [gd_esquema].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_FormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [gd_esquema].[FormaPago] ([Id])
GO
ALTER TABLE [gd_esquema].[Factura] CHECK CONSTRAINT [FK_Factura_FormaPago]
GO
ALTER TABLE [gd_esquema].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[Factura] CHECK CONSTRAINT [FK_Factura_Usuario]
GO
ALTER TABLE [gd_esquema].[FacturaItem]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItem_CompraOferta] FOREIGN KEY([IdCompraOferta])
REFERENCES [gd_esquema].[CompraOferta] ([Id])
GO
ALTER TABLE [gd_esquema].[FacturaItem] CHECK CONSTRAINT [FK_FacturaItem_CompraOferta]
GO
ALTER TABLE [gd_esquema].[FacturaItem]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItem_Factura] FOREIGN KEY([IdFactura])
REFERENCES [gd_esquema].[Factura] ([Id])
GO
ALTER TABLE [gd_esquema].[FacturaItem] CHECK CONSTRAINT [FK_FacturaItem_Factura]
GO
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Rubro] FOREIGN KEY([IdRubro])
REFERENCES [gd_esquema].[Rubro] ([Id])
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Rubro]
GO
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Usuario]
GO
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_Publicacion_Visibilidad] FOREIGN KEY([IdVisibilidad])
REFERENCES [gd_esquema].[Visibilidad] ([Id])
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [FK_Publicacion_Visibilidad]
GO
ALTER TABLE [gd_esquema].[PublicacionCalificacion]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionCalificacion_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [gd_esquema].[Publicacion] ([Id])
GO
ALTER TABLE [gd_esquema].[PublicacionCalificacion] CHECK CONSTRAINT [FK_PublicacionCalificacion_Publicacion]
GO
ALTER TABLE [gd_esquema].[PublicacionCalificacion]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionCalificacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[PublicacionCalificacion] CHECK CONSTRAINT [FK_PublicacionCalificacion_Usuario]
GO
--ALTER TABLE [gd_esquema].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Publicacion] FOREIGN KEY([IdPublicacion])
--REFERENCES [gd_esquema].[Publicacion] ([Id])
--GO
--ALTER TABLE [gd_esquema].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Publicacion]
--GO
--ALTER TABLE [gd_esquema].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Usuario] FOREIGN KEY([IdUsuario])
--REFERENCES [gd_esquema].[Usuario] ([Id])
--GO
--ALTER TABLE [gd_esquema].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Usuario]
--GO
ALTER TABLE [gd_esquema].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Permiso] FOREIGN KEY([IdPermiso])
REFERENCES [gd_esquema].[Permiso] ([Id])
GO
ALTER TABLE [gd_esquema].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Permiso]
GO
ALTER TABLE [gd_esquema].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Rol] FOREIGN KEY([IdRol])
REFERENCES [gd_esquema].[Rol] ([Id])
GO
ALTER TABLE [gd_esquema].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Rol]
GO
--ALTER TABLE [gd_esquema].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Localidad] FOREIGN KEY([IdLocalidad])
--REFERENCES [gd_esquema].[Localidad] ([Id])
--GO
--ALTER TABLE [gd_esquema].[Usuario] CHECK CONSTRAINT [FK_Usuario_Localidad]
--GO
ALTER TABLE [gd_esquema].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Rol] FOREIGN KEY([IdRol])
REFERENCES [gd_esquema].[Rol] ([Id])
GO
ALTER TABLE [gd_esquema].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Rol]
GO
ALTER TABLE [gd_esquema].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Usuario]
GO
ALTER TABLE [gd_esquema].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_Cliente_TipoDocumento] CHECK  (([TipoDocumento]='LE' OR [TipoDocumento]='LC' OR [TipoDocumento]='DNI'))
GO
ALTER TABLE [gd_esquema].[Cliente] CHECK CONSTRAINT [CK_Cliente_TipoDocumento]
GO
ALTER TABLE [gd_esquema].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [CK_CompraOferta_Tipo] CHECK  (([Tipo]='C' OR [Tipo]='O'))
GO
ALTER TABLE [gd_esquema].[CompraOferta] CHECK CONSTRAINT [CK_CompraOferta_Tipo]
GO
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [CK_Publicacion_Estado] CHECK  (([Estado]='F' OR [Estado]='P' OR [Estado]='A' OR [Estado]='B'))
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [CK_Publicacion_Estado]
GO
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [CK_Publicacion_TipoPublicacion] CHECK  (([TipoPublicacion]='S' OR [TipoPublicacion]='C'))
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [CK_Publicacion_TipoPublicacion]
GO
