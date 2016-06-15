using MercadoEnvio.Common.Entity;
using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class RubroBiz
    {
        private RubroDal _rubroDal;

        public RubroBiz()
        {
            this._rubroDal = new RubroDal();
        }

        public List<Rubro> GetByDesc(string texto)
        {
            return this._rubroDal.GetByDesc(texto);
        }
    }
}
