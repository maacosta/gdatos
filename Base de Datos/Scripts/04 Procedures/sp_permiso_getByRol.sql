IF (OBJECT_ID('LOS_DE_ADELANTE.sp_permiso_getByRol') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_permiso_getByRol
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_permiso_getByRol
(
	@idRol int
)
AS
BEGIN		

	select p.Id, p.Nombre
	from LOS_DE_ADELANTE.Permiso p
		inner join LOS_DE_ADELANTE.RolPermiso rp on rp.IdPermiso = p.Id
	where rp.IdRol = @idRol

END
go


