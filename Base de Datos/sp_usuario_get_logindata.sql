DROP PROCEDURE sp_usuario_Get_logindata
GO

CREATE PROCEDURE sp_usuario_Get_logindata  (@username varchar(50))

AS
	BEGIN		
        select Username,PassSalt,intentos from gd_esquema.Usuario	 where Username=@username
	END
GO
