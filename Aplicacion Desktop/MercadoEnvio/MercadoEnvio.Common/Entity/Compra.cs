using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class Compra
    {
        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public int? IdOferta { get; set; }
        public string CodigoPublicacion { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Cantidad { get; set; }
        public string Usuario { get; set; }
    }
}
