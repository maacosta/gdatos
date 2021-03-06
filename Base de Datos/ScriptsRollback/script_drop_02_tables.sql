/*
Eliminar tablas [LOS_DE_ADELANTE], si existen
*/

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

IF OBJECT_ID('[LOS_DE_ADELANTE].[Compra]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Compra]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Oferta]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Oferta]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[CompraOferta]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[CompraOferta]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionPreguntas]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionPreguntas]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionCalificacion]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionCalificacion]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Rubro]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Rubro]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Visibilidad]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Visibilidad]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionTipo]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionTipo]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[PublicacionEstado]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[PublicacionEstado]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Publicacion]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Publicacion]; 

IF OBJECT_ID('[LOS_DE_ADELANTE].[Usuario]', 'U') IS NOT NULL 
  DROP TABLE [LOS_DE_ADELANTE].[Usuario]; 

GO
