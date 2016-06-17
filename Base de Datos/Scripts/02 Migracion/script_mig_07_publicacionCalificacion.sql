
insert into gd_esquema.PublicacionCalificacion (IdPublicacion,IdUsuario,Calificacion,Comentario)
select P.Id,TU.Id ,cantidadEstrellas,'sin comentario' 
from (select distinct Publicacion_Cod,
Publ_Cli_Dni,
Publ_Empresa_Razon_Social,
Publ_Empresa_Cuit,
dbo.fn_mig_cantEstrellas(Calificacion_Cant_Estrellas)  as cantidadEstrellas
from gd_esquema.Maestra
where Calificacion_Codigo is not null) as TPublicacionCalificacion
left join (select Id,Cuit,RazonSocial,Dni from gd_esquema.Usuario
    left join gd_esquema.Empresa on Id = Empresa.IdUsuario
    left join gd_esquema.Cliente on Id = Cliente.IdUsuario) as TU
on (TPublicacionCalificacion.Publ_Empresa_Razon_Social = TU.RazonSocial and
   TPublicacionCalificacion.Publ_Empresa_Cuit= TU.Cuit) or
   (TPublicacionCalificacion.Publ_Cli_Dni = TU.Dni)
left join gd_esquema.Publicacion as P
on TPublicacionCalificacion.Publicacion_Cod =  P.Codigo
