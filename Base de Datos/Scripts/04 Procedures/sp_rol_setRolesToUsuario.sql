IF (OBJECT_ID('LOS_DE_ADELANTE.sp_rol_setRolesToUsuario') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_rol_setRolesToUsuario
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rol_setRolesToUsuario
(
	@username nvarchar(50),
	@rolesId nvarchar(50)
)
AS
BEGIN		

	declare @idUsuario int
	select @idUsuario = Id from LOS_DE_ADELANTE.Usuario where Username = @username

	delete
	from LOS_DE_ADELANTE.UsuarioRol
	where IdUsuario = @idUsuario
	
	insert into LOS_DE_ADELANTE.UsuarioRol (IdUsuario, IdRol)
	select @idUsuario, Data
	from LOS_DE_ADELANTE.fn_Split(@rolesId, ',')

END
go