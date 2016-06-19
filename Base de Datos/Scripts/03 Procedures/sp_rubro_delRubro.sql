DROP PROCEDURE LOS_DE_ADELANTE.sp_rubro_delRubro
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rubro_delRubro  (@id int)

AS
	BEGIN
		delete from LOS_DE_ADELANTE.Rubro  where LOS_DE_ADELANTE.Rubro.Id = @id
	END
GO

