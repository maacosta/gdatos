
---------------------------------------------------------------
-----------Creacion de la entidad Usuario Empresa Cliente ---------------------

---este cursor andaria de maravilla si lograra poner la clave primaria con la 
--con la variable que cree @var_ind
-- talvez exista otra funcion que age lo mismo, pero no puede ser el identity. 
-- 

 /*drop table dbo.Usuario
 drop table dbo.Cliente
 drop table dbo.Empresa
 go    


  create table Usuario(
    Usuario_Id int not null identity,
	Usuario_Mail nvarchar (255),
    Usuario_Dom_Calle nvarchar(255),
    Usuario_Nro_Calle numeric(18, 0),
    Usuario_Piso numeric(18, 0),
    Usuario_Depto nvarchar(50),
    Usuario_Cod_Postal nvarchar (50) )
go


create table Cliente (
     Cliente_Id int not null identity,
     Cliente_Dni numeric (18, 0),
     Cliente_Apellido nvarchar (255) ,
     Cliente_Nombre nvarchar(255),
     Cliente_Fecha_Nac datetime )
	 go 

 create table Empresa (
       Empresa_Id int not null identity, 
       Empresa_Razon_Social nvarchar (255),
       Empresa_Cuit nvarchar(50) ,
       Empresa_Fecha_Creacion datetime )

	




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

--declare @var_Id int;


DECLARE cursorInsertarUsu_Cli_Emp cursor 
 for select Publ_Cli_Dni,
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

OPEN cursorInsertarUsu_Cli_Emp 
fetch next from cursorInsertarUsu_Cli_Emp
into @var_Cli_Dni,@var_Cli_Apellido,@var_cli_Nombre,@var_cli_Fecha_Nac,
     @var_Cli_Mail,@var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal,
	 @var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion,
	 @var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal;
  --   @var_Id = 1;
 while @@fetch_status = 0
  begin
     if(@var_Cli_Dni is not null)
	 begin
        insert into dbo.Usuario (Usuario_Mail,Usuario_Dom_Calle, Usuario_Nro_Calle, Usuario_Piso,Usuario_Depto, Usuario_Cod_Postal)
	    values(@var_Cli_Mail , @var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal);

	    insert into dbo.Cliente (Cliente_Dni,Cliente_Apellido,Cliente_Nombre,Cliente_Fecha_Nac)
	    values(@var_Cli_Dni, @var_Cli_Apellido, @var_cli_Nombre, @var_cli_Fecha_Nac);
	 end
	     else
	 begin
	    insert into dbo.Usuario(Usuario_Mail,Usuario_Dom_Calle, Usuario_Nro_Calle, Usuario_Piso,Usuario_Depto, Usuario_Cod_Postal) 
	    values (@var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal);

	    insert into dbo.Empresa(Empresa_Razon_Social,Empresa_Cuit,Empresa_Fecha_Creacion)
	    values (@var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion); 
	 end
	 

   fetch next from cursorInsertarUsu_Cli_Emp
   into @var_Cli_Dni,@var_Cli_Apellido,@var_cli_Nombre,@var_cli_Fecha_Nac,
        @var_Cli_Mail,@var_Cli_Dom_Calle,@var_Cli_Nro_Calle,@var_Cli_Piso,@var_Cli_Depto,@var_Cli_Cod_Postal,
	    @var_Empresa_Razon_Social, @var_Empresa_Cuit, @var_Empresa_Fecha_Creacion,
	    @var_Empresa_Mail,@var_Empresa_Dom_Calle,@var_Empresa_Nro_Calle,@var_Empresa_Piso,@var_Empresa_Depto,@var_Empresa_Cod_Postal;
		--@var_Id = @var_Id + 1;
end

CLOSE cursorInsertarUsu_Cli_Emp;
DEALLOCATE cursorInsertarUsu_Cli_Emp;
GO
 */
 /*select * from dbo.Usuario
 select * from dbo.Cliente
 select * from dbo.Empresa*/

 




  
