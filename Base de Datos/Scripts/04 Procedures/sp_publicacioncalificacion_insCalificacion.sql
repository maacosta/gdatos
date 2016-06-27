IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacioncalificacion_insCalificacion') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacioncalificacion_insCalificacion
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_publicacioncalificacion_insCalificacion
(
	@idPublicacion int,
	@calificacion smallint, 
	@fecha datetime, 
	@comentario nvarchar(255), 
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	insert into LOS_DE_ADELANTE.PublicacionCalificacion (IdPublicacion, IdUsuario, Fecha, Calificacion, Comentario)
	values (@idPublicacion, @idUsuario, @fecha, @calificacion, @comentario)

END
go


