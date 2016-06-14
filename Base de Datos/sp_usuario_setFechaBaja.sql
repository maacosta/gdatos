DROP PROCEDURE sp_usuario_setFechaBaja
GO

CREATE PROCEDURE sp_usuario_setFechaBaja  (@username varchar(50))

AS
	BEGIN		        
--		select * from gd_esquema.Usuario
		update gd_esquema.Usuario set FechaBaja = getdate() where username=@username				
	END
GO
