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
        public void InsFacturacion(int idPublicacion, DateTime fechaSistema, decimal cantidad, string username)
        {
            object[] param = new object[] { idPublicacion, fechaSistema, cantidad, username };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_comprarofertar_insComprar", param);
        }
    }
}
