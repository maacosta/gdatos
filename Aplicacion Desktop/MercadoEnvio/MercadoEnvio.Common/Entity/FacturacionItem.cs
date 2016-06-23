using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class FacturacionItem
    {
        public int Id { get; set; }
        public int IdFactura { get; set; }
        public int IdCompraOferta { get; set; }
        public decimal Monto { get; set; }
        public decimal Cantidad { get; set; }
    }
}
