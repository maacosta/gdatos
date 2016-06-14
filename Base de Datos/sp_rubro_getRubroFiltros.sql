IF (OBJECT_ID('sp_rubro_getRubroFiltros') IS NOT NULL)
drop PROCEDURE sp_rubro_getRubroFiltros
go

CREATE PROCEDURE sp_rubro_getRubroFiltros (@id int, @codigo numeric(18,0), @desccorta nvarchar(50), @desclarga nvarchar(255))
AS

BEGIN

declare @query nvarchar(1024)

set @query = 'select id, codigo, DescCorta, DescLarga from gd_esquema.Rubro'

set @query = @query + ' WHERE 1=1'

if (@id is not null) set @query = @query + ' AND ID=' + convert(char(5),@id)
if (@codigo is not null) set @query = @query + ' AND CODIGO=' + convert(char(10),@codigo)
if (@desccorta is not null) set @query = @query + ' AND DescCorta=''' + @desccorta + ''''
if (@desclarga is not null) set @query = @query + ' AND DescLarga=''' + @desclarga + ''''

exec (@query)

END
GO

/*
exec sp_rubro_getRubroFiltros null, null, null, null
go

exec sp_rubro_getRubroFiltros null, null, 'Soportes', null
go

exec sp_rubro_getRubroFiltros null, null, 'Computación', null
go

exec sp_rubro_getRubroFiltros null, '105', null, null
go

exec sp_rubro_getRubroFiltros 24, null, null, null
go*/