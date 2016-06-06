----------------------------------- Tabla Rubro-----------------------

---Funcion CodigoRubro no se utiliza en la creacion de la tabla Rubro
 /* IF OBJECT_ID (N'codigoRubro', N'FN') IS NOT NULL
DROP FUNCTION codigoRubro;
Go
create function codigoRubro (@rubro nvarchar(255))
returns numeric (18,0)
as
begin
declare @resultado numeric(18,0)
set @resultado = ascii (@rubro) * len (@rubro)
return @resultado
end
go */

/*
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
--------------------------------------------------------------
----------------tabla Visibilidad----------------------------

 --SUBSTRING

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
  
--------------------------------------------------------------------------------
--- tabla Publicacion-------------------------------------------------

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
 
 */

 /*IF OBJECT_ID (N'usuarioPublicaron', N'IF') IS NOT NULL
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


--select  * from usuarioPublicaron()


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

*/
