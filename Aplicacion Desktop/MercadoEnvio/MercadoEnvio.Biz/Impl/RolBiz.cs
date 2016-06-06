using MercadoEnvio.Dal.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Biz.Impl
{
    public class RolBiz
    {
        private RolDal _rolDal;

        public RolBiz()
        {
            this._rolDal = new RolDal();
        }
    }
}
