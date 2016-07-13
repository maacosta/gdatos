using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class Oferta
    {
        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public string CodigoPublicacion { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Monto { get; set; }
        public string Usuario { get; set; }
    }
}
