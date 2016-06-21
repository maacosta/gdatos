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

        public Publicacion InsPublicacion(string tipoPublicacion, string estado, string descripcion, decimal stock, DateTime fechaInicio, DateTime fechaVencimiento, decimal precio, decimal costo, bool permitirPreguntas, bool incluirEnvio, string codigoRubro, string codigoVisibilidad, string username)
        {
            object[] param = new object[] { tipoPublicacion, estado, descripcion, stock, fechaInicio, fechaVencimiento, precio, costo, permitirPreguntas, incluirEnvio, codigoRubro, codigoVisibilidad, username };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_insPublicacion", param).First();

            return data;
        }

        public Publicacion UpdPublicacion(string tipoPublicacion, string estado, string descripcion, decimal stock, DateTime fechaInicio, DateTime fechaVencimiento, decimal precio, decimal costo, bool permitirPreguntas, bool incluirEnvio, string codigoRubro, string codigoVisibilidad, string username)
        {
            object[] param = new object[] { tipoPublicacion, estado, descripcion, stock, fechaInicio, fechaVencimiento, precio, costo, permitirPreguntas, incluirEnvio, codigoRubro, codigoVisibilidad, username };

            var data = this._db.ExecuteSprocAccessor<Publicacion>("LOS_DE_ADELANTE.sp_publicacion_insPublicacion", param).First();

            return data;
        }
    }
}
