IF (OBJECT_ID('gd_esquema.sp_permiso_getByRol') IS NOT NULL)
	drop PROCEDURE gd_esquema.sp_permiso_getByRol
go

CREATE PROCEDURE gd_esquema.sp_permiso_getByRol
(
	@idRol int
)
AS
BEGIN		

	select p.Id, p.Nombre
	from gd_esquema.Permiso p
		inner join gd_esquema.RolPermiso rp on rp.IdPermiso = p.Id
	where rp.IdRol = @idRol

END
go


