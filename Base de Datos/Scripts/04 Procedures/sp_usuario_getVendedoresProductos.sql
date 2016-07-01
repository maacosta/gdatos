IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getVendedoresProductos') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getVendedoresProductos
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getVendedoresProductos
(
	@anio int,
	@trimestre int --1, 2, 3, 4
)
AS
BEGIN		

	declare @triIni int = (@trimestre - 1) * 3 + 1
	declare @triFin int = (@trimestre) * 3 + 1

	select 
		e.Id, 
		e.Username, 
		right('0' + e.Mes, 2) + '-' + Anio MesAnio, 
		e.CodigoVisibilidad, 
		e.DescripcionVisibilidad, 
		e.StockTotal
	from (
		select top 5
			u.Id,
			u.Username,
			convert(varchar(4), year(p.FechaInicio)) Anio,
			convert(varchar(2), month(p.FechaInicio)) Mes,
			v.Codigo CodigoVisibilidad,
			v.Descripcion DescripcionVisibilidad,
			sum(p.Stock) StockTotal
		from LOS_DE_ADELANTE.Usuario u
			inner join LOS_DE_ADELANTE.Publicacion p on p.IdUsuario = u.Id
			inner join LOS_DE_ADELANTE.Visibilidad v on p.IdVisibilidad = v.Id
		where p.Stock > 0
			and year(p.FechaInicio) = @anio
			and month(p.FechaInicio) >= @triIni
			and month(p.FechaInicio) < @triFin
		group by
			u.Id,
			u.Username,
			convert(varchar(4), year(p.FechaInicio)),
			convert(varchar(2), month(p.FechaInicio)),
			v.Codigo,
			v.Descripcion
		order by StockTotal desc
	) e
	order by MesAnio asc, e.CodigoVisibilidad asc

END
go
