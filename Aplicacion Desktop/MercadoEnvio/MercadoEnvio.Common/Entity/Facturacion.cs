using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class Facturacion
    {
        public Facturacion()
        {
            this.Items = new List<FacturacionItem>();
        }

        public int Id { get; set; }
        public int IdFormaPago { get; set; }
        public string FormaPago { get; set; }
        public decimal Numero { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Total { get; set; }
        public string Usuario { get; set; }
        public List<FacturacionItem> Items { get; set; }
    }
}
