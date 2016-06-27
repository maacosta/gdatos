IF (OBJECT_ID('LOS_DE_ADELANTE.sp_compraoferta_getCompraOfertaFiltrosOpcion') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_getCompraOfertaFiltrosOpcion
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_compraoferta_getCompraOfertaFiltrosOpcion
(
	@username nvarchar(50),
	@opcion int
)
AS
BEGIN		

	select
		co.Id, 
		co.IdPublicacion, 
		p.Codigo CodigoPublicacion, 
		co.Tipo, 
		co.Fecha, 
		co.Cantidad, 
		co.Monto, 
		u.Username Usuario,
		isnull(pc.Calificacion, 0) Calificacion
	from LOS_DE_ADELANTE.CompraOferta co
		inner join LOS_DE_ADELANTE.Publicacion p on co.IdPublicacion = p.Id
		inner join LOS_DE_ADELANTE.Usuario u on co.IdUsuario = u.Id
		left join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id
	where u.Username = @username
		and (@opcion = 1 
			or (@opcion = 2 and pc.IdUsuario = u.Id)
			or (@opcion = 3 and pc.Id is null))

END
go
