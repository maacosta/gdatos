using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace MercadoEnvio.Dal.Impl
{
    public class CompraOfertaDal : BaseDal
    {
        public Oferta GetMaximaOfertaBy(int idPublicacion)
        {
            object[] param = new object[] { idPublicacion };

            var data = this._db.ExecuteSprocAccessor<Oferta>("LOS_DE_ADELANTE.sp_oferta_getMaximaOferta", param).FirstOrDefault();

            return data;
        }

        public List<CompraOfertaHistorial> GetByOpcion(string username, int opcion)
        {
            object[] param = new object[] { username, opcion };

            var data = this._db.ExecuteSprocAccessor<CompraOfertaHistorial>("LOS_DE_ADELANTE.sp_compraoferta_getCompraOfertaFiltrosOpcion", param).ToList();

            return data;
        }

        public Compra InsCompra(int idPublicacion, int? idOferta, DateTime fechaSistema, decimal cantidad, string username)
        {
            object[] param = new object[] { idPublicacion, idOferta, fechaSistema, cantidad, username };

            var data = this._db.ExecuteSprocAccessor<Compra>("LOS_DE_ADELANTE.sp_compra_insCompra", param).First();

            return data;
        }

        public Oferta InsOferta(int idPublicacion, DateTime fechaSistema, decimal monto, string username)
        {
            object[] param = new object[] { idPublicacion, fechaSistema, monto, username };

            var data = this._db.ExecuteSprocAccessor<Oferta>("LOS_DE_ADELANTE.sp_oferta_insOferta", param).First();

            return data;
        }
    }
}
