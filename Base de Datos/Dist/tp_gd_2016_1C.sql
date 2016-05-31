USE gd1c2016

---------------------------------------------------------------
-----------Creacion de la entidad Usuario Empresa Cliente ---------------------

IF EXISTS (SELECT * FROM sys.tables  WHERE	name = 'Usuario')
DROP TABLE Usuario
GO

IF EXISTS (SELECT * FROM sys.tables  WHERE	name = 'Cliente')
DROP TABLE Cliente
GO

IF EXISTS (SELECT * FROM sys.tables  WHERE	name = 'Empresa')
DROP TABLE Empresa
GO



 

 drop table #dbo.tablaTemporal
 go   
 
 
  create table Usuario(
    Usuario_Id int primary key not null,
	Usuario_Mail nvarchar (255),
    Usuario_Dom_Calle nvarchar(255),
    Usuario_Nro_Calle numeric(18, 0),
    Usuario_Piso numeric(18, 0),
    Usuario_Depto nvarchar(50),
    Usuario_Cod_Postal nvarchar (50) )
go


create table Cliente (
     Cliente_Id int primary key not null,
     Cliente_Dni numeric (18, 0),
     Cliente_Apellido nvarchar (255) ,
     Cliente_Nombre nvarchar(255),
     Cliente_Fecha_Nac datetime )
	 go 

 create table Empresa (
       Empresa_Id int primary key not null, 
       Empresa_Razon_Social nvarchar (255),
       Empresa_Cuit nvarchar(50) ,
       Empresa_Fecha_Creacion datetime )

	go

create table #tablaTemporal(T_Id int identity,T_Cli_Dni numeric (18, 0),T_Cli_Apellido nvarchar (255),T_cli_Nombre nvarchar(255),
T_cli_Fecha_Nac datetime,T_Cli_Mail nvarchar(255),T_Cli_Dom_Calle nvarchar(255),T_Cli_Nro_Calle numeric (18,0),T_Cli_Piso numeric (18,0),
T_Cli_Depto nvarchar(50),T_Cli_Cod_Postal nvarchar(50),
T_Empresa_Razon_Social nvarchar (255),T_Empresa_Cuit nvarchar(50),T_Empresa_Fecha_Creacion datetime,T_Empresa_Mail nvarchar(50),
T_Empresa_Dom_Calle nvarchar(100),T_Empresa_Nro_Calle numeric (18,0),T_Empresa_Piso numeric (18,0),T_Empresa_Depto nvarchar (50),
T_Empresa_Cod_Postal nvarchar (255))

insert into dbo.#tablaTemporal (T_Cli_Dni,T_Cli_Apellido,T_cli_Nombre,T_cli_Fecha_Nac,T_Cli_Mail,T_Cli_Dom_Calle,T_Cli_Nro_Calle,
T_Cli_Piso,T_Cli_Depto,T_Cli_Cod_Postal,
T_Empresa_Razon_Social,T_Empresa_Cuit ,T_Empresa_Fecha_Creacion,T_Empresa_Mail,T_Empresa_Dom_Calle,T_Empresa_Nro_Calle,
T_Empresa_Piso,T_Empresa_Depto,T_Empresa_Cod_Postal)
select distinct Publ_Cli_Dni,
       Publ_Cli_Apeliido,
       Publ_Cli_Nombre,
       Publ_Cli_Fecha_Nac,
       Publ_Cli_Mail,
       Publ_Cli_Dom_Calle,
       Publ_Cli_Nro_Calle,
       Publ_Cli_Piso,
       Publ_Cli_Depto,
       Publ_Cli_Cod_Postal,
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
group by Publ_Cli_Dni,
       Publ_Cli_Apeliido,
       Publ_Cli_Nombre,
       Publ_Cli_Fecha_Nac,
       Publ_Cli_Mail,
       Publ_Cli_Dom_Calle,
       Publ_Cli_Nro_Calle,
       Publ_Cli_Piso,
       Publ_Cli_Depto,
       Publ_Cli_Cod_Postal,  
       Publ_Empresa_Razon_Social,
       Publ_Empresa_Cuit,
       Publ_Empresa_Fecha_Creacion,
       Publ_Empresa_Mail,
       Publ_Empresa_Dom_Calle,
       Publ_Empresa_Nro_Calle,
       Publ_Empresa_Piso,
       Publ_Empresa_Depto,
       Publ_Empresa_Cod_Postal 
