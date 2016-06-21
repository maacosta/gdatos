IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getLoginData') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getLoginData
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getLoginData
(
	@username nvarchar(50)
)
AS
BEGIN		
    select
		Username,
		PassSalt,
		Intentos 
	from LOS_DE_ADELANTE.Usuario	 
	where Username=@username 
		and FechaBaja is null
END
GO



