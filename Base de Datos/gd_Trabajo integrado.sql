set nocount on  --deshabilita el mensaje   "x rows affected"

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Inicio'

--Elimina / Crea objetos de la base
USE [GD1C2016]

--El order para droppear las tablas 
drop table [gd_esquema].[FacturaItem]
drop table [gd_esquema].[Factura]
drop table [gd_esquema].[PublicacionCalificacion]
drop table [gd_esquema].[PublicacionPreguntas]
drop table [gd_esquema].[CompraOferta]
drop table [gd_esquema].[Publicacion]
drop table [gd_esquema].[Rubro]
drop table [gd_esquema].[FormaPago]
drop table [gd_esquema].[Visibilidad]
drop table [gd_esquema].[Empresa]
drop table [gd_esquema].[Cliente]
drop table [gd_esquema].[Usuario]
drop table [gd_esquema].[Localidad]

--------------------Creacion De Tablas---------------------------
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
)ON [PRIMARY]

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

CREATE TABLE [gd_esquema].[FacturaItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdCompraOferta] [int] NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
	[Cantidad] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_FacturaItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [gd_esquema].[Localidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [gd_esquema].[Publicacion](
	[Id] [int] NOT NULL,
	[Codigo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TipoPublicacion] [nvarchar](255) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Stock] [numeric](18, 0) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
	[IdUsuario1] [int]  NULL, --hera not null
	[IdRubro] [int] NOT NULL,
	[IdVisibilidad] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Publicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [gd_esquema].[PublicacionPreguntas](
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

CREATE TABLE [gd_esquema].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Username] [nvarchar](50) NULL,
	[PassHash] [varchar](64) NULL,
	[PassSalt] [smallint] NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Calle] [nvarchar](255) NULL,
	[Numero] [numeric](18, 0) NULL,
	[Piso] [numeric](18, 0) NULL,
	[Depto] [nvarchar](50) NULL,
	[CodigoPostal] [nvarchar](50) NULL,
	[IdLocalidad] [int] NULL)
--CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
-- ( [Id] ASC )
--  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 -- CONSTRAINT [UK_Usuario_Username] UNIQUE NONCLUSTERED 

-- ([Username] ASC) 
  -- WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--) ON [PRIMARY] 
 
GO

CREATE TABLE [gd_esquema].[Visibilidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
ALTER TABLE [gd_esquema].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Publicacion] FOREIGN KEY([IdPublicacion])
REFERENCES [gd_esquema].[Publicacion] ([Id])
GO
ALTER TABLE [gd_esquema].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Publicacion]
GO
ALTER TABLE [gd_esquema].[PublicacionPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionPreguntas_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [gd_esquema].[Usuario] ([Id])
GO
ALTER TABLE [gd_esquema].[PublicacionPreguntas] CHECK CONSTRAINT [FK_PublicacionPreguntas_Usuario]
GO
ALTER TABLE [gd_esquema].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [gd_esquema].[Localidad] ([Id])
GO
ALTER TABLE [gd_esquema].[Usuario] CHECK CONSTRAINT [FK_Usuario_Localidad]
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
ALTER TABLE [gd_esquema].[Publicacion]  WITH CHECK ADD  CONSTRAINT [CK_Publicacion_TipoPublicacion] CHECK  (([TipoPublicacion]='Subasta' OR [TipoPublicacion]='Compra Inmediata'))
GO
ALTER TABLE [gd_esquema].[Publicacion] CHECK CONSTRAINT [CK_Publicacion_TipoPublicacion]
GO

/********************Rubro****************************/
IF OBJECT_ID (N'descripcionCorta', N'FN') IS NOT NULL
DROP FUNCTION descripcionCorta;
Go
 
 create function descripcionCorta(@rubro nvarchar(255))
 returns nvarchar(50)
 as
 begin
 declare @resultado  nvarchar(50)
 set @resultado = @rubro
 return @resultado
 end 
 go 



 /*****************Visibilidad**********************************/
IF OBJECT_ID (N'porcentajeEnvio', N'FN') IS NOT NULL
DROP FUNCTION porcentajeEnvio;
Go
 
 create function porcentajeEnvio(@porcentaje numeric (18,2))
 returns numeric(18,2)
 as
 begin
 declare @resultado  numeric(18,2)
 set @resultado = @porcentaje
 return @resultado
 end 
 go 


/******************Publicacion*************************************/
IF OBJECT_ID (N'Usu_Cli_Emp', N'IF') IS NOT NULL
DROP FUNCTION Usu_Cli_Emp;
Go
create function Usu_Cli_Emp()
returns table 
as
return(
   select Id,Cuit,RazonSocial,Dni from gd_esquema.Usuario
    left join gd_esquema.Empresa on Id = Empresa.IdUsuario
    left join gd_esquema.Cliente on Id = Cliente.IdUsuario );
go  
 
 

IF OBJECT_ID (N'usuarioPublicaron', N'IF') IS NOT NULL
DROP FUNCTION usuarioPublicaron;
go
create function usuarioPublicaron()
returns table
as
return(
 select distinct Publicacion_Cod,Publicacion_Tipo,Publicacion_Estado, Publicacion_Descripcion,Publicacion_Stock,
 Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,Cli_Dni,Rubro.Id as rubroId,Visibilidad.Id as viId,uce.Id as usuPublico
from gd_esquema.Maestra
left join gd_esquema.Visibilidad
on Publicacion_Visibilidad_Desc = Descripcion
left join gd_esquema.Rubro
on Publicacion_Rubro_Descripcion = DescLarga
left join Usu_Cli_Emp() as uce
on(uce.Dni = Publ_Cli_Dni) or (uce.RazonSocial = Publ_Empresa_Razon_Social  and uce.Cuit = Publ_Empresa_Cuit));
go



IF OBJECT_ID (N'publicacionEstado', N'FN') IS NOT NULL
DROP FUNCTION publicacionEstado;
go
create function publicacionEstado(@estado nvarchar(255))
returns char (1)
as
begin
    declare @resultado char (1)
	if (@estado = 'Publicada')
	set @resultado = 'P'
	else set @resultado = 'N'
	return @resultado
end 
go

----------  FIN DE CREACIÓN DE OBJETOS



--Datos

-----------------------------------------------------------------------------------------------------------
-------------Poblacion de tablas---------------------------------------------------------------------------
drop table #TC
drop table #te
drop table #tr
drop table #tpu

delete from gd_esquema.Cliente
delete from gd_esquema.Empresa
delete from gd_esquema.Usuario
delete from gd_esquema.Rubro
delete from gd_esquema.FormaPago
delete from gd_esquema.Visibilidad
delete from gd_esquema.Publicacion

--Temporal de Clientes
create table #TC(TC_Cli_Dni numeric (18, 0),TC_Cli_Apellido nvarchar (255),TC_Cli_Nombre nvarchar (255),TC_Cli_Fecha_Nac datetime,TC_Cli_Mail nvarchar (255),
	             TC_Cli_Dom_Calle nvarchar (255),TC_Cli_Nro_Calle numeric (18, 0),TC_Cli_Piso numeric (18, 0),TC_Cli_Depto nvarchar (50),
	             TC_Cli_Cod_Postal nvarchar (50))

