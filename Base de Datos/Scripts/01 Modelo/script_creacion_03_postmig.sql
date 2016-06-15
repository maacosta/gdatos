/*
Secuencias
*/
CREATE SEQUENCE [gd_esquema].[sq_publicacion] 
 AS [bigint]
 START WITH 71079
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO

/*
Inicialización de datos
*/

--username: admin, password: admin
SET IDENTITY_INSERT gd_esquema.Usuario ON
GO 
INSERT INTO gd_esquema.Usuario ([Id], [Username], [Nombre], [PassHash], [PassSalt])
     VALUES (100, 'admin', 'Administrador General', 'y1Uk2aITg2GRutAc6RAlzarXRlYoExYtG+k2XxAVOf4n2YCi', 'J9mAog==')
SET IDENTITY_INSERT gd_esquema.Usuario OFF
GO 

--permisos
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (1, 'Rol | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (2, 'Rol | M')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (3, 'Usuario | ABM')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (4, 'Rubro | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (5, 'Visibilidad | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (6, 'Publicación | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (7, 'Publicación | ABM')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (8, 'ComprarOfertar | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (9, 'ComprarOfertar | ABM')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (10, 'HistorialCliente | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (11, 'CalificaciónVendedor | A')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (12, 'ConsultaFacturas | V')
INSERT INTO gd_esquema.Permiso (Id, Nombre)
	VALUES (13, 'ListadoEstadistico | V')

--roles
INSERT INTO gd_esquema.Rol (Id, Nombre)
	VALUES (1, 'Administrativo')
INSERT INTO gd_esquema.Rol (Id, Nombre)
	VALUES (2, 'Cliente')
INSERT INTO gd_esquema.Rol (Id, Nombre)
	VALUES (3, 'Empresa')

--roles permisos
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 1)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 2)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 3)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 4)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 5)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 6)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 8)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 10)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 12)
INSERT INTO gd_esquema.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 13)

--Usuario Rol
INSERT INTO gd_esquema.UsuarioRol (IdUsuario, IdRol)
	VALUES (100, 1)

GO
