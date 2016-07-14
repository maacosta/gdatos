IF (OBJECT_ID('LOS_DE_ADELANTE.sp_factura_insFactura') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_factura_insFactura
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_factura_insFactura
(
	@idPublicacion int,
	@idCompra int,
	@fechaSistema datetime
)
AS
BEGIN
	declare @idUsuarioP int
	declare @precioP numeric(18, 2)
	declare @incluirEnvioP bit
	declare @precioV numeric(18, 2)
	declare @porcentajeV numeric(18, 2)
	declare @porcentajeEnvioV numeric(18, 2)
	declare @cantidadCO numeric(18, 2)

	declare @totalFactura numeric(18, 2)
	declare @totalItem numeric(18, 2)
	declare @numeroFactura numeric(18)
	declare @idFormaPago int
	declare @idFactura int
	
	select @idFormaPago = Id from LOS_DE_ADELANTE.FormaPago where Descripcion = 'Efectivo'

	select
		@idUsuarioP = p.IdUsuario, 
		@precioP = p.Precio,
		@incluirEnvioP = p.IncluirEnvio,
		@precioV = v.Precio, 
		@porcentajeV = v.Porcentaje, 
		@porcentajeEnvioV = v.PorcentajeEnvio,
		@cantidadCO = c.Cantidad
	from LOS_DE_ADELANTE.Publicacion p
		inner join LOS_DE_ADELANTE.Visibilidad v on p.IdVisibilidad = v.Id
		inner join LOS_DE_ADELANTE.Compra c on p.Id = c.IdPublicacion
	where p.Id = @idPublicacion
		and c.Id = @idCompra

	--calcular monto total
	set @totalItem = @precioP * @cantidadCO
	set @totalFactura = @precioV + @totalItem * @porcentajeV
	
	if @incluirEnvioP = 1
		set @totalFactura += @totalItem * @porcentajeEnvioV

	--generar factura
	begin transaction
	
		set @numeroFactura = next value for LOS_DE_ADELANTE.sq_factura
		
		--cabecera
		insert into LOS_DE_ADELANTE.Factura (IdUsuario, IdFormaPago, Numero, Fecha, Total)
		values (@idUsuarioP, @idFormaPago, @numeroFactura, @fechaSistema, @totalFactura)

		set @idFactura = SCOPE_IDENTITY()

		--item costo fijo
		insert into LOS_DE_ADELANTE.FacturaItem (IdFactura, IdCompra, Monto, Cantidad)
		values (@idFactura, @idCompra, @precioV, 1)

		--item costo variable
		insert into LOS_DE_ADELANTE.FacturaItem (IdFactura, IdCompra, Monto, Cantidad)
		values (@idFactura, @idCompra, @precioP * @porcentajeV, @cantidadCO)

		--item costo variable envio
		if @incluirEnvioP = 1
			insert into LOS_DE_ADELANTE.FacturaItem (IdFactura, IdCompra, Monto, Cantidad)
			values (@idFactura, @idCompra, @totalItem * @porcentajeEnvioV, 1)

	commit transaction

	--devolver factura
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
	from LOS_DE_ADELANTE.Factura f
		inner join LOS_DE_ADELANTE.Usuario u on f.IdUsuario = u.Id
		inner join LOS_DE_ADELANTE.FormaPago fp on f.IdFormaPago = fp.Id
		inner join LOS_DE_ADELANTE.FacturaItem fi on f.Id = fi.IdFactura
		inner join LOS_DE_ADELANTE.Compra c on c.Id = fi.IdCompra
		inner join LOS_DE_ADELANTE.Usuario u2 on c.IdUsuario = u2.Id
		inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
	where f.Id = @idFactura

	select
		fi.IdFactura,
		fi.Id,
		fi.IdCompra,
		fi.Monto,
		fi.Cantidad
	from LOS_DE_ADELANTE.FacturaItem fi
	where fi.IdFactura = @idFactura

END
GO
