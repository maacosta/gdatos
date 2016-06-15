IF (OBJECT_ID('gd_esquema.sp_usuario_getLoginData') IS NOT NULL)
	drop PROCEDURE gd_esquema.sp_usuario_getLoginData
go

CREATE PROCEDURE gd_esquema.sp_usuario_getLoginData
(
	@username nvarchar(50)
)
AS
BEGIN		
    select
		Username,
		PassSalt,
		Intentos 
	from gd_esquema.Usuario	 
	where Username=@username 
		and FechaBaja is null
END
GO



