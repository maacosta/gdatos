DROP PROCEDURE LOS_DE_ADELANTE.sp_usuario_setFechaBaja
GO

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_setFechaBaja  (@username varchar(50))

AS
	BEGIN		        
		update LOS_DE_ADELANTE.Usuario 
		set FechaBaja = getdate() 
		where username=@username				
	END
GO
