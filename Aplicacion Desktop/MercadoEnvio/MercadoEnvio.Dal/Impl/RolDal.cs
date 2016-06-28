using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;
using MercadoEnvio.Common.Entity;

namespace MercadoEnvio.Dal.Impl
{
    public class RolDal : BaseDal
    {
        public List<Rol> GetBy(string texto)
        {
            object[] param = new object[] { texto };

            var data = this._db.ExecuteSprocAccessor<Rol>("LOS_DE_ADELANTE.sp_rol_getRolesFiltros", param).ToList();

            return data;
        }

        public List<Rol> GetByUsuario(string username)
        {
            object[] param = new object[] { username };

            var data = this._db.ExecuteSprocAccessor<Rol>("LOS_DE_ADELANTE.sp_rol_getRolesFiltrosUsuario", param).ToList();

            return data;
        }
    }
}
