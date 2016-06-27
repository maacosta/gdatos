IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_updPublicacion') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacion_updPublicacion
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_publicacion_updPublicacion
(
	@idPublicacion int,
	@tipoPublicacion char, 
	@estado char, 
	@descripcion nvarchar(255), 
	@stock numeric(18, 0), 
	@fechaInicio datetime, 
	@fechaVencimiento datetime, 
	@precio numeric(18, 2), 
	@costo numeric(18, 2), 
	@permitirPreguntas bit, 
	@incluirEnvio bit, 
	@idRubro int, 
	@idVisibilidad int, 
	@username nvarchar(50)
)
AS
BEGIN		
	declare @idUsuario int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	begin tran

		update LOS_DE_ADELANTE.Publicacion
		set TipoPublicacion = @tipoPublicacion, 
			Estado = @estado, 
			Descripcion = @descripcion, 
			Stock = @stock, 
			FechaInicio = @fechaInicio, 
			FechaVencimiento = @fechaVencimiento, 
			Precio = @precio, 
			Costo = @costo, 
			PermitirPreguntas = @permitirPreguntas, 
			IncluirEnvio = @incluirEnvio, 
			IdRubro = @idRubro, 
			IdVisibilidad = @idVisibilidad, 
			IdUsuario = @idUsuario
		where Id = @idPublicacion

	commit tran

	select
		p.Id, 
		p.Codigo,
		p.TipoPublicacion,
		p.Estado,
		p.Descripcion,
		p.Stock,
		p.FechaInicio,
		p.FechaVencimiento,
		p.Precio,
		p.Costo,
		p.PermitirPreguntas,
		p.IncluirEnvio,
		p.IdRubro,
		r.Codigo CodigoRubro,
		p.IdVisibilidad,
		v.Codigo CodigoVisibilidad,
		p.IdUsuario,
		u.Username Usuario
	from LOS_DE_ADELANTE.Publicacion p
		inner join LOS_DE_ADELANTE.Rubro r on r.Id = p.IdRubro
		inner join LOS_DE_ADELANTE.Visibilidad v on v.Id = p.IdVisibilidad
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = p.IdUsuario
	where p.Id = @idPublicacion

END
go


