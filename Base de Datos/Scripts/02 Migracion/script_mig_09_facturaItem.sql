print '## LOS_DE_ADELANTE.FacturaItem'
insert into LOS_DE_ADELANTE.FacturaItem
	(IdFactura, Monto, Cantidad)
select  
	f.Id,
	fItem.Item_Factura_Monto,
	fItem.Item_Factura_Cantidad 
from (
	select
		Factura_Nro,
		Publicacion_Cod,
		Item_Factura_Monto,
		Item_Factura_Cantidad
	from gd_esquema.Maestra
	where Publicacion_cod is not null 
		and Item_Factura_Monto is not null
	) as fItem
	inner join LOS_DE_ADELANTE.Factura as f on f.Numero = fItem.Factura_Nro
	inner join LOS_DE_ADELANTE.Publicacion p on p.Codigo = fItem.Publicacion_Cod
go
