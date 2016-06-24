using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Dal.Impl
{
    public class FacturacionDal : BaseDal
    {
        public void InsFacturacion(int idPublicacion, int idCompraOferta, DateTime fechaSistema)
        {
            object[] param = new object[] { idPublicacion, idCompraOferta, fechaSistema };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_factura_insFactura", param);
        }
    }
}
