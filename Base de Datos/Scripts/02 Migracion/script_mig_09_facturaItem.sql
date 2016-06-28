print '## LOS_DE_ADELANTE.FacturaItem'
insert into LOS_DE_ADELANTE.FacturaItem
	(IdFactura, IdCompraOferta, Monto, Cantidad)
select  
	F.Id,
	CO.Id,
	TFacturaItem.Item_Factura_Monto,
	TFacturaItem.Item_Factura_Cantidad 
from (
	select distinct	
		Factura_Nro,
		Publicacion_Cod,
		Item_Factura_Monto,
		Item_Factura_Cantidad
	from gd_esquema.Maestra
	where Publicacion_cod is not null 
		and Item_Factura_Monto is not null) as TFacturaItem
	left join LOS_DE_ADELANTE.Factura as F on F.Numero = TFacturaItem.Factura_Nro
	left join LOS_DE_ADELANTE.CompraOferta as CO on CO.IdPublicacion = TFacturaItem.Publicacion_Cod
go