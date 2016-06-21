IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_delEmpresa') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_delEmpresa
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_delEmpresa  (@Id int)
AS
	BEGIN
	    delete from LOS_DE_ADELANTE.Empresa
		where LOS_DE_ADELANTE.Empresa.IdUsuario = @Id;

		 delete from LOS_DE_ADELANTE.Usuario
		 where LOS_DE_ADELANTE.Usuario.Id = @Id;
		 
	END
go	

--LOS_DE_ADELANTE.sp_usuario_delEmpresa 2



