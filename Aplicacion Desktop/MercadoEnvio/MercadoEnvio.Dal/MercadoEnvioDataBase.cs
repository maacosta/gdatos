using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Dal
{
    public class MercadoEnvioDataBase
    {
        private static MercadoEnvioDataBase _instance;

        private Database _defaultDB;

        private MercadoEnvioDataBase()
        {
            // Configure the DatabaseFactory to read its configuration from the .config file
            DatabaseProviderFactory factory = new DatabaseProviderFactory();

            // Create the default Database object from the factory.
            // The actual concrete type is determined by the configuration settings.
            this._defaultDB = factory.CreateDefault();
        }

        public Database DataBase { get { return this._defaultDB; } }

        public static MercadoEnvioDataBase Instance()
        {
            if (_instance == null) _instance = new MercadoEnvioDataBase();
            return _instance;
        }
    }
}
