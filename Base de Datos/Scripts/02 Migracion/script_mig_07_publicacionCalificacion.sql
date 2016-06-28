declare @fecha datetime = getdate()
print '## LOS_DE_ADELANTE.PublicacionCalificacion'
insert into [LOS_DE_ADELANTE].[PublicacionCalificacion] (IdPublicacion, IdUsuario, Fecha, Calificacion, Comentario)
select cc.IdPublicacion, cc.IdUsuario, @fecha, cc.Calificacion, cc.Comentario
from (
	select distinct 
		p.Id IdPublicacion,
		u.Id IdUsuario,
		m.Calificacion_Codigo Codigo,
		convert(smallint, (m.Calificacion_Cant_Estrellas + 1) / 2)  Calificacion,
		m.Calificacion_Descripcion Comentario
	from gd_esquema.Maestra m
		inner join LOS_DE_ADELANTE.Cliente c on c.Dni = m.Publ_Cli_Dni
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = c.IdUsuario
		inner join LOS_DE_ADELANTE.Publicacion p on p.Codigo = m.Publicacion_Cod
	where Calificacion_Codigo is not null
		and Publ_Cli_Dni is not null
	) cc

print '## LOS_DE_ADELANTE.PublicacionCalificacion'
insert into [LOS_DE_ADELANTE].[PublicacionCalificacion] (IdPublicacion, IdUsuario, Fecha, Calificacion, Comentario)
select ee.IdPublicacion, ee.IdUsuario, @fecha, ee.Calificacion, ee.Comentario
from (
	select distinct 
		p.Id IdPublicacion,
		u.Id IdUsuario,
		m.Calificacion_Codigo Codigo,
		convert(smallint, (m.Calificacion_Cant_Estrellas + 1) / 2)  Calificacion,
		m.Calificacion_Descripcion Comentario
	from gd_esquema.Maestra m
		inner join LOS_DE_ADELANTE.Empresa e on e.Cuit = m.Publ_Empresa_Cuit
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = e.IdUsuario
		inner join LOS_DE_ADELANTE.Publicacion p on p.Codigo = m.Publicacion_Cod
	where m.Calificacion_Codigo is not null
		and m.Publ_Empresa_Cuit is not null
	) ee
