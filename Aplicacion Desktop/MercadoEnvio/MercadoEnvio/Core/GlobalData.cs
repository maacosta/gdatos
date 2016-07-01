using MercadoEnvio.Biz.Impl;
using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication1.Core
{
    public class GlobalData
    {
        private static GlobalData _instance;

        public static GlobalData Instance
        {
            get
            {
                if (_instance == null) _instance = new GlobalData();
                return _instance;
            }
        }

        private PermisoFuncionalidad _permisoFunc;
        private Rol _rol;
        private List<Permiso> _permisos;

        private GlobalData()
        {
        }

        public string Username { get; set; }
        public Rol Rol { get { return this._rol; } }
        public List<Permiso> Permisos { get { return this._permisos; } }
        public DateTime FechaSistema { get; set; }

        public void SetRol(Rol rol)
        {
            LoginBiz loginBiz = new LoginBiz();

            this._rol = rol;
            this._permisos = loginBiz.GetPermisos(rol);

            this._permisoFunc = new PermisoFuncionalidad(this._permisos);
        }

        public bool EstaPermitido(TipoFuncionalidad tipoFun)
        {
            return this._permisoFunc.EstaPermitido(tipoFun);
        }
    }
}
