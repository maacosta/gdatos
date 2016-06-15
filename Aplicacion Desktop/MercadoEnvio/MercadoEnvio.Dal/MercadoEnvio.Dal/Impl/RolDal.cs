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
        public List<Rol> GetByUser(int idUser)
        {
            object[] param = new object[] { idUser };

            var data = this._db.ExecuteSprocAccessor<Rol>("spGetRolByUserId", param).ToList();

            return data;
        }


    }
}
