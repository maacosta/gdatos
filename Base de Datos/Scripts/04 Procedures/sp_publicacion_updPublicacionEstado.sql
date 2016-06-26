IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado
go

create procedure sp_publicacion_updPublicacionEstado (@idPublicacion int, @estado char(1)) as

begin

update LOS_DE_ADELANTE.Publicacion
   set Estado = @estado
 where Id = @idPublicacion

end

