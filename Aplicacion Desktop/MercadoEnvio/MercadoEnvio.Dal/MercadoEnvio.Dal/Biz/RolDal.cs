using MercadoEnvio.Dal.Core;
using MercadoEnvio.Dal.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace MercadoEnvio.Dal.Biz
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
