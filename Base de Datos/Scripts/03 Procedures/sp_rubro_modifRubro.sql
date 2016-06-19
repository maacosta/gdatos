DROP PROCEDURE LOS_DE_ADELANTE.sp_rubro_modifRubro
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rubro_modifRubro  (@id int,@codigo int,@descCorta varchar(50),@descLarga varchar(255))

AS
	BEGIN
		update  LOS_DE_ADELANTE.Rubro 
		set  codigo=@codigo,DescCorta =@descCorta ,descLarga =@descLarga 
		where LOS_DE_ADELANTE.Rubro.Id = @id
		
	END
GO

--para test
--exec sp_rubro_insRubro 9995,'fruta','manzana narja'
--select * from LOS_DE_ADELANTE.Rubro
--exec sp_rubro_modifRubro 16,20480,'hola corto','saludo largo'
--select * from LOS_DE_ADELANTE.Rubro
