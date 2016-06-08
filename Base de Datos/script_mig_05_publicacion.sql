create table #tpu(tpId int identity  not null,
	tpTipoPublicacion nvarchar(255), 
	tpEstado char (1) ,
	tpDescripcion nvarchar(255),
	tpStock numeric (18, 0), 
	tpFechaInicio datetime,
	tpFechaVencimiento datetime ,
	tpPrecio numeric (18, 2),
	tpIdUsuario1 int ,
	tpIdRubro int,
	tpIdVisibilidad int ,
	tpIdUsuario int NOT NULL) 
go
 
insert into dbo.#tpu(tpTipoPublicacion,tpEstado,tpDescripcion,tpStock,tpFechaInicio,tpFechaVencimiento,tpPrecio,tpIdUsuario1,tpIdRubro,tpIdVisibilidad,tpIdUsuario)
select Publicacion_Tipo, dbo.publicacionEstado(Publicacion_Estado), Publicacion_Descripcion,Publicacion_Stock,Publicacion_Fecha,Publicacion_Fecha_Venc,Publicacion_Precio,u.Id, rubroId, viId, usuPublico
from usuarioPublicaron() as up
left join Usu_Cli_Emp()as u
on u.dni = up.Cli_Dni 
go 

insert into gd_esquema.Publicacion(Id,TipoPublicacion,Estado,Descripcion,Stock,FechaInicio,FechaVencimiento,Precio,IdUsuario1,IdRubro,IdVisibilidad,IdUsuario) 
select * from dbo.#tpu
go

