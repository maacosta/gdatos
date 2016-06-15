IF (OBJECT_ID('gd_esquema.sp_usuario_login') IS NOT NULL)
	drop PROCEDURE gd_esquema.sp_usuario_login
go

CREATE PROCEDURE gd_esquema.sp_usuario_login
(
	@username nvarchar(50),
	@passHashed nvarchar(64)
)
AS
BEGIN		

	if exists(select * from gd_esquema.Usuario where Username = @username and PassHash = @passHashed)
	begin
		update gd_esquema.Usuario set Intentos = 0 where Username = @username

		select r.Id, r.Nombre 
		from gd_esquema.Usuario u
			inner join gd_esquema.UsuarioRol ur on ur.IdUsuario = u.Id
			inner join gd_esquema.Rol r on r.Id = ur.IdRol
		where u.Username = @username

	end
	else
	begin
		update gd_esquema.Usuario set Intentos = Intentos + 1 where Username = @username
	end

END
go


