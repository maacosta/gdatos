--Uno con y sin @Id pasado como parametro
--suponiendo que no se actualizan datos tabla.Cliente

IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updCliente
go

create procedure LOS_DE_ADELANTE.sp_usuario_updCliente 
(  
     @Id  int,  
    -- @Dni numeric(18,0), 
	-- @Apellido nvarchar (255), 
	-- @Nombre nvarchar (255), 
	-- @FechaNacimiento datetime,
	 @Mail nvarchar (255), 
	 @Telefono nvarchar (50),
	 @Calle nvarchar (255), 
	 @Numero numeric (18,0), 
	 @Piso numeric (18,0), 
	 @Depto nvarchar (50), 
	 @CodigoPostal nvarchar (50),
	 @Localidad nvarchar (255)
)
AS
	BEGIN
		update  LOS_DE_ADELANTE.Usuario
		set  Mail = @Mail, Calle = @Calle, Numero = @Numero, Piso = @Piso, Depto = @Depto,CodigoPostal= @CodigoPostal,Localidad = @Localidad
		where LOS_DE_ADELANTE.Usuario.Id = @id 
	END
GO


--En caso de no pasar por parametro @Id

/*IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_updCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_updCliente
go

create procedure LOS_DE_ADELANTE.sp_usuario_updCliente 
(  
     @Dni numeric(18,0),  -- suponemos que no actualiza Tabla Clientes
	-- @Apellido nvarchar (255), 
	-- @Nombre nvarchar (255), 
	-- @FechaNacimiento datetime,
	 @Mail nvarchar (255), 
	 @Telefono nvarchar (50),
	 @Calle nvarchar (255), 
	 @Numero numeric (18,0), 
	 @Piso numeric (18,0), 
	 @Depto nvarchar (50), 
	 @CodigoPostal nvarchar (50),
	 @Localidad nvarchar (255)
)
AS
	BEGIN
		update  LOS_DE_ADELANTE.Usuario
		set  Mail = @Mail, Telefono= @Telefono, Calle = @Calle, Numero = @Numero, Piso = @Piso, Depto = @Depto,CodigoPostal= @CodigoPostal,Localidad = @Localidad
		where LOS_DE_ADELANTE.Usuario.Id = (select IdUsuario from LOS_DE_ADELANTE.Cliente
		                                     where LOS_DE_ADELANTE.Cliente.Dni = 1233)
		
	END
GO
*/


 --LOS_DE_ADELANTE.sp_usuario_updCliente 1233,'hjdf@',1234,'cambiado',3,3,'bb',1234,'ba'
 