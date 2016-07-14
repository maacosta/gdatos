IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacioncalificacion_getCalificacionFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacioncalificacion_getCalificacionFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_publicacioncalificacion_getCalificacionFiltros
(
	@username nvarchar(50),
	@opcion int
)
AS
BEGIN		
	declare @idUsuario int

	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	--muestra las publicaciones calificadas del usuario
	if @opcion = 1
		select top 5
			pc.Id, 
			pc.IdPublicacion, 
			p.Codigo CodigoPublicacion, 
			pc.Fecha,
			pc.Calificacion, 
			pc.Comentario,
			u.Username Usuario
		from LOS_DE_ADELANTE.PublicacionCalificacion pc
			inner join LOS_DE_ADELANTE.Publicacion p on pc.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.Usuario u on p.IdUsuario = u.Id
		where pc.IdUsuario = @idUsuario
		order by pc.Fecha desc
	
	--muestra las publicaciones con compras hechas por el usuario sin calificar
	if @opcion = 2
		select distinct
			isnull(pc.Id, 0) Id, 
			p.Id IdPublicacion, 
			p.Codigo CodigoPublicacion, 
			c.Fecha,
			isnull(pc.Calificacion, 0) Calificacion, 
			isnull(pc.Comentario, '') Comentario,
			u.Username Usuario
		from LOS_DE_ADELANTE.Publicacion p
			inner join LOS_DE_ADELANTE.Compra c on c.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.Usuario u on p.IdUsuario = u.Id
			left join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id
		where c.IdUsuario = @idUsuario
			and pc.Id is null
		order by c.Fecha asc

END
go
