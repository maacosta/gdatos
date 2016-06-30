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
        private PublicacionDal _publicacionDal;

        public FacturacionBiz()
        {
            this._facturacionDal = new FacturacionDal();
            this._compraOfertaDal = new CompraOfertaDal();
            this._publicacionDal = new PublicacionDal();
        }

        public List<Facturacion> GetBy(DateTime? fechaDesde, DateTime? fechaHasta, decimal? montoDesde, decimal? montoHasta, string textoDetalle, string usuarioComprador, string usuario)
        {
            return this._facturacionDal.GetBy(fechaDesde, fechaHasta, montoDesde, montoHasta, textoDetalle, usuarioComprador, usuario);
        }

        public Facturacion GenerarFacturacion(Publicacion publicacion, CompraOferta compraOferta, DateTime fechaSistema)
        {
            return this._facturacionDal.InsFacturacion(publicacion.Id, compraOferta.Id, fechaSistema);
        }

        public int GenerarFacturacionSubasta(List<Publicacion> publicacionList, DateTime fechaSistema, string estadoFinalizado)
        {
            int cantFact = 0;
            foreach (Publicacion p in publicacionList)
            {
                var oferta = this._compraOfertaDal.GetMaximaOfertaBy(p.Id);
                if (oferta != null)
                {
                    this.GenerarFacturacion(p, oferta, fechaSistema);
                    this._publicacionDal.UpdPublicacionEstado(p.Id, estadoFinalizado);
                    cantFact++;
                }
                else
                {
                    this._publicacionDal.UpdPublicacionEstado(p.Id, estadoFinalizado);
                }
            }
            return cantFact;
        }
    }
}
