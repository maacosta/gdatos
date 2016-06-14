using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class UsuarioLogin
    {
        public string Username { get; set; }
        public string PassSalt { get; set; }
        public int Intentos { get; set; }
    }
}
