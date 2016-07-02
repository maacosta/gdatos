IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacionpregunta_insPregunta') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacionpregunta_insPregunta
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_publicacionpregunta_insPregunta
(
	@idPublicacion int, 
	@pregunta nvarchar(255), 
	@username nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	insert into LOS_DE_ADELANTE.PublicacionPreguntas (IdPublicacion, IdUsuario, Pregunta)
	values (@idPublicacion, @idUsuario, @pregunta)

END
go


