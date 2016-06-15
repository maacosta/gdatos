IF OBJECT_ID('tempdb..#TPublicacion') IS NOT NULL DROP TABLE #TPublicacion
GO

select p.* into #TPublicacion
from (
select distinct 
	publicacion_cod codigo, 
	dbo.fn_mig_getTipoPublicacion(Publicacion_Tipo) tipoPublicacion, 
	'F' estado, 
	Publicacion_Descripcion descripcion,
	Publicacion_Stock stock,
	Publicacion_Fecha fechaInicio,
	Publicacion_Fecha_Venc fechaVencimiento,
	Publicacion_Precio precio,
	Publicacion_Rubro_Descripcion rubroDesc,
	Publicacion_Visibilidad_Cod visibilidadCodigo,
	Publ_Cli_Dni clienteDni,
	Publ_Empresa_Cuit empresaCuit
from gd_esquema.maestra
where [Publicacion_Cod] is not null
) p

insert into gd_esquema.Publicacion 
	(Codigo, TipoPublicacion, Estado, Descripcion, Stock, FechaInicio, FechaVencimiento, Precio, IdRubro, IdVisibilidad, IdUsuario)
select 
	t.codigo, 
	t.tipoPublicacion, 
	t.estado, 
	t.descripcion, 
	t.stock, 
	t.fechaInicio, 
	t.fechaVencimiento, 
	t.precio, 
	r.Id, 
	v.Id, 
	case when c.dni is null then e.IdUsuario else c.IdUsuario end idUsuario
from #TPublicacion t
	inner join gd_esquema.Rubro r on r.DescCorta = t.rubroDesc
	inner join gd_esquema.Visibilidad v on v.codigo = t.visibilidadCodigo
	left join gd_esquema.Cliente c on t.clienteDni = c.dni
	left join gd_esquema.Empresa e on t.empresaCuit = e.cuit

go
