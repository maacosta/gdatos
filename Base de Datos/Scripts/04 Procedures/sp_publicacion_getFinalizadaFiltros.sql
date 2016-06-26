IF (OBJECT_ID('LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros
go

create procedure LOS_DE_ADELANTE.sp_publicacion_getFinalizadaFiltros (@usermane nvarchar(50), @fechaSistema date) as

	begin

	select pub.Id, pub.Codigo, TipoPublicacion, Estado, pub.Descripcion, Stock, FechaInicio, FechaVencimiento, pub.Precio,
		   IdRubro, rub.Codigo, IdVisibilidad, vis.Codigo, usr.Username
	  from LOS_DE_ADELANTE.Publicacion pub,
		   LOS_DE_ADELANTE.Usuario usr,
		   LOS_DE_ADELANTE.Rubro rub,
		   LOS_DE_ADELANTE.Visibilidad vis
	 where pub.IdUsuario = usr.Id
	   and pub.IdRubro = rub.Id
	   and pub.IdVisibilidad = vis.Id
	   and usr.Username = @usermane
	   and pub.Estado = 'A'
	   and pub.FechaVencimiento < @fechaSistema

	end

go