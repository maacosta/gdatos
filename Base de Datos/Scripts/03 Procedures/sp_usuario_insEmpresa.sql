--EnUsuario
IF (OBJECT_ID('gd_esquema.sp_usuario_insEmpresa') IS NOT NULL)
	drop PROCEDURE gd_esquema.sp_usuario_insEmpresa
go
create procedure gd_esquema.sp_usuario_insEmpresa( 
     @Cuit nvarchar (50),
	 @RazonSocial nvarchar(255),
	 @Ciudad nvarchar (50),
	 @Contacto nvarchar (50),
	 @RubroPrincipal nvarchar(10),
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
 values (@Cuit,@mail,@Calle,@Numero,@Piso,@Depto,@CodigoPostal,@Localidad,0);

 set @idmax = SCOPE_IDENTITY();

 insert into gd_esquema.Empresa (IdUsuario, Cuit, RazonSocial, FechaCreacion, Ciudad ,NombreContacto , RubroPrincipal)
 values (@idmax,@Cuit,@RazonSocial,@hoy,@Ciudad ,@Contacto , @RubroPrincipal )
 end

 
-- gd_esquema.sp_usuario_insEmpresa '12345-4','palo','fruta','cntacto','rpl','hjdf@',1234,'hola',3,3,'b',1234,'ba'

