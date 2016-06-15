using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApplication1.Core
{
    public enum TipoFuncionalidad
    {
        Rol_V = 1,
        Rol_M,
        Usuario_ABM,
        Rubro_V,
        Visibilidad_V,
        Publicacion_V,
        Publicacipn_ABM,
        ComprarOfertar_V,
        ComprarOfertar_ABM,
        HistorialCliente_V,
        CalificacionVendedor_A,
        ConsultaFacturas_V,
        ListadoEstadistico_V
    }

    public class PermisoFuncionalidad
    {
        private List<Permiso> _permisos;

        public PermisoFuncionalidad(List<Permiso> permisos)
        {
            this._permisos = permisos;
        }

        public bool EstaPermitido(TipoFuncionalidad tipoFun)
        {
            return this._permisos.Exists(p => p.Id == (int)tipoFun);
        }
    }
}
