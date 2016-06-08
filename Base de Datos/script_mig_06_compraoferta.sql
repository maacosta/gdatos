select distinct Publicacion_Cod,Publ_Cli_Dni,Publ_Empresa_Cuit,Publ_Empresa_Razon_Social,Cli_Dni,Publicacion_Tipo,Compra_Fecha as fecha,Compra_Cantidad ,Oferta_Monto
 into #TCompOferta
 from gd_esquema.Maestra where (Publicacion_Tipo = 'Compra Inmediata') and Compra_Fecha is not null
 union
select distinct Publicacion_Cod,Publ_Cli_Dni,Publ_Empresa_Cuit,Publ_Empresa_Razon_Social,Cli_Dni,Publicacion_Tipo,Oferta_Fecha as fecha ,Compra_Cantidad ,Oferta_Monto
 from gd_esquema.Maestra where Publicacion_Tipo = 'Subasta' and Oferta_Fecha is not null
 go
 
 insert into gd_esquema .CompraOferta (IdPublicacion,IdUsuario,IdUsuario1,Tipo,Fecha,Cantidad,Monto)
 select Codigo,u.Id,otraU.Id,dbo.publicacionTipo(Publicacion_Tipo),fecha,Compra_Cantidad ,Oferta_Monto 
 from dbo.#TCompOferta as c
 left join Usu_Cli_Emp() as u
 on (Publ_Cli_Dni = u.Dni ) or (Publ_Empresa_Razon_Social = u.RazonSocial and Publ_Empresa_Cuit = u.Cuit)
 left join gd_esquema.Publicacion
 on Codigo = Publicacion_Cod 
 left join Usu_Cli_Emp() as oTraU
 on Publ_Cli_Dni = OtraU.Dni 
 
 go 