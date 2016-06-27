USE [GD1C2016]
GO

-- Eliminar tablas [LOS_DE_ADELANTE], si existen
IF OBJECT_ID('[LOS_DE_ADELANTE].[RolPermiso]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[RolPermiso]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[UsuarioRol]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[UsuarioRol]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Rol]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Rol]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Permiso]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Permiso]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Cliente]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Cliente]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Empresa]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Empresa]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[FacturaItem]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[FacturaItem]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Factura]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Factura]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[FormaPago]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[FormaPago]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionCalificacion]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionPreguntas]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[CompraOferta]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[CompraOferta]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Publicacion]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Publicacion]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Usuario]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Usuario]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Rubro]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Rubro]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Visibilidad]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Visibilidad]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Localidad]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Localidad]; 

IF OBJECT_ID(N'[LOS_DE_ADELANTE].[sq_publicacion]') IS NOT NULL
  DROP SEQUENCE [LOS_DE_ADELANTE].[sq_publicacion]
GO

/*
Creación de nuevas tablas
*/

/****** Object:  Table [LOS_DE_ADELANTE].[Cliente]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Cliente](
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
/****** Object:  Table [LOS_DE_ADELANTE].[CompraOferta]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[CompraOferta](
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
/****** Object:  Table [LOS_DE_ADELANTE].[Empresa]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Empresa](
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
/****** Object:  Table [LOS_DE_ADELANTE].[Factura]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Factura](
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
/****** Object:  Table [LOS_DE_ADELANTE].[FacturaItem]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[FacturaItem](
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
/****** Object:  Table [LOS_DE_ADELANTE].[FormaPago]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[FormaPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[Permiso]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Permiso](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[Publicacion]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Publicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [numeric](18, 0) NOT NULL,
	[TipoPublicacion] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Stock] [numeric](18, 0) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
	[Costo] [numeric](18, 2) NULL,
	[PermitirPreguntas] [bit] NOT NULL,
	[IncluirEnvio] [bit] NULL,
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
/****** Object:  Table [LOS_DE_ADELANTE].[PublicacionCalificacion]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPublicacion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Calificacion] [smallint] NOT NULL,
	[Comentario] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PublicacionCalificacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[PublicacionPreguntas]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPublicacion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Pregunta] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PublicacionPreguntas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[Rol]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Rol](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[RolPermiso]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[RolPermiso](
	[IdRol] [int] NOT NULL,
	[IdPermiso] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[Rubro]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Rubro](
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
/****** Object:  Table [LOS_DE_ADELANTE].[Usuario]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Usuario](
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
	[Localidad] [nvarchar](255) NULL,
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
/****** Object:  Table [LOS_DE_ADELANTE].[UsuarioRol]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[UsuarioRol](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [LOS_DE_ADELANTE].[Visibilidad]    Script Date: 20/06/2016 11:34:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOS_DE_ADELANTE].[Visibilidad](
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
ALTER TABLE [LOS_DE_ADELANTE].[Cliente] ADD  CONSTRAINT [DF_Cliente_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Empresa] ADD  CONSTRAINT [DF_Empresa_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion] ADD  CONSTRAINT [DF_Publicacion_Estado]  DEFAULT ('B') FOR [Estado]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion] ADD  CONSTRAINT [DF_Publicacion_PermitirPreguntas]  DEFAULT ((1)) FOR [PermitirPreguntas]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Usuario] ADD  CONSTRAINT [DF_Usuario_Intentos]  DEFAULT ((0)) FOR [Intentos]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [FK_CompraOferta_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [LOS_DE_ADELANTE].[Publicacion] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta] CHECK CONSTRAINT [FK_CompraOferta_Publicacion]
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [FK_CompraOferta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta] CHECK CONSTRAINT [FK_CompraOferta_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[Empresa] CHECK CONSTRAINT [FK_Empresa_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_FormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [LOS_DE_ADELANTE].[FormaPago] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[Factura] CHECK CONSTRAINT [FK_Factura_FormaPago]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[Factura] CHECK CONSTRAINT [FK_Factura_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[FacturaItem]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItem_CompraOferta] FOREIGN KEY([IdCompraOferta])
REFERENCES [LOS_DE_ADELANTE].[CompraOferta] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[FacturaItem] CHECK CONSTRAINT [FK_FacturaItem_CompraOferta]
GO
ALTER TABLE [LOS_DE_ADELANTE].[FacturaItem]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItem_Factura] FOREIGN KEY([IdFactura])
REFERENCES [LOS_DE_ADELANTE].[Factura] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[FacturaItem] CHECK CONSTRAINT [FK_FacturaItem_Factura]
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionCalificacion_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [LOS_DE_ADELANTE].[Publicacion] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion] CHECK CONSTRAINT [FK_PublicacionCalificacion_Publicacion]
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionCalificacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion] CHECK CONSTRAINT [FK_PublicacionCalificacion_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [LOS_DE_ADELANTE].[Publicacion] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Publicacion]
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Permiso] FOREIGN KEY([IdPermiso])
REFERENCES [LOS_DE_ADELANTE].[Permiso] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Permiso]
GO
ALTER TABLE [LOS_DE_ADELANTE].[RolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_RolPermiso_Rol] FOREIGN KEY([IdRol])
REFERENCES [LOS_DE_ADELANTE].[Rol] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[RolPermiso] CHECK CONSTRAINT [FK_RolPermiso_Rol]
GO
ALTER TABLE [LOS_DE_ADELANTE].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Rol] FOREIGN KEY([IdRol])
REFERENCES [LOS_DE_ADELANTE].[Rol] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Rol]
GO
ALTER TABLE [LOS_DE_ADELANTE].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [LOS_DE_ADELANTE].[Usuario] ([Id])
GO
ALTER TABLE [LOS_DE_ADELANTE].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Usuario]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_Cliente_TipoDocumento] CHECK  (([TipoDocumento]='LE' OR [TipoDocumento]='LC' OR [TipoDocumento]='DNI'))
GO
ALTER TABLE [LOS_DE_ADELANTE].[Cliente] CHECK CONSTRAINT [CK_Cliente_TipoDocumento]
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta]  WITH CHECK ADD  CONSTRAINT [CK_CompraOferta_Tipo] CHECK  (([Tipo]='C' OR [Tipo]='O'))
GO
ALTER TABLE [LOS_DE_ADELANTE].[CompraOferta] CHECK CONSTRAINT [CK_CompraOferta_Tipo]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion]  WITH CHECK ADD  CONSTRAINT [CK_Publicacion_Estado] CHECK  (([Estado]='F' OR [Estado]='P' OR [Estado]='A' OR [Estado]='B'))
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion] CHECK CONSTRAINT [CK_Publicacion_Estado]
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion]  WITH CHECK ADD  CONSTRAINT [CK_Publicacion_TipoPublicacion] CHECK  (([TipoPublicacion]='S' OR [TipoPublicacion]='C'))
GO
ALTER TABLE [LOS_DE_ADELANTE].[Publicacion] CHECK CONSTRAINT [CK_Publicacion_TipoPublicacion]
GO
