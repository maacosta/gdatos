DROP PROCEDURE gd_esquema.sp_usuario_Get_logindata
GO

CREATE PROCEDURE gd_esquema.sp_usuario_Get_logindata  (@username varchar(50))

AS
	BEGIN		
        select Username,PassSalt,intentos 
		from gd_esquema.Usuario	 
		where Username=@username and FechaBaja is not null
	END
GO



