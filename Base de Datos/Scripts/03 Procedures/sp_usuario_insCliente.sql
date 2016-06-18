--EnUsuario
IF (OBJECT_ID('gd_esquema.sp_usuario_insCliente') IS NOT NULL)
	drop PROCEDURE gd_esquema.sp_usuario_insCliente
go
create procedure gd_esquema.sp_usuario_insCliente ( 
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

 insert into gd_esquema.Usuario (Username, Mail, Calle, Numero, Piso, Depto, CodigoPostal,Localidad,Intentos)
 values (@Dni,@mail,@Calle,@Numero,@Piso,@Depto,@CodigoPostal,@Localidad,0);

 set @idmax = SCOPE_IDENTITY();

 insert into gd_esquema.Cliente(IdUsuario, Dni, TipoDocumento, Apellido, Nombre, FechaNacimiento, FechaCreacion) 
 values (@idmax,@Dni,'DNI',@Apellido,@Nombre,@FechaNacimiento,@hoy); 
 end

 --
 --gd_esquema.sp_usuario_insCliente 1233,'palo','fruta','10-08-1990','hjdf@',1234,'hola',3,3,'b',1234,'ba'

