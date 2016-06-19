insert into LOS_DE_ADELANTE.FormaPago(Descripcion)
select distinct Forma_Pago_Desc from gd_esquema.Maestra where Forma_Pago_Desc is not null
go 

