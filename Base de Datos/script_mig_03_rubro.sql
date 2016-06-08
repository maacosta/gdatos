/********************Rubro****************************/


 
create table #tr(trDescLarga nvarchar(255), trCodigo numeric (18,0) identity (100,1) NOT NULL,trDescCorta nvarchar(50) )
 go

 insert into dbo.#tr (trDescLarga,trDescCorta)
select distinct Publicacion_Rubro_Descripcion, dbo.descripcionCorta(Publicacion_Rubro_Descripcion)  
from gd_esquema.Maestra where Publicacion_Rubro_Descripcion is not null order by 2
go 
insert into gd_esquema.Rubro (DescLarga,Codigo,DescCorta)
select trDescLarga,trCodigo,trDescCorta from dbo.#tr
go