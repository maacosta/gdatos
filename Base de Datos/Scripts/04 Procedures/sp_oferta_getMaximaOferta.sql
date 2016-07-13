IF (OBJECT_ID('LOS_DE_ADELANTE.sp_oferta_getMaximaOferta') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_oferta_getMaximaOferta
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_oferta_getMaximaOferta
(
	@idPublicacion int
)
AS
BEGIN		

	select top 1
		o.Id, 
		o.IdPublicacion, 
		p.Codigo CodigoPublicacion, 
		o.Fecha, 
		o.Monto, 
		u.Username Usuario
	from LOS_DE_ADELANTE.Oferta o
		inner join LOS_DE_ADELANTE.Publicacion p on o.IdPublicacion = p.Id
		inner join LOS_DE_ADELANTE.Usuario u on o.IdUsuario = u.Id
	where o.IdPublicacion = @idPublicacion
	order by o.Monto desc

END
go