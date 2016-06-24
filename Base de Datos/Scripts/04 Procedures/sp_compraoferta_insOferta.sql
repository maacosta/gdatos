IF (OBJECT_ID('LOS_DE_ADELANTE.sp_compraoferta_insOferta') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_insOferta
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_insOferta
(
	@idPublicacion int,
	@fechaSistema int,
	@monto numeric(18, 2),
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int
	declare @id int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	insert into LOS_DE_ADELANTE.CompraOferta (IdPublicacion, IdUsuario, Tipo, Fecha, Cantidad, Monto)
	values (@idPublicacion, @idUsuario, 'O', @fechaSistema, 1, @monto)

	set @id = SCOPE_IDENTITY()

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
