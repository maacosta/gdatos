insert into LOS_DE_ADELANTE.Visibilidad (Codigo, Descripcion, Precio, Porcentaje, PorcentajeEnvio)
select distinct 
	Publicacion_Visibilidad_Cod, 
	Publicacion_Visibilidad_desc, 
	Publicacion_Visibilidad_Precio, 
	Publicacion_Visibilidad_Porcentaje,
	Publicacion_Visibilidad_Porcentaje
from gd_esquema.Maestra  
where Publicacion_Visibilidad_Cod is not null  
go
