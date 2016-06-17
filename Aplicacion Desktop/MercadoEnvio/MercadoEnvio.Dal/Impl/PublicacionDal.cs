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

            var data = this._db.ExecuteSprocAccessor<Publicacion>("gd_esquema.sp_publicacion_getPublicacionPropiaFiltros", param).ToList();

            return data;
        }
    }
}
