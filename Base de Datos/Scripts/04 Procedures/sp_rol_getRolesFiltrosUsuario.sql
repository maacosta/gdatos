IF (OBJECT_ID('LOS_DE_ADELANTE.sp_rol_getRolesFiltrosUsuario') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_rol_getRolesFiltrosUsuario
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rol_getRolesFiltrosUsuario
(
	@username nvarchar(50)
)
AS
BEGIN		

	select r.Id, r.Nombre
	from LOS_DE_ADELANTE.Rol r
		inner join LOS_DE_ADELANTE.UsuarioRol ur on ur.IdRol = r.Id
		inner join LOS_DE_ADELANTE.Usuario u on u.Id = ur.IdUsuario
	where u.Username = @username

END
go


