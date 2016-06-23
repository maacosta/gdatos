using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Dal.Impl
{
    public class PublicacionPreguntaDal : BaseDal
    {
        public void InsPregunta(int idPublicacion, string pregunta, string username)
        {
            object[] param = new object[] { idPublicacion, pregunta, username };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_publicacionpregunta_insPregunta", param);
        }
    }
}
