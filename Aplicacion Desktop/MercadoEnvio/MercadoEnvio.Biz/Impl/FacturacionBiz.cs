using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class FacturacionBiz
    {
        private FacturacionDal _facturacionDal;
        private CompraOfertaDal _compraOfertaDal;

        public FacturacionBiz()
        {
            this._facturacionDal = new FacturacionDal();
            this._compraOfertaDal = new CompraOfertaDal();
        }

        public void GenerarFacturacion(Publicacion publicacion, CompraOferta compraOferta)
        {
            Facturacion factura = new Facturacion();

        }

        public int GenerarFacturacionSubasta(List<Publicacion> publicacionList)
        {
            int cantFact = 0;
            foreach (Publicacion p in publicacionList)
            {
                var oferta = this._compraOfertaDal.GetMaximaOfertaBy(p.Id);
                this.GenerarFacturacion(p, oferta);
                cantFact++;
            }
            return cantFact;
        }
    }
}
