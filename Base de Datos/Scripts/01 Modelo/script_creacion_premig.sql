USE [GD1C2016]
GO

/*
Esquema del grupo
*/

CREATE SCHEMA [LOS_DE_ADELANTE]
go

/*
funcion usuarioPublicaron()
*/

IF OBJECT_ID (N'LOS_DE_ADELANTE.fn_mig_getTipoPublicacion', N'FN') is not null
	DROP FUNCTION LOS_DE_ADELANTE.fn_mig_getTipoPublicacion;
go
create function LOS_DE_ADELANTE.fn_mig_getTipoPublicacion
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
