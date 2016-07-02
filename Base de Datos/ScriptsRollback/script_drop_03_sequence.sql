
declare @sql varchar(max)
--drop procedures
set @sql = (
	select 'DROP PROCEDURE [' + routine_schema + '].[' + routine_name + '] ' 
	from information_schema.routines 
	where routine_schema = 'LOS_DE_ADELANTE' and routine_type = 'PROCEDURE'
	FOR XML PATH ('')
)

exec (@sql)

--drop functions
set @sql = (
	select 'DROP FUNCTION [' + routine_schema + '].[' + routine_name + '] ' 
	from information_schema.routines 
	where routine_schema = 'LOS_DE_ADELANTE' and routine_type = 'FUNCTION'
	FOR XML PATH ('')
)

exec (@sql)

--drop Sequences
DROP SEQUENCE [LOS_DE_ADELANTE].[sq_factura]
GO

DROP SEQUENCE [LOS_DE_ADELANTE].[sq_publicacion]
GO

--drop schema
DROP SCHEMA [LOS_DE_ADELANTE]
GO
