IF (OBJECT_ID('LOS_DE_ADELANTE.sp_compraoferta_insCompra') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_insCompra
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_insCompra
(
	@idPublicacion int,
	@fechaSistema int,
	@cantidad numeric(18, 0),
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int
	declare @montoP numeric(18, 2)
	declare @stockP numeric(18, 0)
	declare @estadoP char
	declare @id int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	select 
		@montoP = Precio,
		@stockP = Stock,
		@estadoP = Estado
	from LOS_DE_ADELANTE.Publicacion 
	where Id = @idPublicacion

	begin tran

		insert into LOS_DE_ADELANTE.CompraOferta (IdPublicacion, IdUsuario, Tipo, Fecha, Cantidad, Monto)
		values (@idPublicacion, @idUsuario, 'C', @fechaSistema, @cantidad, @montoP)

		set @id = SCOPE_IDENTITY()

		if @stockP - @cantidad = 0
			set @estadoP = 'F'

		update LOS_DE_ADELANTE.Publicacion
			set Stock = @stockP - @cantidad,
			Estado = @estadoP
		where Id = @idPublicacion

	commit tran

	select 
		co.Id, 
		co.IdPublicacion, 
		p.Codigo CodigoPublicacion, 
		co.Tipo, 
		co.Fecha, 
		co.Cantidad, 
		co.Monto, 
		u.Username Usuario
	from LOS_DE_ADELANTE.CompraOferta co
		inner join LOS_DE_ADELANTE.Publicacion p on co.IdPublicacion = p.Id
		inner join LOS_DE_ADELANTE.Usuario u on co.IdUsuario = u.Id
	where co.Id = @id

END
go
