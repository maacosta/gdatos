if (object_id ('LOS_DE_ADELANTE.sp_publicacion_insPublicacion')is not null)
drop procedure LOS_DE_ADELANTE.sp_publicacion_insPublicacion
go

create procedure LOS_DE_ADELANTE.sp_publicacion_insPublicacion 
(
   @TipoPublicacion char(1),
   @Descripcion nvarchar (225),
   @Stock numeric (18,0),
   @Precio numeric (18,2),
   @RubroDescripcion nvarchar (255),
   @PrecioVisibilidad numeric (18,2)
)
as 
begin
@hoy = getdate()

insert into LOS_DE_ADELANTE.Publicacion(TipoPublicacion,Estado,Descripcion,Stock,FechaInicio,Precio,IdRubro,IdVisibilidad)
values(@TipoPublicacion,'F',@Descripcion,@Stock,@hoy,@precio,(select Id from LOS_DE_ADELANTE.Rubro 
                                                               where DescCorta = @RubroDescripcion ), 
															   (select Id from LOS_DE_ADELANTE.Visibilidad
															   where Precio = @PrecioVisibilidad))

end
go

--select * from LOS_DE_ADELANTE.Visibilidad