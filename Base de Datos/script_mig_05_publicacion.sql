select distinct Publicacion_Cod,Publ_Cli_Dni, Publ_Empresa_Razon_Social,Publ_Empresa_Cuit,Publicacion_Tipo,Publicacion_Estado, Publicacion_Descripcion,Publicacion_Stock,Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,Publicacion_Visibilidad_Desc,Publicacion_Rubro_Descripcion 
into #Tpu
from gd_esquema.Maestra
group by Publicacion_Cod,Publ_Cli_Dni, Publ_Empresa_Razon_Social,Publ_Empresa_Cuit,Publicacion_Tipo,Publicacion_Estado, Publicacion_Descripcion,Publicacion_Stock,Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,Publicacion_Visibilidad_Desc,Publicacion_Rubro_Descripcion
order by Publicacion_Cod

insert into gd_esquema.Publicacion(TipoPublicacion,Estado,Descripcion,Stock,FechaInicio,FechaVencimiento,Precio,IdUsuario,IdRubro,IdVisibilidad) 

select Publicacion_Tipo, dbo.publicacionEstado(Publicacion_Estado), Publicacion_Descripcion,Publicacion_Stock,Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,u.Id, rubro.Id, visibilidad.Id
from dbo.#Tpu
left join Usu_Cli_Emp()as u
on (Dni = Publ_Cli_Dni) or ((RazonSocial = Publ_Empresa_Razon_Social ) and (Publ_Empresa_Cuit = Cuit))
left join gd_esquema.Visibilidad
on Publicacion_Visibilidad_Desc = Descripcion
left join gd_esquema.Rubro
on Publicacion_Rubro_Descripcion = DescLarga
go 
