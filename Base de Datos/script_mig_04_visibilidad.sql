 insert into gd_esquema.Visibilidad (Descripcion,Precio,Porcentaje,PorcentajeEnvio)
select distinct Publicacion_Visibilidad_desc,Publicacion_Visibilidad_Precio,Publicacion_Visibilidad_Porcentaje,dbo.porcentajeEnvio(Publicacion_Visibilidad_Porcentaje)
from gd_esquema.Maestra  where Publicacion_Visibilidad_Cod is not null  
go