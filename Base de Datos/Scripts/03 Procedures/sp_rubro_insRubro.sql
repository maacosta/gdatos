DROP PROCEDURE LOS_DE_ADELANTE.sp_rubro_insRubro
go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rubro_insRubro  (@codigo int,@descCorta varchar(50),@descLarga varchar(255))

AS
	BEGIN
		insert into LOS_DE_ADELANTE.Rubro (	codigo,DescCorta,DescLarga ) values (@codigo,@descCorta,@descLarga)
	END
GO

