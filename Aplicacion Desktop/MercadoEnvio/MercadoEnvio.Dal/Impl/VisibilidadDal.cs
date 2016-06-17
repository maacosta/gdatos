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
    public class VisibilidadDal : BaseDal
    {
        public List<Visibilidad> GetByDesc(string texto)
        {
            object[] param = new object[] { texto };

            var data = this._db.ExecuteSprocAccessor<Visibilidad>("gd_esquema.sp_visibilidad_getVisibilidadFiltros", param).ToList();

            return data;
        }
    }
}
