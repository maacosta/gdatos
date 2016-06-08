/*
funcion descripcionCorta()--------------------------falta
*/

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

 /*
 funcion porcentajeEnvio() ------------------Falta
 */
 
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
  
/*
funcion Usu_Cli_Emp() 
*/
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

/*
PublicacionTipo
*/

IF OBJECT_ID (N'publicacionTipo', N'FN') IS NOT NULL
DROP FUNCTION publicacionTipo;
go
create function publicacionTipo(@tipo nvarchar(255))
returns char (1)
as
begin
    declare @resultado char (1)
	if (@tipo = 'Compra Inmediata')
	set @resultado = 'C'
	else set @resultado = 'S'
	return @resultado
end 
go

