IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_getEmpresaFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_getEmpresaFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_getEmpresaFiltros
(
	@razonSocial nvarchar(255), 
	@cuit nvarchar(50), 
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
		e.Cuit,
		e.RazonSocial,
		e.Ciudad,
		e.NombreContacto,
		e.RubroPrincipal,
		e.FechaCreacion
	from LOS_DE_ADELANTE.Usuario u
		inner join LOS_DE_ADELANTE.Empresa e on e.IdUsuario = u.Id
	where e.RazonSocial like '%' + @razonSocial + '%'
		and e.Cuit like '%' + @cuit + '%'
		and u.Mail like '%' + @email + '%'

END
go
