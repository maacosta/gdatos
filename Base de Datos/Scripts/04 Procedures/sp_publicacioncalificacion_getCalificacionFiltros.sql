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
			inner join LOS_DE_ADELANTE.Usuario u on pc.IdUsuario = u.Id
		where u.Username = @username
		order by pc.Fecha desc
	
	if @opcion = 2
		select distinct
			isnull(pc.Id, 0) Id, 
			p.Id IdPublicacion, 
			p.Codigo CodigoPublicacion, 
			pc.Fecha,
			isnull(pc.Calificacion, 0) Calificacion, 
			isnull(pc.Comentario, '') Comentario,
			u.Username Usuario
		from LOS_DE_ADELANTE.Publicacion p
			inner join LOS_DE_ADELANTE.CompraOferta co on co.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.Usuario u on co.IdUsuario = u.Id
			inner join LOS_DE_ADELANTE.FacturaItem fi on fi.IdCompraOferta = co.Id
			left join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id
		where u.Username = @username
			and pc.Id is null

END
go
