USE [GD1C2016]
GO

/*
Esquema del grupo
*/
IF EXISTS (SELECT name FROM sys.schemas WHERE name = N'LOS_DE_ADELANTE')
	DROP SCHEMA [LOS_DE_ADELANTE]
GO

CREATE SCHEMA [LOS_DE_ADELANTE]
GO

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

/*
funcion cantEstrellas()
*/
IF OBJECT_ID (N'fn_mig_cantEstrellas', N'FN') is not null
	DROP FUNCTION fn_mig_cantEstrellas;
go
create function fn_mig_cantEstrellas
(
	@calificacionCantEstrellas numeric(18,0)
)
returns smallint 
as
begin
    declare @resultado smallint 
	if (@calificacionCantEstrellas > 5)
		set @resultado = 5
	else 
		set @resultado = @calificacionCantEstrellas
	return @resultado
end
go