IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado
go

create procedure LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado 
(
	@idPublicacion int, 
	@estado char(1)
) as
begin

	update LOS_DE_ADELANTE.Publicacion
	set Estado = @estado
	where Id = @idPublicacion

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

end

