using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class PublicacionPregunta
    {
        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public string Pregunta { get; set; }
        public string Usuario { get; set; }
    }
}
