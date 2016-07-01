using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Dal.Core
{
    public abstract class BaseDal
    {
        protected Database _db;

        public BaseDal()
        {
            this._db = MercadoEnvioDataBase.Instance().DataBase;
        }
    }
}
