using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace MercadoEnvio.Dal.Impl
{
    public class PublicacionDal : BaseDal
    {
        public List<Publicacion> GetByDesc(string username, string texto)
        {
            object[] param = new object[] { username, texto };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_getPublicacionPropiaFiltros", param).ToList();

            return data;
        }

        public Publicacion InsPublicacion(string tipoPublicacion, string estado, string descripcion, decimal stock, DateTime fechaInicio, DateTime fechaVencimiento, decimal precio, decimal costo, bool permitirPreguntas, bool incluirEnvio, int idRubro, int idVisibilidad, string username)
        {
            object[] param = new object[] { tipoPublicacion, estado, descripcion, stock, fechaInicio, fechaVencimiento, precio, costo, permitirPreguntas, incluirEnvio, idRubro, idVisibilidad, username };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_insPublicacion", param).First();

            return data;
        }

        public Publicacion UpdPublicacion(int idPublicacion, string tipoPublicacion, string estado, string descripcion, decimal stock, DateTime fechaInicio, DateTime fechaVencimiento, decimal precio, decimal costo, bool permitirPreguntas, bool incluirEnvio, int idRubro, int idVisibilidad, string username)
        {
            object[] param = new object[] { idPublicacion, tipoPublicacion, estado, descripcion, stock, fechaInicio, fechaVencimiento, precio, costo, permitirPreguntas, incluirEnvio, idRubro, idVisibilidad, username };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_updPublicacion", param).First();

            return data;
        }

        public Publicacion UpdPublicacionEstado(int idPublicacion, string estado)
        {
            object[] param = new object[] { idPublicacion, estado };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_updPublicacionEstado", param).First();

            return data;
        }
    }
}
