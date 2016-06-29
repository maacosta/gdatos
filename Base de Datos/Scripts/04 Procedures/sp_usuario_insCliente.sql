IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_insCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_insCliente
go

create procedure LOS_DE_ADELANTE.sp_usuario_insCliente 
(
	@idUsuario int,
	@dni numeric(18,0), 
	@tipoDocumento varchar(3),
	@apellido nvarchar (255), 
	@nombre nvarchar (255), 
	@fechaNacimiento datetime,
	@fechaSistema datetime
) 
as
begin

	insert into LOS_DE_ADELANTE.Cliente(IdUsuario, Dni, TipoDocumento, Apellido, Nombre, FechaNacimiento, FechaCreacion) 
	values (@idUsuario, @dni, @tipoDocumento, @apellido, @nombre, @fechaNacimiento, @fechaSistema) 

end
go
