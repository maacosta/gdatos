using System;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MercadoEnvio.Dal.Impl;
using MercadoEnvio.Common.FunctionalException;
using MercadoEnvio.Common.Entity;

namespace MercadoEnvio.Biz.Impl
{
    public class VisibilidadBiz
    {
        private VisibilidadDal _visibilidadDal;

        public VisibilidadBiz()
        {
            this._visibilidadDal = new VisibilidadDal();
        }

        public List<Visibilidad> GetByDesc(string texto)
        {
            return this._visibilidadDal.GetByDesc(texto);
        }

    }
}