go

declare @var_Id int;
declare @var_Cli_Dni numeric (18, 0);
declare @var_Cli_Apellido nvarchar (255);
declare @var_cli_Nombre nvarchar(255);
declare @var_cli_Fecha_Nac datetime;
declare @var_Cli_Mail nvarchar(255);
declare @var_Cli_Dom_Calle nvarchar(255);
declare @var_Cli_Nro_Calle numeric (18,0);
declare @var_Cli_Piso numeric (18,0);
declare @var_Cli_Depto nvarchar(50);
declare @var_Cli_Cod_Postal nvarchar(50);
 
declare @var_Empresa_Razon_Social nvarchar (255);
declare @var_Empresa_Cuit nvarchar(50);
declare @var_Empresa_Fecha_Creacion datetime;
declare @var_Empresa_Mail nvarchar(50);
declare @var_Empresa_Dom_Calle nvarchar(100);
declare @var_Empresa_Nro_Calle numeric (18,0);
declare @var_Empresa_Piso numeric (18,0);
declare @var_Empresa_Depto nvarchar (50);
declare @var_Empresa_Cod_Postal nvarchar (255);

DECLARE cursorInsertarUsu_Cli_Emp cursor 
 for 
select* from dbo.#tablaTemporal

OPEN cursorInsertarUsu_Cli_Emp 
fetch next from cursorInsertarUsu_Cli_Emp
into @var_Id,@var_Cli_Dni,@var_Cli_Apellido,@var_cli_Nombre,@var_cli_Fecha_Nac,
     @var_Cli_Mail,@var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal,
	 @var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion,
	 @var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal;
     
 while @@fetch_status = 0
  begin
     if(@var_Cli_Dni is not null)
	 begin
        insert into dbo.Usuario (Usuario_Id,Usuario_Mail,Usuario_Dom_Calle, Usuario_Nro_Calle, Usuario_Piso,Usuario_Depto, Usuario_Cod_Postal)
	    values(@var_Id,@var_Cli_Mail , @var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal);

	    insert into dbo.Cliente (Cliente_Id,Cliente_Dni,Cliente_Apellido,Cliente_Nombre,Cliente_Fecha_Nac)
	    values(@var_Id,@var_Cli_Dni, @var_Cli_Apellido, @var_cli_Nombre, @var_cli_Fecha_Nac);
	 end
	     else
	 begin
	    insert into dbo.Usuario(Usuario_Id,Usuario_Mail,Usuario_Dom_Calle, Usuario_Nro_Calle, Usuario_Piso,Usuario_Depto, Usuario_Cod_Postal) 
	    values (@var_Id,@var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal);

	    insert into dbo.Empresa(Empresa_Id,Empresa_Razon_Social,Empresa_Cuit,Empresa_Fecha_Creacion)
	    values (@var_Id,@var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion); 
	 end
	 

   fetch next from cursorInsertarUsu_Cli_Emp
   into @var_Id,@var_Cli_Dni,@var_Cli_Apellido,@var_cli_Nombre,@var_cli_Fecha_Nac,
        @var_Cli_Mail,@var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal,
	    @var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion,
	    @var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal;
		
end

CLOSE cursorInsertarUsu_Cli_Emp;
DEALLOCATE cursorInsertarUsu_Cli_Emp;
GO 

/* select * from dbo.Usuario
 select * from dbo.Cliente
 select * from dbo.Empresa */

 




  
