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
    public class PermisoDal : BaseDal
    {
        public List<Permiso> GetPermisos(int idRol)
        {
            object[] param = new object[] { idRol };

            var data = this._db.ExecuteSprocAccessor<Permiso>("LOS_DE_ADELANTE.sp_permiso_getByRol", param).ToList();

            return data;
        }
    }
}
