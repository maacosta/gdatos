IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updEmpresa') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updEmpresa
go

create procedure LOS_DE_ADELANTE.sp_usuario_updEmpresa
(
	@idUsuario int,
	@cuit nvarchar (50),
	@razonSocial nvarchar(255),
	@ciudad nvarchar (50),
	@contacto nvarchar (50),
	@rubroPrincipal nvarchar(10)
)
as
begin

	update LOS_DE_ADELANTE.Empresa 
	set Cuit = @cuit, 
		RazonSocial = @razonSocial, 
		Ciudad = @ciudad, 
		NombreContacto = @contacto, 
		RubroPrincipal = @rubroPrincipal
	where IdUsuario = @idUsuario

end
go
