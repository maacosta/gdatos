IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_insUsuario') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_insUsuario
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_insUsuario
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
	declare @id int

	insert into LOS_DE_ADELANTE.Usuario (Username, Mail, Telefono, Calle, Numero, Piso, Depto, CodigoPostal, Localidad, Intentos)
	values (@username, @email, @telefono, @calle, @numero, @piso, @departamento, @cp, @localidad, 0)

	set @id = SCOPE_IDENTITY()

	select Id, Username, PassSalt, Mail, Telefono, Calle, Numero, Piso, Depto, CodigoPostal, Localidad
	from LOS_DE_ADELANTE.Usuario
	where Id = @id

END
go


