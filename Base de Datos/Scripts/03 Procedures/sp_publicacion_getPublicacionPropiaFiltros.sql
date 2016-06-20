IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros') IS NOT NULL)
	Drop Procedure LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros
go

Create Procedure LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros 
(
	@username nvarchar(50), 
	@texto nvarchar(255)
) As
Begin

SELECT pub.Id, pub.Codigo, TipoPublicacion, Estado, pub.Descripcion, Stock, FechaInicio, FechaVencimiento, pub.Precio, 
       IdRubro, rub.DescLarga, IdVisibilidad, vis.Descripcion, Username
  FROM	LOS_DE_ADELANTE.Publicacion pub,
		LOS_DE_ADELANTE.Usuario usr,
		LOS_DE_ADELANTE.Rubro rub,
		LOS_DE_ADELANTE.Visibilidad vis
 WHERE  usr.Id = pub.IdUsuario
   AND  rub.Id = pub.IdRubro
   AND  vis.Id = pub.IdVisibilidad
   AND  (Username = @username or @username IS NULL)
   AND  (PUB.Descripcion LIKE '%' + @texto + '%' or @texto IS NULL)

End

Go
