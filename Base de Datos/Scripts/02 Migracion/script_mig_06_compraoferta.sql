IF OBJECT_ID('tempdb..#TCompraOferta') IS NOT NULL DROP TABLE #TCompraOferta
GO

select co.* into #TCompraOferta
from (
select distinct 
	Publicacion_Cod codigo,
	Cli_Dni dni,
	'C' tipo,
	Compra_Fecha fecha,
	Compra_Cantidad cantidad,
	Publicacion_Precio monto
from LOS_DE_ADELANTE.Maestra 
where Publicacion_Cod is not null and Compra_Fecha is not null
union
select distinct 
	Publicacion_Cod codigo,
	Cli_Dni dni,
	'O' tipo,
	Oferta_Fecha fecha,
	1 cantidad,
	Oferta_Monto monto
from LOS_DE_ADELANTE.Maestra 
where Publicacion_Cod is not null and Oferta_Fecha is not null
) co
go

insert into LOS_DE_ADELANTE.CompraOferta 
	(IdPublicacion, IdUsuario, Tipo, Fecha, Cantidad, Monto)
select p.Id, c.IdUsuario, tipo, fecha, cantidad, monto
from #TCompraOferta co
	inner join LOS_DE_ADELANTE.Publicacion p on co.codigo = p.Codigo
	inner join LOS_DE_ADELANTE.Cliente c on co.dni = c.Dni
go 