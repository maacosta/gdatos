DROP PROCEDURE sp_rubro_insRubro
go

CREATE PROCEDURE sp_rubro_insRubro  (@codigo int,@descCorta varchar(50),@descLarga varchar(255))

AS
	BEGIN
		insert into gd_esquema.Rubro (	codigo,DescCorta,DescLarga ) values (@codigo,@descCorta,@descLarga)
	END
GO