insert  into dbo.#TC (TC_Cli_Dni,TC_Cli_Apellido,TC_Cli_Nombre,TC_Cli_Fecha_Nac,TC_Cli_Mail,TC_Cli_Dom_Calle,TC_Cli_Nro_Calle,TC_Cli_Piso,
	                  TC_Cli_Depto,TC_Cli_Cod_Postal)
select distinct Cli_Dni,Cli_Apeliido,Cli_Nombre,Cli_Fecha_Nac,Cli_Mail,Cli_Dom_Calle,Cli_Nro_Calle,Cli_Piso,Cli_Depto,Cli_Cod_Postal 
	from gd_esquema.Maestra where Cli_Dni is not null
	union
select distinct Publ_Cli_Dni,Publ_Cli_Apeliido,Publ_cli_Nombre,Publ_cli_Fecha_Nac,Publ_Cli_Mail,Publ_Cli_Dom_Calle,Publ_Cli_Nro_Calle,Publ_Cli_Piso,Publ_Cli_Depto,Publ_Cli_Cod_Postal 
     from gd_esquema.Maestra  where Publ_Cli_Dni is not null

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla temporal de Clientes: ' + convert(char(50),@@ROWCOUNT)

 --Temporal de Empresas
 create table dbo.#te (te_Empresa_Razon_Social nvarchar (255),te_Empresa_Cuit nvarchar(50),te_Empresa_Fecha_Creacion datetime,te_Empresa_Mail nvarchar(50),
              te_Empresa_Dom_Calle nvarchar(100),te_Empresa_Nro_Calle numeric (18,0),te_Empresa_Piso numeric (18,0),te_Empresa_Depto nvarchar (50),
              te_Empresa_Cod_Postal nvarchar (255))

insert into dbo.#te (te_Empresa_Razon_Social,te_Empresa_Cuit,te_Empresa_Fecha_Creacion,te_Empresa_Mail,te_Empresa_Dom_Calle,te_Empresa_Nro_Calle,te_Empresa_Piso,
            te_Empresa_Depto,te_Empresa_Cod_Postal)
select distinct Publ_Empresa_Razon_Social,Publ_Empresa_Cuit,Publ_Empresa_Fecha_Creacion,Publ_Empresa_Mail,Publ_Empresa_Dom_Calle,
                Publ_Empresa_Nro_Calle,Publ_Empresa_Piso,Publ_Empresa_Depto,Publ_Empresa_Cod_Postal from gd_esquema.Maestra
       where Publ_Empresa_Razon_Social is not null and Publ_Empresa_Cuit is not null

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla temporal de Empresas: ' + convert(char(50),@@ROWCOUNT)

-- Usuario
insert into gd_esquema.Usuario(Mail,Calle,Numero,Piso,Depto,CodigoPostal) 
select TC_Cli_Mail,TC_Cli_Dom_Calle,TC_Cli_Nro_Calle,TC_Cli_Piso,TC_Cli_Depto,TC_Cli_Cod_Postal from dbo.#TC

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Usuarios desde temporal de Clientes: ' + convert(char,@@ROWCOUNT)

