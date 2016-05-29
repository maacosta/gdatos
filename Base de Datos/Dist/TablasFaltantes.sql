 --------------------------------------------------------------
 ----------------------Tabla Oferta---------------------------
/*	create table Oferta (
	       Oferta_Id int not null identity,
	       Oferta_Id_Publicacion int,
		   Oferta_Id_Usuario int,
	       Oferta_Fecha datetime,
	       Oferta_Monto numeric (18, 2))
     go
	 */
--insert into dbo.Oferta (Oferta_Id_Publicacion int,Oferta_Id_Usuario int,Oferta_Fecha, Oferta_Monto)
 select distinct Publicacion_Id,T.Usuario_Id,Oferta_Fecha,Oferta_Monto  from gd_esquema.Maestra
left join (select Usuario_Id,Empresa_Razon_Social,Empresa_Cuit,Cliente_Dni from dbo.Usuario
                left join dbo.Empresa on Usuario_Id = Empresa_Id
                left join dbo.Cliente on Usuario_Id = Cliente_Id) as T
on (Publ_Empresa_Razon_Social = T.Empresa_Razon_Social and Publ_Empresa_Cuit = T.Empresa_Cuit) or(Publ_Cli_Dni = T.Cliente_Dni)--and Cliente_Dni = T.Cliente_Dni
--left join dbo.Publicacion
--on T.Usuario_Id = Publicacion_Id_Usuario
where Oferta_Fecha is not null 
-- select * from dbo.Publicacion
 /*

------------------------------------------------------------------
-----------------Tabla Calificacion-------------------------------

create table Calificacion (
    Calificacion_Id int not null identity,
    Calificacion_Id_Publicacion int,
    Calificacion_Id_Usuario int,
    Calificacion_Codigo numeric (18, 0),
	Calificacion_Cant_Estrellas numeric (18, 0),
	Calificacion_Descripcion nvarchar (255))
go
-------------------------------------------------------------------
------------Tabla Compra--------------------------------------------

create table Compra (
    Compra_ID int not null identity,
    Compra_Id_Publicacion int,
    Compra_Id_Usuario int,
	Compra_Fecha datetime,
	Compra_Cantidad numeric (18, 0))
    
go
--------------------------------------------------------------------
-------------Tabla FacturaItem ------------------------------------------

create table FacturaItem (
    FacturaItem_Id int not null identity, 
    FacturaItem_Id_Factura int,
    FacturaItem_Id_Compra int,
    FacturaItem_Monto numeric (18, 2),
	FacturaItem_Cantidad numeric (18, 0))
go	  

--------------------------------------------------------------------
---------------Tabla Factura----------------------------------------
create table Factura (	
    Factura_Id int not null identity,
	Factura_Id_Usuario int,
	Factura_Id_FormaPago int,
	Factura_Nro numeric (18, 0),
	Factura_Fecha datetime,
    Factura_Total numeric (18, 2),
	Forma_Pago_Desc nvarchar (255))
go

--------------------------------------------------------------------
------Table FormaPago----------------------------------------------

create table FormaPago(
      FormaPago_Id int not null identity,     
      FormaPago_Desc nvarchar (255))
go

*/
