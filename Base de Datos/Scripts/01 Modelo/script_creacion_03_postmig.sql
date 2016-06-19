/*
Secuencias
*/
CREATE SEQUENCE [LOS_DE_ADELANTE].[sq_publicacion] 
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

Set Nocount On

--username: admin, password: admin
SET IDENTITY_INSERT LOS_DE_ADELANTE.Usuario ON
GO 
INSERT INTO LOS_DE_ADELANTE.Usuario ([Id], [Username], [PassHash], [PassSalt])
     VALUES (100, 'admin', 'U3hc2PwspfX6gECdhWXkk9n4MEtL7NIPsXsvdUZPOu8n2YCi', 'J9mAog==')
SET IDENTITY_INSERT LOS_DE_ADELANTE.Usuario OFF
GO 

--permisos
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (1, 'Rol | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (2, 'Rol | M')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (3, 'Usuario | ABM')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (4, 'Rubro | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (5, 'Visibilidad | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (6, 'Publicación | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (7, 'Publicación | ABM')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (8, 'ComprarOfertar | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (9, 'ComprarOfertar | ABM')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (10, 'HistorialCliente | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (11, 'CalificaciónVendedor | A')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (12, 'ConsultaFacturas | V')
INSERT INTO LOS_DE_ADELANTE.Permiso (Id, Nombre)
	VALUES (13, 'ListadoEstadistico | V')

--roles
INSERT INTO LOS_DE_ADELANTE.Rol (Id, Nombre)
	VALUES (1, 'Administrativo')
INSERT INTO LOS_DE_ADELANTE.Rol (Id, Nombre)
	VALUES (2, 'Cliente')
INSERT INTO LOS_DE_ADELANTE.Rol (Id, Nombre)
	VALUES (3, 'Empresa')

--roles permisos
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 1)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 2)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 3)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 4)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 5)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 6)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 8)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 10)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 12)
INSERT INTO LOS_DE_ADELANTE.RolPermiso (IdRol, IdPermiso)
	VALUES (1, 13)

--Usuario Rol
INSERT INTO LOS_DE_ADELANTE.UsuarioRol (IdUsuario, IdRol)
	VALUES (100, 1)

GO
