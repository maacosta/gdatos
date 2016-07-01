using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MercadoEnvio.Common.Entity
{
    public class Publicacion
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string TipoPublicacion { get; set; }
        public string Estado { get; set; }
        public string Descripcion { get; set; }
        public decimal Stock { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public decimal Precio { get; set; }
        public decimal Costo { get; set; }
        public bool PermitirPreguntas { get; set; }
        public bool IncluirEnvio  { get; set; }
        public int IdRubro { get; set; }
        public string CodigoRubro { get; set; }
        public int IdVisibilidad { get; set; }
        public string CodigoVisibilidad { get; set; }
        public string Usuario { get; set; }
    }
}
