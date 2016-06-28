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

            var data = this._db.ExecuteSprocAccessor<UsuarioLogin>("LOS_DE_ADELANTE.sp_usuario_getLoginData", param).FirstOrDefault();

            return data;
        }

        public List<Cliente> GetByCliente(string nombre, string apellido, decimal dni, string email)
        {
            object[] param = new object[] { nombre, apellido, dni, email };

            var data = this._db.ExecuteSprocAccessor<Cliente>("LOS_DE_ADELANTE.sp_usuario_getClienteFiltros", param).ToList();

            return data;
        }

        public List<Empresa> GetByEmpresa(string razonSocial, string cuit, string email)
        {
            object[] param = new object[] { razonSocial, cuit, email };

            var data = this._db.ExecuteSprocAccessor<Empresa>("LOS_DE_ADELANTE.sp_usuario_getEmpresaFiltros", param).ToList();

            return data;
        }

        public void SetFechaBaja(string username, DateTime fechaSistema)
        {
            object[] param = new object[] { username, fechaSistema };

            this._db.ExecuteSprocAccessor<UsuarioLogin>("LOS_DE_ADELANTE.sp_usuario_setFechaBaja", param);
        }

        public List<Rol> Autenticar(string username, string passHashed)
        {
            object[] param = new object[] { username, passHashed };

            var data = this._db.ExecuteSprocAccessor<Rol>("LOS_DE_ADELANTE.sp_usuario_login", param).ToList();

            return data;
        }
    }
}
