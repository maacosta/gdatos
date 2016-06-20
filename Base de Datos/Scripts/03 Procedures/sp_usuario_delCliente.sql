IF (OBJECT_ID('LOS_DE_ADELANTE.sp_usuario_delCliente') IS NOT NULL)
	drop PROCEDURE LOS_DE_ADELANTE.sp_usuario_delCliente
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_usuario_delCliente  (@Id int)
AS
	BEGIN
	    delete from LOS_DE_ADELANTE.Cliente
		where LOS_DE_ADELANTE.Cliente.IdUsuario = @Id;

		 delete from LOS_DE_ADELANTE.Usuario
		 where LOS_DE_ADELANTE.Usuario.Id = @Id;
		 
	END
go	

--LOS_DE_ADELANTE.sp_usuario_delCliente 1



