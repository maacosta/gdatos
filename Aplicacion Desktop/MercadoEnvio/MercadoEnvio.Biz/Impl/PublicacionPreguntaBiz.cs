using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class PublicacionPreguntaBiz
    {
        private PublicacionPreguntaDal _publicacionPreguntaDal;

        public PublicacionPreguntaBiz()
        {
            this._publicacionPreguntaDal = new PublicacionPreguntaDal();
        }

        public void InsPregunta(PublicacionPregunta publicacionPregunta)
        {
            this._publicacionPreguntaDal.InsPregunta(publicacionPregunta.IdPublicacion, publicacionPregunta.Pregunta, publicacionPregunta.Usuario);
        }
    }
}
