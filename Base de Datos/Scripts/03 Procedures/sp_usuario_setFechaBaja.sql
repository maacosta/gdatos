IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_setFechaBaja') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_setFechaBaja
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_setFechaBaja  
(
	@username varchar(50),
	@fechaSistema datetime
)

AS
	BEGIN		        
		update LOS_DE_ADELANTE.Usuario 
		set FechaBaja = @fechaSistema
		where username=@username				
	END
GO
