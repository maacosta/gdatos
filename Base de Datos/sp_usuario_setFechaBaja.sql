DROP PROCEDURE gd_esquema.sp_usuario_setFechaBaja
GO

CREATE PROCEDURE gd_esquema.sp_usuario_setFechaBaja  (@username varchar(50))

AS
	BEGIN		        
		update gd_esquema.Usuario 
		set FechaBaja = getdate() 
		where username=@username				
	END
GO
