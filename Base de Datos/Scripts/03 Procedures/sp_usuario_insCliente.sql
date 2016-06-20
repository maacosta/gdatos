--EnUsuario
IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_insCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_insCliente
go
create procedure LOS_DE_ADELANTE.sp_usuario_insCliente ( 
     @Dni numeric(18,0), 
	 @Apellido nvarchar (255), 
	 @Nombre nvarchar (255), 
	 @FechaNacimiento datetime,
	 @Mail nvarchar (255), 
	 @Telefono nvarchar (50),
	 @Calle nvarchar (255), 
	 @Numero numeric (18,0), 
	 @Piso numeric (18,0), 
	 @Depto nvarchar (50), 
	 @CodigoPostal nvarchar (50),
	 @Localidad nvarchar (255)) 
 as
 begin
 declare @hoy datetime = getdate()
declare @idmax int

 insert into LOS_DE_ADELANTE.Usuario (Username, Mail,Telefono, Calle, Numero, Piso, Depto, CodigoPostal,Localidad,Intentos)
 values (@Dni,@Mail,@Telefono,@Calle,@Numero,@Piso,@Depto,@CodigoPostal,@Localidad,0);

 set @idmax = SCOPE_IDENTITY();

 insert into LOS_DE_ADELANTE.Cliente(IdUsuario, Dni, TipoDocumento, Apellido, Nombre, FechaNacimiento, FechaCreacion) 
 values (@idmax,@Dni,'DNI',@Apellido,@Nombre,@FechaNacimiento,@hoy); 
 end
 go
 
 --LOS_DE_ADELANTE.sp_usuario_insCliente 1233,'palo','fruta','10-08-1990','hjdf@',1234,'hola',3,3,'b',1234,'ba'
 --select* from LOS_DE_ADELANTE.Usuario
--select* from LOS_DE_ADELANTE.Cliente

