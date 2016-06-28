IF (OBJECT_ID('LOS_DE_ADELANTE.sp_rol_getRolesFiltros') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_rol_getRolesFiltros
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rol_getRolesFiltros
(
	@texto nvarchar(50)
)
AS
BEGIN		

	select Id, Nombre
	from LOS_DE_ADELANTE.Rol
	where Nombre like '%' + @texto + '%'

END
go


