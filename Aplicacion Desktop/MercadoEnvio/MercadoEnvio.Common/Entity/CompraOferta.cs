using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class CompraOferta
    {
        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public string CodigoPublicacion { get; set; }
        public string Tipo { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Monto { get; set; }
        public string Usuario { get; set; }
    }
}
