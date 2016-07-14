IF (OBJECT_ID('LOS_DE_ADELANTE.sp_compra_insCompra') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_compra_insCompra
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_compra_insCompra
(
	@idPublicacion int,
	@idOferta int,
	@fechaSistema datetime,
	@cantidad numeric(18, 0),
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int
	declare @stockP numeric(18, 0)
	declare @id int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	select 
		@stockP = Stock
	from LOS_DE_ADELANTE.Publicacion 
	where Id = @idPublicacion

	begin tran

		insert into LOS_DE_ADELANTE.Compra (IdPublicacion, IdOferta, IdUsuario, Fecha, Cantidad)
		values (@idPublicacion, @idOferta, @idUsuario, @fechaSistema, @cantidad)

		set @id = SCOPE_IDENTITY()

		update LOS_DE_ADELANTE.Publicacion
			set Stock = @stockP - @cantidad
		where Id = @idPublicacion

		if @stockP - @cantidad = 0
			update LOS_DE_ADELANTE.Publicacion
				set Estado = 'F'
			where Id = @idPublicacion

	commit tran

	select 
		c.Id, 
		c.IdPublicacion, 
		c.IdOferta,
		p.Codigo CodigoPublicacion, 
		c.Fecha, 
		c.Cantidad,
		u.Username Usuario
	from LOS_DE_ADELANTE.Compra c
		inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
		inner join LOS_DE_ADELANTE.Usuario u on c.IdUsuario = u.Id
	where c.Id = @id

END
go
