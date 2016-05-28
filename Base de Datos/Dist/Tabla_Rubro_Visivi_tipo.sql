
 /*drop table dbo.PublicacionTipo
 drop table dbo.PublicacionRubro
 drop table dbo.PublicacionVisibilidad
 drop table dbo.Publicacion
 go 

 
 ----------------------------------------------------------------------------------
 ------------ Tabla PublicacionTipo------------------------------------------------
 
 create table PublicacionTipo( 
   PublicacionTipo_Id int not null identity,
   PublicacionTipo_Descripcion nvarchar (255))
go
insert into dbo.PublicacionTipo(PublicacionTipo_Descripcion) 
select distinct Publicacion_Tipo from gd_esquema.Maestra
where Publicacion_Tipo is not null 




------------------------------------------------------------------------------------
--------------Tabla PublicacionRubro------------------------------------------------

create table PublicacionRubro(
   PublicacionRubro_Id int  not null identity,
   PublicacionRubro_Descripcion nvarchar (255))
go
insert into dbo.publicacionRubro (PublicacionRubro_Descripcion)
select distinct Publicacion_Rubro_Descripcion from gd_esquema.Maestra
where Publicacion_Rubro_Descripcion is not null 

----------------------------------------------------------------------------------
-------------Tabla PublicacionVisibilidad----------------------------------------
--visibilidades (gratis,plata,oro,bronce,platino) 

 create table PublicacionVisibilidad ( 
     PublicacionVisibilidad_Id int not null identity,
     PublicacionVisibilidad_Cod numeric (18, 0),
     PublicacionVisibilidad_Desc nvarchar (255), 
     PublicacionVisibilidad_Precio numeric (18, 2),
     PublicacionVisibilidad_Porcentaje numeric (18, 2))
go

insert into dbo.PublicacionVisibilidad (PublicacionVisibilidad_Cod, 
 PublicacionVisibilidad_desc, 
 PublicacionVisibilidad_Precio, 
 PublicacionVisibilidad_Porcentaje)  
select distinct
 Publicacion_Visibilidad_Cod, 
 Publicacion_Visibilidad_desc, 
 Publicacion_Visibilidad_Precio, 
 Publicacion_Visibilidad_Porcentaje
from gd_esquema.Maestra   
where Publicacion_Visibilidad_Cod is not null  */

--------------------------------------------------------------------------
---------------Tabla Publicacion ----------------------------------------
/*
create table Publicacion (
     Publicacion_Id int not null identity,
	 Publicacion_Id_PublicacionTipo int,
	 Publicacion_Id_PublicacionVisibilidad int,
	 Publicacion_Id_Usuario int,
     Publicacion_Cod numeric(18, 0),
     Publicacion_Descripcion nvarchar(255), 
     Publicacion_Stock numeric(18, 0),
     Publicacion_Fecha datetime,
     Publicacion_Fecha_Venc datetime,
     Publicacion_Precio numeric (18, 2),
	 Publicacion_Estado nvarchar(255))
 go

 insert into dbo.Publicacion (Publicacion_Id_PublicacionTipo,Publicacion_Id_PublicacionVisibilidad,
     Publicacion_Id_Usuario,Publicacion_Cod, Publicacion_Descripcion, Publicacion_Stock,Publicacion_Fecha,
     Publicacion_Fecha_Venc,Publicacion_Precio,Publicacion_Estado)
 select distinct
 Publ_Cli_Dni, 
 Publ_Empresa_Razon_Social,
 Publicacion_Cod, 
 Publicacion_Descripcion, 
 Publicacion_Stock,
 Publicacion_Fecha,
 Publicacion_Fecha_Venc,
 Publicacion_Precio,
 Publicacion_Estado
 from gd_esquema.Maestra 


*/


 select
 Publ_Cli_Dni, 
 Publ_Empresa_Razon_Social,
 PublicacionVisibilidad_Id,
 Publicacion_Tipo,
 Publicacion_Rubro_Descripcion,
 Publicacion_Cod, 
 Publicacion_Descripcion, 
 Publicacion_Stock,
 Publicacion_Fecha,
 Publicacion_Fecha_Venc,
 Publicacion_Precio,
 Publicacion_Estado
from gd_esquema.Maestra 
left join dbo.PublicacionVisibilidad  
on Publicacion_Visibilidad_Cod = PublicacionVisibilidad_Cod
left join dbo.PublicacionTipo
on Publicacion_Tipo = PublicacionTipo_Descripcion
left join dbo.PublicacionRubro
on Publicacion_Rubro_Descripcion = PublicacionRubro_Descripcion
--on Publ_Empresa_Razon_Social = Empresa_Razon_Social

--select * from dbo.PublicacionRubro
--select * from dbo.PublicacionTipo
--select * from dbo.PublicacionVisibilidad