insert into gd_esquema.Usuario (Mail,Calle,Numero,Piso,Depto,CodigoPostal) 
select te_Empresa_Mail,te_Empresa_Dom_Calle,te_Empresa_Nro_Calle,te_Empresa_Piso,te_Empresa_Depto,te_Empresa_Cod_Postal from dbo.#te

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Usuarios desde temporal de Empresas: ' + convert(char,@@ROWCOUNT)

-- Cliente
insert into gd_esquema.Cliente (Dni,IdUsuario,Apellido,Nombre,FechaNacimiento)  
select distinct TC_Cli_Dni,Id, TC_Cli_Apellido,TC_Cli_Nombre,TC_Cli_Fecha_Nac from dbo.#TC, gd_esquema.Usuario 
where TC_Cli_Mail = Mail and TC_Cli_Dom_Calle = Calle and TC_Cli_Nro_Calle = Numero
   and TC_Cli_Piso = Piso and TC_Cli_Depto =  Depto and TC_Cli_Cod_Postal = CodigoPostal
order by Id

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Clientes desde temporal de Clientes: ' + convert(char,@@ROWCOUNT)

insert into gd_esquema.Empresa (IdUsuario,Cuit,RazonSocial,FechaCreacion)
select 	Id,te_Empresa_Cuit,te_Empresa_Razon_Social,te_Empresa_Fecha_Creacion from dbo.#te, gd_esquema.Usuario
where te_Empresa_Mail = Mail and te_Empresa_Dom_Calle = Calle and te_Empresa_Nro_Calle = Numero
and te_Empresa_Piso = Piso and te_Empresa_Depto = Depto and te_Empresa_Cod_Postal = CodigoPostal
order by Id 

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Empresas desde temporal de Empresas: ' + convert(char,@@ROWCOUNT)

create table #tr(trDescLarga nvarchar(255), trCodigo numeric (18,0) identity (100,1) NOT NULL,trDescCorta nvarchar(50) )

insert into dbo.#tr (trDescLarga,trDescCorta)
select distinct Publicacion_Rubro_Descripcion, dbo.descripcionCorta(Publicacion_Rubro_Descripcion)  
from gd_esquema.Maestra where Publicacion_Rubro_Descripcion is not null order by 2

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla temporal de Rubros: ' + convert(char,@@ROWCOUNT)

insert into gd_esquema.Rubro (DescLarga,Codigo,DescCorta)
select trDescLarga,trCodigo,trDescCorta from dbo.#tr

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Rubros desde temporal de Rubros: ' + convert(char,@@ROWCOUNT)

-- FormaPago
insert into gd_esquema.FormaPago(Descripcion)
select distinct Forma_Pago_Desc from gd_esquema.Maestra where Forma_Pago_Desc is not null

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla FormaPago: ' + convert(char,@@ROWCOUNT)

insert into gd_esquema.Visibilidad (Descripcion,Precio,Porcentaje,PorcentajeEnvio)
select distinct Publicacion_Visibilidad_desc,Publicacion_Visibilidad_Precio,Publicacion_Visibilidad_Porcentaje,dbo.porcentajeEnvio(Publicacion_Visibilidad_Porcentaje)
from gd_esquema.Maestra  where Publicacion_Visibilidad_Cod is not null

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla Visibilidad: ' + convert(char,@@ROWCOUNT)

create table #tpu(tpId int identity  not null,
	tpTipoPublicacion nvarchar(255), 
	tpEstado char (1) ,
	tpDescripcion nvarchar(255),
	tpStock numeric (18, 0), 
	tpFechaInicio datetime,
	tpFechaVencimiento datetime ,
	tpPrecio numeric (18, 2),
	tpIdUsuario1 int ,
	tpIdRubro int,
	tpIdVisibilidad int ,
	tpIdUsuario int NOT NULL) 
 
insert into dbo.#tpu(tpTipoPublicacion,tpEstado,tpDescripcion,tpStock,tpFechaInicio,tpFechaVencimiento,tpPrecio,tpIdUsuario1,tpIdRubro,tpIdVisibilidad,tpIdUsuario)
select Publicacion_Tipo, dbo.publicacionEstado(Publicacion_Estado), Publicacion_Descripcion,Publicacion_Stock,Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,u.Id, rubroId, viId, usuPublico
from usuarioPublicaron() as up
left join Usu_Cli_Emp()as u
on u.dni = up.Cli_Dni

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla temporal de Publicaciones: ' + convert(char,@@ROWCOUNT)

insert into gd_esquema.Publicacion(Id,TipoPublicacion,Estado,Descripcion,Stock,FechaInicio,FechaVencimiento,Precio,IdUsuario1,IdRubro,IdVisibilidad,IdUsuario) 
select * from dbo.#tpu

print 'Time: ' + format(getdate(),'HH:mm:ss') + ' - Cargando tabla de Publicaciones: ' + convert(char,@@ROWCOUNT)

----------   FIN DE MIGRACIÓN DE DATOS