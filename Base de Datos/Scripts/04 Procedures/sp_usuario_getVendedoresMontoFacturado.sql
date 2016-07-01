IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getVendedoresMontoFacturado') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getVendedoresMontoFacturado
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getVendedoresMontoFacturado
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
		e.MontoFacturado
	from (
		select top 5
			u.Id,
			u.Username,
			convert(varchar(4), year(f.Fecha)) Anio,
			convert(varchar(2), month(f.Fecha)) Mes,
			sum(f.Total) MontoFacturado
		from LOS_DE_ADELANTE.Usuario u
			inner join LOS_DE_ADELANTE.Factura f on u.Id = f.IdUsuario
		where 1 = 1
			and year(f.Fecha) = @anio
			and month(f.Fecha) >= @triIni
			and month(f.Fecha) < @triFin
		group by
			u.Id,
			u.Username,
			convert(varchar(4), year(f.Fecha)),
			convert(varchar(2), month(f.Fecha))
		order by MontoFacturado desc
	) e
	order by MesAnio asc

END
go
