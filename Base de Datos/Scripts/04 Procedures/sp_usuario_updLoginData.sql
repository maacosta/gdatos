IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updLoginData') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updLoginData
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_updLoginData
(
	@username nvarchar(50), 
	@passwordHash nvarchar(64), 
	@salt nvarchar(50)
)
AS
BEGIN		

	update LOS_DE_ADELANTE.Usuario
	set PassHash = @passwordHash,
		PassSalt = @salt
	where Username = @username

END
go


