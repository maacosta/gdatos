IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros') IS NOT NULL)
	Drop Procedure LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros
go

Create Procedure LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros 
(
	@username nvarchar(50), 
	@texto nvarchar(255)
) As
Begin

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
		p.IdUsuario,
		u.Username Usuario
	from LOS_DE_ADELANTE.Publicacion p
		inner join LOS_DE_ADELANTE.Rubro r on r.Id = p.IdRubro
		inner join LOS_DE_ADELANTE.Visibilidad v on v.Id = p.IdVisibilidad
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = p.IdUsuario
	where (Username = @username or @username IS NULL)
		AND  (p.Descripcion LIKE '%' + @texto + '%' or @texto IS NULL)

End

Go
