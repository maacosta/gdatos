DROP PROCEDURE gd_esquema.sp_rubro_modifRubro
go

CREATE PROCEDURE gd_esquema.sp_rubro_modifRubro  (@id int,@codigo int,@descCorta varchar(50),@descLarga varchar(255))

AS
	BEGIN
		update  gd_esquema.Rubro 
		set  codigo=@codigo,DescCorta =@descCorta ,descLarga =@descLarga 
		where gd_esquema.Rubro.Id = @id
		
	END
GO

--para test
--exec sp_rubro_insRubro 9995,'fruta','manzana narja'
--select * from gd_esquema.Rubro
--exec sp_rubro_modifRubro 16,20480,'hola corto','saludo largo'
--select * from gd_esquema.Rubro
