using MercadoEnvio.Common.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApplication1.Core
{
    public class GlobalData
    {
        private static GlobalData _instance;

        public static GlobalData Instance
        {
            get
            {
                if (_instance == null) _instance = new GlobalData();
                return _instance;
            }
        }

        private GlobalData()
        { }

        public string Username { get; set; }
        public Rol Rol { get; set; }
        public List<Permiso> Permisos { get; set; }
        public DateTime FechaSistema { get; set; }
    }
}
