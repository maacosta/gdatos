use GD1C2016

--clientes (personas fisicas)
select  distinct Publ_Cli_Dni  ,publ_cli_nombre,Publ_Cli_Apeliido,Publ_Cli_Fecha_Nac,Publ_Cli_Dom_Calle ,Publ_Cli_Nro_Calle,Publ_Cli_Piso,Publ_Cli_Depto,Publ_Cli_Cod_Postal,Publ_Cli_Mail from gd_esquema.Maestra where Cli_Dni is not null and Publ_Cli_Nombre is not null order by Publ_Cli_Dni

--empresas
select distinct Publ_Empresa_cuit,Publ_Empresa_Razon_Social,Publ_Empresa_Dom_Calle ,Publ_Empresa_Nro_Calle ,Publ_Empresa_Piso,Publ_Empresa_Depto,Publ_Empresa_Cod_Postal,Publ_Empresa_Mail,Publ_Empresa_Fecha_Creacion from gd_esquema.Maestra where Publ_Empresa_cuit is not null order by Publ_Empresa_cuit

--visibilidades (gratis,plata,oro,bronce,platino)
select distinct Publicacion_Visibilidad_Cod,Publicacion_Visibilidad_desc,Publicacion_Visibilidad_Precio,Publicacion_Visibilidad_Porcentaje  from gd_esquema.Maestra  where Publicacion_Visibilidad_Cod is not null

