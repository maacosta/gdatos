IF OBJECT_ID('tempdb..#TRubro') IS NOT NULL DROP TABLE #TRubro

select r.*, identity(int, 100,1) as codigo into #TRubro
from (
select distinct Publicacion_Rubro_Descripcion [desc]
from gd_esquema.Maestra 
where Publicacion_Rubro_Descripcion is not null
) r

insert into LOS_DE_ADELANTE.Rubro
	(Codigo, DescCorta, DescLarga) 
select codigo, [desc], [desc]
from #TRubro
go