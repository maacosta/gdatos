/*
TODO: falta hacer join con tabla Publicacion y Usuario|Cliente
*/

--COMPRA
select Publicacion_Cod, cli_dni, Compra_Fecha fecha, Compra_Cantidad cantidad, 'C' tipo
from gd_esquema.maestra
where Publicacion_Cod is not null and cli_dni is not null
and compra_fecha is not null and compra_cantidad is not null
group by Publicacion_Cod, cli_dni, Compra_Fecha, Compra_Cantidad

--OFERTA
select Publicacion_Cod, cli_dni, oferta_fecha fecha, oferta_monto monto, 'O' tipo
from gd_esquema.maestra
where Publicacion_Cod is not null and cli_dni is not null
and oferta_fecha is not null and oferta_monto is not null
group by Publicacion_Cod, cli_dni, oferta_fecha, oferta_monto
