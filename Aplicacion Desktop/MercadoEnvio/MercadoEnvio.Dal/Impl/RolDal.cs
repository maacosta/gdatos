﻿using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        public void SetRolesToUsuario(string username, List<Rol> roles)
        {
            object[] param = new object[] { username, string.Join(", ", roles.Select(i => i.Id.ToString()).ToArray<string>()) };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_rol_setRolesToUsuario", param);
        }
    }
}
