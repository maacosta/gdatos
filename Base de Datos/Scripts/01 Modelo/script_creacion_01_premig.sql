
/*
funcion usuarioPublicaron()
*/
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


/*
funcion publicacionEstado() 
*/

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

/*
funcion usuarioPublicaron()
*/
IF OBJECT_ID (N'fn_mig_getTipoPublicacion', N'FN') is not null
	DROP FUNCTION fn_mig_getTipoPublicacion;
go
create function fn_mig_getTipoPublicacion
(
	@tipoPublicacion nvarchar(255)
)
returns char(1)
as
begin
    declare @resultado char (1)
	if (@tipoPublicacion = 'Compra Inmediata')
		set @resultado = 'C'
	else 
		set @resultado = 'S'
	return @resultado
end
go