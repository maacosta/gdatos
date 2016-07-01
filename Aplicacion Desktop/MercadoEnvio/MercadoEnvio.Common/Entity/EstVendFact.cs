using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class EstVendFact
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string MesAnio { get; set; }
        public decimal CantidadFacturas { get; set; }
    }
}
