﻿using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class CompraOfertaBiz
    {
        private CompraOfertaDal _compraOfertaDal;

        public CompraOfertaBiz()
        {
            this._compraOfertaDal = new CompraOfertaDal();
        }

        public CompraOferta InsCompra(CompraOferta compra)
        {
            return this._compraOfertaDal.InsCompra(
                compra.IdPublicacion,
                compra.Fecha,
                compra.Cantidad,
                compra.Usuario);
        }

        public CompraOferta InsOferta(CompraOferta oferta)
        {
            return this._compraOfertaDal.InsOferta(
                oferta.IdPublicacion,
                oferta.Fecha,
                oferta.Monto,
                oferta.Usuario);
        }
    }
}
