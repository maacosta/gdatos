DROP PROCEDURE gd_esquema.sp_rubro_delRubro
go

CREATE PROCEDURE gd_esquema.sp_rubro_delRubro  (@id int)

AS
	BEGIN
		delete from gd_esquema.Rubro  where gd_esquema.Rubro.Id = @id
	END
GO

