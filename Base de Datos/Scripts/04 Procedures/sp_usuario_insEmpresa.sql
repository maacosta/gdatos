IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_insEmpresa') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_insEmpresa
go

create procedure LOS_DE_ADELANTE.sp_usuario_insEmpresa
(
	@idUsuario int,
	@cuit nvarchar (50),
	@razonSocial nvarchar(255),
	@ciudad nvarchar (50),
	@contacto nvarchar (50),
	@rubroPrincipal nvarchar(10),
	@fechaSistema datetime
)
as
begin

	insert into LOS_DE_ADELANTE.Empresa (IdUsuario, Cuit, RazonSocial, FechaCreacion, Ciudad, NombreContacto, RubroPrincipal)
	values (@idUsuario, @cuit, @razonSocial, @fechaSistema, @ciudad, @contacto, @rubroPrincipal)

end
go
