using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Biz.Impl
{
    public class PublicacionCalificacionBiz
    {
        private PublicacionCalificacionDal _publicacionCalificacionDal;

        public PublicacionCalificacionBiz()
        {
            this._publicacionCalificacionDal = new PublicacionCalificacionDal();
        }

        public List<PublicacionCalificacion> GetOpcionBy(string username, int opcion)
        {
            return this._publicacionCalificacionDal.GetOpcionBy(username, opcion);
        }

        public void InsCalificacion(PublicacionCalificacion calificacion)
        {
            this._publicacionCalificacionDal.InsCalificacion(
                calificacion.IdPublicacion,
                calificacion.Calificacion,
                calificacion.Fecha.Value,
                calificacion.Comentario,
                calificacion.Usuario);
        }
    }
}
