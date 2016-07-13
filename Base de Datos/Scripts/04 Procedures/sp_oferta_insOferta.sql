IF (OBJECT_ID('LOS_DE_ADELANTE.sp_oferta_insOferta') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_oferta_insOferta
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_oferta_insOferta
(
	@idPublicacion int,
	@fechaSistema datetime,
	@monto numeric(18, 2),
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int
	declare @id int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	begin tran

		insert into LOS_DE_ADELANTE.Oferta (IdPublicacion, IdUsuario, Fecha, Monto)
		values (@idPublicacion, @idUsuario, @fechaSistema, @monto)

		set @id = SCOPE_IDENTITY()

		update LOS_DE_ADELANTE.Publicacion
		set Precio = @monto
		where Id = @idPublicacion

	commit tran

	select 
		o.Id, 
		o.IdPublicacion, 
		p.Codigo CodigoPublicacion, 
		o.Fecha, 
		o.Monto, 
		u.Username Usuario
	from LOS_DE_ADELANTE.Oferta o
		inner join LOS_DE_ADELANTE.Publicacion p on o.IdPublicacion = p.Id
		inner join LOS_DE_ADELANTE.Usuario u on o.IdUsuario = u.Id
	where o.Id = @id

END
go
