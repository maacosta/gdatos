IF (OBJECT_ID('LOS_DE_ADELANTE.sp_visibilidad_getVisibilidadFiltros') IS NOT NULL)
  Drop Procedure LOS_DE_ADELANTE.sp_visibilidad_getVisibilidadFiltros
Go

CREATE PROCEDURE LOS_DE_ADELANTE.sp_visibilidad_getVisibilidadFiltros
(
	@Descripcion nvarchar(255)
)
AS

BEGIN

	SELECT Id, Codigo, Descripcion, Precio, Porcentaje, PorcentajeEnvio
	  FROM LOS_DE_ADELANTE.Visibilidad
	 WHERE @Descripcion IS NULL
		OR Descripcion LIKE '%' + @Descripcion + '%'

END
GO