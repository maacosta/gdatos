IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_login') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_login
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_login
(
	@username nvarchar(50),
	@passHashed nvarchar(64)
)
AS
BEGIN		

	if exists(select * from LOS_DE_ADELANTE.Usuario where Username = @username and PassHash = @passHashed)
	begin
		update LOS_DE_ADELANTE.Usuario set Intentos = 0 where Username = @username

		select r.Id, r.Nombre 
		from LOS_DE_ADELANTE.Usuario u
			inner join LOS_DE_ADELANTE.UsuarioRol ur on ur.IdUsuario = u.Id
			inner join LOS_DE_ADELANTE.Rol r on r.Id = ur.IdRol
		where u.Username = @username

	end
	else
	begin
		update LOS_DE_ADELANTE.Usuario set Intentos = Intentos + 1 where Username = @username
	end

END
go


