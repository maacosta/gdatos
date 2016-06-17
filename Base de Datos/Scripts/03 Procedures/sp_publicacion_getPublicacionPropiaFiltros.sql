IF (OBJECT_ID('gd_esquema.sp_publicacion_getPublicacionPropiaFiltros') IS NOT NULL)
	Drop Procedure gd_esquema.sp_publicacion_getPublicacionPropiaFiltros
go

Create Procedure gd_esquema.sp_publicacion_getPublicacionPropiaFiltros (@username nvarchar(50), @texto nvarchar(255)) As

Begin

SELECT pub.Id, pub.Codigo, TipoPublicacion, Estado, pub.Descripcion, Stock, FechaInicio, FechaVencimiento, pub.Precio, 
       IdRubro, rub.DescLarga, IdVisibilidad, vis.Descripcion, Username
  FROM	gd_esquema.Publicacion pub,
		gd_esquema.Usuario usr,
		gd_esquema.Rubro rub,
		gd_esquema.Visibilidad vis
 WHERE  usr.Id = pub.IdUsuario
   AND  rub.Id = pub.IdRubro
   AND  vis.Id = pub.IdVisibilidad
   AND  (Username = @username or @username IS NULL)
   AND  (PUB.Descripcion LIKE '%' + @texto + '%' or @texto IS NULL)

End

Go
