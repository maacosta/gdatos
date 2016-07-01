IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getClientesProductos') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getClientesProductos
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getClientesProductos
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
		e.CodigoRubro, 
		e.DescripcionRubro, 
		e.CantidadTotal
	from (
		select top 5
			u.Id,
			u.Username,
			convert(varchar(4), year(co.Fecha)) Anio,
			convert(varchar(2), month(co.Fecha)) Mes,
			r.Codigo CodigoRubro,
			r.DescCorta DescripcionRubro,
			sum(co.Cantidad) CantidadTotal
		from LOS_DE_ADELANTE.Usuario u
			inner join LOS_DE_ADELANTE.CompraOferta co on co.IdUsuario = u.Id
			inner join LOS_DE_ADELANTE.Publicacion p on co.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.Rubro r on p.IdRubro = r.Id
		where 1 = 1
			and year(co.Fecha) = @anio
			and month(co.Fecha) >= @triIni
			and month(co.Fecha) < @triFin
		group by
			u.Id,
			u.Username,
			convert(varchar(4), year(co.Fecha)),
			convert(varchar(2), month(co.Fecha)),
			r.Codigo,
			r.DescCorta
		order by CantidadTotal desc
	) e
	order by MesAnio asc, e.CodigoRubro asc

END
go
