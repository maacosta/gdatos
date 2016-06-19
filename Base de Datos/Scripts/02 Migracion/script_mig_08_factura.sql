IF OBJECT_ID('tempdb..#TFacturaC') IS NOT NULL DROP TABLE #TFacturaC
IF OBJECT_ID('tempdb..#TFacturaE') IS NOT NULL DROP TABLE #TFacturaE
GO

select fc.* into #TFacturaC
from (
select distinct 
	Publ_Cli_Dni dni, 
	Forma_Pago_Desc, 
	Factura_Nro, 
	Factura_Fecha, 
	Factura_Total
from LOS_DE_ADELANTE.Maestra 
where Factura_Nro is not null and Publ_Cli_Dni is not null
) fc

select fe.* into #TFacturaE
from (
select distinct 
	Publ_Empresa_Cuit cuit, 
	Forma_Pago_Desc, 
	Factura_Nro, 
	Factura_Fecha, 
	Factura_Total
from LOS_DE_ADELANTE.Maestra 
where Factura_Nro is not null and Publ_Empresa_Cuit is not null
) fe

--Factura a Clientes

insert into LOS_DE_ADELANTE.Factura
	(IdUsuario, IdFormaPago, Numero, Fecha, Total)
select c.IdUsuario, fp.Id, fc.Factura_Nro, fc.Factura_Fecha, fc.Factura_Total
from #TFacturaC fc
	inner join LOS_DE_ADELANTE.Cliente c on fc.dni = c.Dni
	inner join LOS_DE_ADELANTE.FormaPago fp on fc.Forma_Pago_Desc = fp.Descripcion

--Factura a Empresas

insert into LOS_DE_ADELANTE.Factura
	(IdUsuario, IdFormaPago, Numero, Fecha, Total)
select e.IdUsuario, fp.Id, fe.Factura_Nro, fe.Factura_Fecha, fe.Factura_Total
from #TFacturaE fe
	inner join LOS_DE_ADELANTE.Empresa e on fe.cuit = e.Cuit
	inner join LOS_DE_ADELANTE.FormaPago fp on fe.Forma_Pago_Desc = fp.Descripcion
go
