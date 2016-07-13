IF OBJECT_ID('tempdb..#TCompraOferta') IS NOT NULL DROP TABLE #TCompraOferta
GO

print '## LOS_DE_ADELANTE.Compra'
insert into LOS_DE_ADELANTE.Compra
	(IdPublicacion, IdUsuario, Fecha, Cantidad)
select distinct 
	p.Id,
	c.IdUsuario,
	m.Compra_Fecha fecha,
	m.Compra_Cantidad cantidad
from gd_esquema.Maestra m
	inner join LOS_DE_ADELANTE.Publicacion p on m.Publicacion_Cod = p.Codigo
	inner join LOS_DE_ADELANTE.Cliente c on m.Cli_Dni = c.Dni
where Publicacion_Cod is not null and Compra_Fecha is not null
GO

print '## LOS_DE_ADELANTE.Oferta'
insert into LOS_DE_ADELANTE.Oferta 
	(IdPublicacion, IdUsuario, Fecha, Monto)
select distinct 
	p.Id,
	c.IdUsuario,
	m.Oferta_Fecha fecha,
	m.Oferta_Monto monto
from gd_esquema.Maestra m
	inner join LOS_DE_ADELANTE.Publicacion p on m.Publicacion_Cod = p.Codigo
	inner join LOS_DE_ADELANTE.Cliente c on m.Cli_Dni = c.Dni
where Publicacion_Cod is not null and Oferta_Fecha is not null
GO