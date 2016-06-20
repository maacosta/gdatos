----Uno con y sin @Id pasado como parametro
--suponiendo que no se actualizan datos tabla.Empresa

IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updEmpresa') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updEmpresa
go
create procedure LOS_DE_ADELANTE.sp_usuario_updEmpresa
    ( 
     @Id int,
     --@Cuit nvarchar (50),
	 --@RazonSocial nvarchar(255),
	 --@Ciudad nvarchar (50),
	 --@Contacto nvarchar (50),
	 --@RubroPrincipal nvarchar(10),
	 @Mail nvarchar (255), 
	 @Telefono nvarchar (50),
	 @Calle nvarchar (255), 
	 @Numero numeric (18,0), 
	 @Piso numeric (18,0), 
	 @Depto nvarchar (50), 
	 @CodigoPostal nvarchar (50),
	 @Localidad nvarchar (255)
	 ) 

as
begin
     update LOS_DE_ADELANTE.Usuario
	 set Mail = @Mail, Calle = @Calle, Numero = @Numero, Piso = @Piso, Depto = @Depto,CodigoPostal= @CodigoPostal,Localidad = @Localidad
	 where @Id = LOS_DE_ADELANTE.Usuario.Id

	-- update LOS_DE_ADELANTE.Empresa
	-- set Contacto = @Contacto
	-- where LOS_DE_ADELANTE.Empresa.IdUsuario = @Id
end 
go

-- sin @id como parametro
/*
IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updEmpresa') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updEmpresa
go
create procedure LOS_DE_ADELANTE.sp_usuario_updEmpresa
     ( 

     @Cuit nvarchar (50),
	 @RazonSocial nvarchar(255),
	 --@Ciudad nvarchar (50),
	 --@Contacto nvarchar (50),
	 --@RubroPrincipal nvarchar(10),
	 @Mail nvarchar (255), 
	 @Telefono nvarchar (50),
	 @Calle nvarchar (255), 
	 @Numero numeric (18,0), 
	 @Piso numeric (18,0), 
	 @Depto nvarchar (50), 
	 @CodigoPostal nvarchar (50),
	 @Localidad nvarchar (255)
	 ) 

as
begin
     update LOS_DE_ADELANTE.Usuario
	 set Mail = @Mail,Telefono = @Telefono, Calle = @Calle, Numero = @Numero, Piso = @Piso, Depto = @Depto,CodigoPostal= @CodigoPostal,Localidad = @Localidad
	 where Id = (select IdUsuario from LOS_DE_ADELANTE.Empresa
	                 where Cuit = @Cuit and RazonSocial = @RazonSocial)
      
    -- update LOS_DE_ADELANTE.Empresa
	 --set Contacto = @Contacto
	--where  LOS_DE_ADELANTE.Empresa.Cuit = @Cuit and LOS_DE_ADELANTE.Empresa.RazonSocial = @RazonSocial
	
end
go */

--LOS_DE_ADELANTE.sp_usuario_updEmpresa  '12345-4','palo','hjdf@',1234,'otgdd',3,3,'b',1234,'ba'
--LOS_DE_ADELANTE.sp_usuario_updEmpresa  2,'hjdf@',1234,'otgdd',3,3,'b',1234,'ba'


