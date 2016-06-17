using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class PublicacionBiz
    {
        private PublicacionDal _publicacionDal;

        public PublicacionBiz()
        {
            this._publicacionDal = new PublicacionDal();
        }

        public List<Publicacion> GetByDesc(string username, string texto)
        {
            return this._publicacionDal.GetByDesc(username, texto);
        }
    }
}
