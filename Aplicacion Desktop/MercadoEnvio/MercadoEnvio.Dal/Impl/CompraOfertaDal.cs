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
    public class CompraOfertaDal : BaseDal
    {
        public CompraOferta GetMaximaOfertaBy(int idPublicacion)
        {
            object[] param = new object[] { idPublicacion };

            var data = this._db.ExecuteSprocAccessor<CompraOferta>("LOS_DE_ADELANTE.sp_comprarofertar_getMaximaOferta", param).FirstOrDefault();

            return data;
        }

        public void InsCompra(int idPublicacion, DateTime fechaSistema, decimal cantidad, string username)
        {
            object[] param = new object[] { idPublicacion, fechaSistema, cantidad, username };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_comprarofertar_insComprar", param);
        }

        public void InsOferta(int idPublicacion, DateTime fechaSistema, decimal monto, string username)
        {
            object[] param = new object[] { idPublicacion, fechaSistema, monto, username };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_comprarofertar_insOfertar", param);
        }
    }
}
