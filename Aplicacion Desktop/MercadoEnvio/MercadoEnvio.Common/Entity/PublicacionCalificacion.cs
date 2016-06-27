using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class PublicacionCalificacion
    {
        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public string CodigoPublicacion { get; set; }
        public DateTime? Fecha { get; set; }
        public int Calificacion { get; set; }
        public string Comentario { get; set; }
        public string Usuario { get; set; }
    }
}
