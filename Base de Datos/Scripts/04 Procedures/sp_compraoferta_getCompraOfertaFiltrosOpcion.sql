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

	--Todo, compras y ofertas
	if @opcion = 1
		select
			c.Id, 
			c.IdPublicacion, 
			convert(nvarchar(20), p.Codigo) CodigoPublicacion, 
			pt.Descripcion Tipo, 
			c.Fecha, 
			c.Cantidad, 
			p.Precio Monto, 
			u.Username Usuario,
			convert(int, pc.Calificacion) Calificacion
		from LOS_DE_ADELANTE.Compra c
			inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.PublicacionTipo pt on pt.TipoPublicacion = p.TipoPublicacion
			inner join LOS_DE_ADELANTE.Usuario u on c.IdUsuario = u.Id
			left join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id and pc.IdUsuario = u.Id
		where u.Username = @username
		union
		select
			o.Id, 
			o.IdPublicacion, 
			convert(nvarchar(20), p.Codigo) CodigoPublicacion, 
			pt.Descripcion Tipo, 
			o.Fecha, 
			null Cantidad, 
			o.Monto, 
			u.Username Usuario,
			convert(int, null) Calificacion
		from LOS_DE_ADELANTE.Oferta o
			inner join LOS_DE_ADELANTE.Publicacion p on o.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.PublicacionTipo pt on pt.TipoPublicacion = p.TipoPublicacion
			inner join LOS_DE_ADELANTE.Usuario u on o.IdUsuario = u.Id
		where u.Username = @username
		order by CodigoPublicacion, Fecha desc

	--Calificaciones realizadas 
	else if @opcion = 2
		select
			c.Id, 
			c.IdPublicacion, 
			convert(nvarchar(20), p.Codigo) CodigoPublicacion, 
			pt.Descripcion Tipo, 
			c.Fecha, 
			c.Cantidad, 
			p.Precio Monto, 
			u.Username Usuario,
			convert(int, pc.Calificacion) Calificacion
		from LOS_DE_ADELANTE.Compra c
			inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.PublicacionTipo pt on pt.TipoPublicacion = p.TipoPublicacion
			inner join LOS_DE_ADELANTE.Usuario u on c.IdUsuario = u.Id
			inner join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id and pc.IdUsuario = u.Id
		where u.Username = @username

	--Calificaciones que faltan
	else if @opcion = 3
		select
			c.Id, 
			c.IdPublicacion, 
			convert(nvarchar(20), p.Codigo) CodigoPublicacion, 
			pt.Descripcion Tipo, 
			c.Fecha, 
			c.Cantidad, 
			p.Precio Monto, 
			u.Username Usuario,
			convert(int, null) Calificacion
		from LOS_DE_ADELANTE.Compra c
			inner join LOS_DE_ADELANTE.Publicacion p on c.IdPublicacion = p.Id
			inner join LOS_DE_ADELANTE.PublicacionTipo pt on pt.TipoPublicacion = p.TipoPublicacion
			inner join LOS_DE_ADELANTE.Usuario u on c.IdUsuario = u.Id
			left join LOS_DE_ADELANTE.PublicacionCalificacion pc on pc.IdPublicacion = p.Id and pc.IdUsuario = u.Id
		where u.Username = @username
			and pc.Id is null

END
go
