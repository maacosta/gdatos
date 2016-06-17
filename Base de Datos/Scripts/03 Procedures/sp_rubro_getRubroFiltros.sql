IF (OBJECT_ID('gd_esquema.sp_rubro_getRubroFiltros') IS NOT NULL)
  Drop Procedure gd_esquema.sp_rubro_getRubroFiltros
Go

CREATE PROCEDURE gd_esquema.sp_rubro_getRubroFiltros (@Descripcion nvarchar(255))
AS

BEGIN

SELECT Id, Codigo, DescCorta, DescLarga
  FROM gd_esquema.Rubro
 WHERE @Descripcion IS NULL
    OR DescCorta LIKE '%' + @Descripcion + '%'
    OR DescLarga LIKE '%' + @Descripcion + '%'

END
GO