IF (OBJECT_ID('LOS_DE_ADELANTE.sp_factura_getFacturaFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_factura_getFacturaFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_factura_getFacturaFiltros
(
	@fechaDesde datetime, 
	@fechaHasta datetime, 
	@montoDesde numeric(18,2), 
	@montoHasta numeric(18,2), 
	@textoDetalle nvarchar(50), 
	@usuarioComprador nvarchar(50), 
	@usuario nvarchar(50)
)
AS
BEGIN		

	IF OBJECT_ID('tempdb..#TFacturas') IS NOT NULL DROP TABLE #TFacturas

	select distinct
		f.Id,
		f.IdFormaPago,
		fp.Descripcion FormaPago,
		f.Numero,
		f.Fecha,
		f.Total,
		p.Id IdPublicacion,
		p.Codigo CodigoPublicacion,
		p.Descripcion,
		u.Username Usuario,
		c.Id IdCompra,
		c.Fecha FechaCompra,
		u2.Username UsuarioComprador
	into #TFacturas
	from LOS_DE_ADELANTE.Factura f
		inner join LOS_DE_ADELANTE.Usuario u on f.IdUsuario = u.Id
		inner join LOS_DE_ADELANTE.FormaPago fp on f.IdFormaPago = fp.Id
		inner join LOS_DE_ADELANTE.FacturaItem fi on f.Id = fi.IdFactura
		inner join LOS_DE_ADELANTE.Compra c on c.Id = fi.IdCompra
		inner join LOS_DE_ADELANTE.Usuario u2 on c.IdUsuario = u2.Id
		inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
	where u.Username = @usuario
		and (@fechaDesde is null or (@fechaDesde is not null and f.Fecha >= @fechaDesde))
		and (@fechaHasta is null or (@fechaHasta is not null and f.Fecha <= @fechaHasta))
		and (@montoDesde is null or (@montoDesde is not null and f.Total >= @montoDesde))
		and (@montoHasta is null or (@montoHasta is not null and f.Total <= @montoHasta))
		and (@usuarioComprador is null or (@usuarioComprador is not null and u2.Username = @usuarioComprador))
		and (@textoDetalle is null or (@textoDetalle is not null and p.Descripcion like '%' + @textoDetalle + '%'))

	select
		Id,
		IdFormaPago,
		FormaPago,
		Numero,
		Fecha,
		Total,
		IdPublicacion,
		CodigoPublicacion,
		Descripcion,
		Usuario,
		IdCompra,
		FechaCompra,
		UsuarioComprador
	from #TFacturas

	select distinct
		fi.IdFactura,
		fi.Id,
		fi.IdCompra,
		fi.Monto,
		fi.Cantidad
	from LOS_DE_ADELANTE.FacturaItem fi
		inner join #TFacturas tf on tf.Id = fi.IdFactura

END
go
