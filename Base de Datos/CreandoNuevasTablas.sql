
drop table  dbo.#TC
drop table dbo.#te
go
 
create table #TC(TC_Cli_Dni numeric (18, 0),
	TC_Cli_Apellido nvarchar (255),
	TC_Cli_Nombre nvarchar (255),
	TC_Cli_Fecha_Nac datetime,
	TC_Cli_Mail nvarchar (255),
	TC_Cli_Dom_Calle nvarchar (255),
	TC_Cli_Nro_Calle numeric (18, 0),
	TC_Cli_Piso numeric (18, 0),
	TC_Cli_Depto nvarchar (50),
	TC_Cli_Cod_Postal nvarchar (50)
)
go

insert  into dbo.#TC (TC_Cli_Dni,
	TC_Cli_Apellido,
	TC_Cli_Nombre,
	TC_Cli_Fecha_Nac,
	TC_Cli_Mail,
	TC_Cli_Dom_Calle,
	TC_Cli_Nro_Calle,
	TC_Cli_Piso,
	TC_Cli_Depto,
	TC_Cli_Cod_Postal)
	
 select distinct Cli_Dni,
	Cli_Apeliido,
	Cli_Nombre,
	Cli_Fecha_Nac,
	Cli_Mail,
	Cli_Dom_Calle,
	Cli_Nro_Calle,
	Cli_Piso,
	Cli_Depto,
	Cli_Cod_Postal 
	from gd_esquema.Maestra
	where Cli_Dni is not null
	union
	select distinct Publ_Cli_Dni,Publ_Cli_Apeliido,Publ_cli_Nombre,Publ_cli_Fecha_Nac,Publ_Cli_Mail,Publ_Cli_Dom_Calle,Publ_Cli_Nro_Calle,
Publ_Cli_Piso,Publ_Cli_Depto,Publ_Cli_Cod_Postal  from gd_esquema.Maestra 
where Publ_Cli_Dni is not null
go 
 
 
 create table dbo.#te (te_Empresa_Razon_Social nvarchar (255),
te_Empresa_Cuit nvarchar(50),
te_Empresa_Fecha_Creacion datetime,
te_Empresa_Mail nvarchar(50),
te_Empresa_Dom_Calle nvarchar(100),
te_Empresa_Nro_Calle numeric (18,0),
te_Empresa_Piso numeric (18,0),
te_Empresa_Depto nvarchar (50),
te_Empresa_Cod_Postal nvarchar (255))
go
insert into dbo.#te (te_Empresa_Razon_Social,
te_Empresa_Cuit,
te_Empresa_Fecha_Creacion,
te_Empresa_Mail,
te_Empresa_Dom_Calle,
te_Empresa_Nro_Calle,
te_Empresa_Piso,
te_Empresa_Depto,
te_Empresa_Cod_Postal)
select distinct
	   Publ_Empresa_Razon_Social,
	   Publ_Empresa_Cuit,
       Publ_Empresa_Fecha_Creacion,
       Publ_Empresa_Mail,
       Publ_Empresa_Dom_Calle,
       Publ_Empresa_Nro_Calle,
       Publ_Empresa_Piso,
       Publ_Empresa_Depto,
       Publ_Empresa_Cod_Postal
	   from gd_esquema.Maestra
where Publ_Empresa_Razon_Social is not null and
       Publ_Empresa_Cuit is not null
go
 
insert into gd_esquema.Usuario(Mail,Calle,Numero,Piso,Depto,CodigoPostal) 
select TC_Cli_Mail,TC_Cli_Dom_Calle,TC_Cli_Nro_Calle,TC_Cli_Piso,TC_Cli_Depto,TC_Cli_Cod_Postal from dbo.#TC
go

insert into gd_esquema.Cliente (Dni,IdUsuario,Apellido,Nombre,FechaNacimiento)  
select distinct TC_Cli_Dni,Id, TC_Cli_Apellido,TC_Cli_Nombre,TC_Cli_Fecha_Nac from dbo.#TC, gd_esquema.Usuario 
where TC_Cli_Mail = Mail and TC_Cli_Dom_Calle = Calle and TC_Cli_Nro_Calle = Numero
   and TC_Cli_Piso = Piso and TC_Cli_Depto =  Depto and TC_Cli_Cod_Postal = CodigoPostal
order by Id
    

 insert into gd_esquema.Usuario (Mail,Calle,Numero,Piso,Depto,CodigoPostal) 
select te_Empresa_Mail,te_Empresa_Dom_Calle,te_Empresa_Nro_Calle,te_Empresa_Piso,te_Empresa_Depto,te_Empresa_Cod_Postal from dbo.#te
go
  
insert into gd_esquema.Empresa (IdUsuario,Cuit,RazonSocial,FechaCreacion)
select 	Id,te_Empresa_Cuit,te_Empresa_Razon_Social,te_Empresa_Fecha_Creacion from dbo.#te, gd_esquema.Usuario
where te_Empresa_Mail = Mail and te_Empresa_Dom_Calle = Calle and te_Empresa_Nro_Calle = Numero
and te_Empresa_Piso = Piso and te_Empresa_Depto = Depto and te_Empresa_Cod_Postal = CodigoPostal
order by Id 
