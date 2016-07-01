using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace MercadoEnvio.Dal.Impl
{
    public class PublicacionCalificacionDal : BaseDal
    {
        public List<PublicacionCalificacion> GetOpcionBy(string username, int opcion)
        {
            object[] param = new object[] { username, opcion };

            var data = this._db.ExecuteSprocAccessor<PublicacionCalificacion>("LOS_DE_ADELANTE.sp_publicacioncalificacion_getCalificacionFiltros", param).ToList();

            return data;
        }

        public void InsCalificacion(int idPublicacion, int calificacion, DateTime fecha, string comentario, string username)
        {
            object[] param = new object[] { idPublicacion, calificacion, fecha, comentario, username };

            this._db.ExecuteNonQuery("LOS_DE_ADELANTE.sp_publicacioncalificacion_insCalificacion", param);
        }
    }
}
