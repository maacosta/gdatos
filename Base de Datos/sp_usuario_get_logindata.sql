DROP PROCEDURE sp_usuario_Get_logindata
GO

CREATE PROCEDURE sp_usuario_Get_logindata  (@username varchar(50))

AS
	BEGIN
		
		--select * from gd_esquema.Usuario
        select Username,PassSalt,intentos from gd_esquema.Usuario where Username=@username
	
	END
GO

--para test
exec sp_usuario_Get_logindata 'pepe'

--exec sp_rubro_insRubro 9995,'fruta','manzana narja'
--select * from gd_esquema.Rubro
--exec sp_rubro_modifRubro 16,20480,'hola corto','saludo largo'
--select * from gd_esquema.Rubro
