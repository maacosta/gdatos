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
    public class UsuarioDal : BaseDal
    {
        public UsuarioLogin GetLoginData(string username)
        {
            object[] param = new object[] { username };

            var data = this._db.ExecuteSprocAccessor<UsuarioLogin>("gd_esquema.sp_usuario_getLoginData", param).FirstOrDefault();

            return data;
        }

        public void SetFechaBaja(string username)
        {
            object[] param = new object[] { username };

            this._db.ExecuteSprocAccessor<UsuarioLogin>("gd_esquema.sp_usuario_setFechaBaja", param);
        }

        public List<Rol> Autenticar(string username, string passHashed)
        {
            object[] param = new object[] { username, passHashed };

            var data = this._db.ExecuteSprocAccessor<Rol>("gd_esquema.sp_usuario_login", param).ToList();

            return data;
        }
    }
}
