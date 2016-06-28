IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getClienteFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getClienteFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getClienteFiltros
(
	@nombre nvarchar(255), 
	@apellido nvarchar(255), 
	@dni numeric(18, 0), 
	@email nvarchar(50)
)
AS
BEGIN		

	select
		u.Id,
		u.Username,
		u.PassSalt,
		u.Mail,
		u.Telefono,
		u.Calle,
		u.Numero,
		u.Piso,
		u.Depto,
		u.CodigoPostal,
		u.Localidad,
		c.Dni,
		c.TipoDocumento,
		c.Apellido,
		c.Nombre,
		c.FechaNacimiento,
		c.FechaCreacion
	from LOS_DE_ADELANTE.Usuario u
		inner join LOS_DE_ADELANTE.Cliente c on c.IdUsuario = u.Id
	where c.Nombre like '%' + @nombre + '%'
		and c.Apellido like '%' + @apellido + '%'
		and (@dni = 0 or (@dni != 0 and c.Dni = @dni))
		and u.Mail like '%' + @email + '%'

END
go
