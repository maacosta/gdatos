IF OBJECT_ID('tempdb..#TCliente') IS NOT NULL DROP TABLE #TCliente
IF OBJECT_ID('tempdb..#TEmpresa') IS NOT NULL DROP TABLE #TEmpresa
GO

SET IDENTITY_INSERT gd_esquema.Usuario ON
GO 

--Temporal Clientes

select c.*, IDENTITY(int, 1, 1) AS id into #TCliente
from (
select distinct 
	Cli_Dni dni,
	Cli_Apeliido apellido,
	Cli_Nombre nombre,
	Cli_Fecha_Nac fechanac,
	Cli_Mail mail,
	Cli_Dom_Calle calle,
	Cli_Nro_Calle numero,
	Cli_Piso piso,
	Cli_Depto depto,
	Cli_Cod_Postal cp
from gd_esquema.Maestra 
where Cli_Dni is not null
union
select distinct 
	Publ_Cli_Dni dni,
	Publ_Cli_Apeliido apellido,
	Publ_cli_Nombre nombre,
	Publ_cli_Fecha_Nac fechanac,
	Publ_Cli_Mail mail,
	Publ_Cli_Dom_Calle calle,
	Publ_Cli_Nro_Calle numero,
	Publ_Cli_Piso piso,
	Publ_Cli_Depto depto,
	Publ_Cli_Cod_Postal cp
from gd_esquema.Maestra  
where Publ_Cli_Dni is not null
) c

--Temporal Empresa

select e.*, IDENTITY(int, 1, 1) AS id into #TEmpresa
from (
select distinct 
	Publ_Empresa_Razon_Social razonsocial,
	Publ_Empresa_Cuit cuit,
	Publ_Empresa_Fecha_Creacion fechacreacion,
	Publ_Empresa_Mail mail,
	Publ_Empresa_Dom_Calle calle,
	Publ_Empresa_Nro_Calle numero,
	Publ_Empresa_Piso piso,
	Publ_Empresa_Depto depto,
	Publ_Empresa_Cod_Postal cp
from gd_esquema.Maestra
where Publ_Empresa_Razon_Social is not null and Publ_Empresa_Cuit is not null
) e

--inicializacion de datos
declare @hoy datetime = getdate()
declare @idmax int

--Usuario

insert into gd_esquema.Usuario
	(Id, Username, Mail, Calle, Numero, Piso, Depto, CodigoPostal) 
select id, dni, mail, calle, numero, piso, depto, cp 
from #TCliente

set @idmax = SCOPE_IDENTITY()+1

insert into gd_esquema.Cliente 
	(IdUsuario, Dni, TipoDocumento, Apellido, Nombre, FechaNacimiento, FechaCreacion)  
select distinct 
	id, dni, 'DNI', apellido, nombre, fechanac, @hoy
from #TCliente

--Empresa

insert into gd_esquema.Usuario
	(Id, Username, Mail, Calle, Numero, Piso, Depto, CodigoPostal) 
select id+@idmax, cuit, mail, calle, numero, piso, depto, cp 
from #TEmpresa
  
insert into gd_esquema.Empresa 
	(IdUsuario, Cuit, RazonSocial, FechaCreacion)
select 	Id+@idmax, cuit, razonsocial, fechacreacion 
from #TEmpresa

SET IDENTITY_INSERT gd_esquema.Usuario OFF
GO 
