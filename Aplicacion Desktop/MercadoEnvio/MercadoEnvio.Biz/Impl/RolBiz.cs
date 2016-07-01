using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Biz.Impl
{
    public class RolBiz
    {
        private RolDal _rolDal;

        public RolBiz()
        {
            this._rolDal = new RolDal();
        }

        public List<Rol> GetBy(string texto)
        {
            return this._rolDal.GetBy(texto);
        }

        public List<Rol> GetByUsuario(string username)
        {
            return this._rolDal.GetByUsuario(username);
        }

        public void SetRolesToUsuario(string username, List<Rol> roles)
        {
            this._rolDal.SetRolesToUsuario(username, roles);
        }
    }
}
