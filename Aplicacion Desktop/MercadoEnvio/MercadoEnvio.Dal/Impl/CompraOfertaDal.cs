using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Dal.Impl
{
    public class CompraOfertaDal : BaseDal
    {
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
