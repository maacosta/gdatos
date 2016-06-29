IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updUsuario') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updUsuario
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_updUsuario
(
	@username nvarchar(50),
	@email nvarchar(50), 
	@telefono nvarchar(50), 
	@calle nvarchar(255), 
	@numero numeric(18, 0), 
	@piso numeric(18, 0), 
	@departamento nvarchar(50), 
	@cp nvarchar(50), 
	@localidad nvarchar(255)
)
AS
BEGIN		

	update LOS_DE_ADELANTE.Usuario
	set Mail = @email, 
		Telefono = @telefono, 
		Calle = @calle, 
		Numero = @numero, 
		Piso = @piso, 
		Depto = @departamento, 
		CodigoPostal = @cp, 
		Localidad = @localidad
	where Username = @username

END
go


