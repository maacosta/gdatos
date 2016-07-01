using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class EstVendProd
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string MesAnio { get; set; }
        public decimal CodigoVisibilidad { get; set; }
        public string DescripcionVisibilidad { get; set; }
        public decimal StockTotal { get; set; }
    }
}
