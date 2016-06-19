IF (OBJECT_ID('LOS_DE_ADELANTE.sp_rubro_getRubroFiltros') IS NOT NULL)
  Drop Procedure LOS_DE_ADELANTE.sp_rubro_getRubroFiltros
Go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_rubro_getRubroFiltros (@Descripcion nvarchar(255))
AS

BEGIN

SELECT Id, Codigo, DescCorta, DescLarga
  FROM LOS_DE_ADELANTE.Rubro
 WHERE @Descripcion IS NULL
    OR DescCorta LIKE '%' + @Descripcion + '%'
    OR DescLarga LIKE '%' + @Descripcion + '%'

END
GO