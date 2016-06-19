USE [GD1C2016]
GO
/****** Object:  StoredProcedure [LOS_DE_ADELANTE].[sp_visibilidad_getVisibilidadFiltros]    Script Date: 17/6/2016 1:49:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [LOS_DE_ADELANTE].[sp_visibilidad_getVisibilidadFiltros] 
(@Id Int, @Codigo Numeric(18,0), @Descripcion Nvarchar(255), @Precio Numeric(18,0), @Porcentaje Numeric(18,2), @PorcentajeEnvio Numeric(18,2)) As

Begin

SELECT Id, Codigo, Descripcion, Precio, Porcentaje, PorcentajeEnvio
  FROM LOS_DE_ADELANTE.Visibilidad
 WHERE (Id = @Id OR @Id IS NULL)
   AND (Codigo = @Codigo OR @Codigo IS NULL)
   AND (Descripcion LIKE '%' + @Descripcion + '%' OR @Descripcion IS NULL)
End
Go