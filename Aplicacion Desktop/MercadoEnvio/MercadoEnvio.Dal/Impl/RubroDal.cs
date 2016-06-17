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
    public class RubroDal : BaseDal
    {
        public List<Rubro> GetByDesc(string texto)
        {
            object[] param = new object[] { null, null, texto, texto };

            var data = this._db.ExecuteSprocAccessor<Rubro>("gd_esquema.sp_rubro_getRubroFiltros", param).ToList();

            return data;
        }
    }
}
