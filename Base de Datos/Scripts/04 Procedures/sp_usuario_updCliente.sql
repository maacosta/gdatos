IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updCliente
go

create procedure LOS_DE_ADELANTE.sp_usuario_updCliente 
(
	@idUsuario int,
	@dni numeric(18,0), 
	@tipoDocumento varchar(3),
	@apellido nvarchar (255), 
	@nombre nvarchar (255), 
	@fechaNacimiento datetime
) 
as
begin

	update LOS_DE_ADELANTE.Cliente
	set Dni = @dni, 
		TipoDocumento = @tipoDocumento, 
		Apellido = @apellido, 
		Nombre = @nombre, 
		FechaNacimiento = @fechaNacimiento
	where IdUsuario = @idUsuario

end
go
