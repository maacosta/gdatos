using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class EstCompProd
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string MesAnio { get; set; }
        public decimal CodigoRubro { get; set; }
        public string DescripcionRubro { get; set; }
        public decimal CantidadTotal { get; set; }
    }
}
