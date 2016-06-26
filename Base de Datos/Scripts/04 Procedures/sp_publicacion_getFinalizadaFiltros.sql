IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros
(
	@username nvarchar(50), 
	@fechaSistema datetime
)
AS
BEGIN		

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
		u.Username Usuario
	from LOS_DE_ADELANTE.Publicacion p
		inner join LOS_DE_ADELANTE.Rubro r on r.Id = p.IdRubro
		inner join LOS_DE_ADELANTE.Visibilidad v on v.Id = p.IdVisibilidad
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = p.IdUsuario
	where CONVERT(date, p.FechaVencimiento) < CONVERT(date, @fechaSistema)
		and u.Username = @username
		and p.Estado = 'A'

END
go


