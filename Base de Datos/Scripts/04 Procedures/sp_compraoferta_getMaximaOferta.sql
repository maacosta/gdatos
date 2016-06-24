IF (OBJECT_ID('LOS_DE_ADELANTE.sp_compraoferta_getMaximaOferta') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_getMaximaOferta
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_getMaximaOferta
(
	@idPublicacion int
)
AS
BEGIN		

	select top 1
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
	where co.IdPublicacion = @idPublicacion
	order by co.Monto desc

END
go