using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class EstadisticoBiz
    {
        private UsuarioDal _usuarioDal;

        public EstadisticoBiz()
        {
            this._usuarioDal = new UsuarioDal();
        }

        public List<EstVendProd> GetVendedoresProductosBy(int anio, int trimestre)
        {
            return this._usuarioDal.GetVendedoresProductosBy(anio, trimestre);
        }

        public List<EstCompProd> GetClientesProductosBy(int anio, int trimestre)
        {
            return this._usuarioDal.GetClientesProductosBy(anio, trimestre);
        }

        public List<EstVendFact> GetVendedoresFacturasBy(int anio, int trimestre)
        {
            return this._usuarioDal.GetVendedoresFacturasBy(anio, trimestre);
        }

        public List<EstVendMontoFact> GetVendedoresMontoFacturadoBy(int anio, int trimestre)
        {
            return this._usuarioDal.GetVendedoresMontoFacturadoBy(anio, trimestre);
        }
    }
}
