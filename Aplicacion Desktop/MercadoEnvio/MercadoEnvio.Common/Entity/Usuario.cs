using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MercadoEnvio.Common.Entity
{
    public class Usuario
    {
        public int Id { get; set; }
		public string Username { get; set; }
        public string PassSalt { get; set; }
        public string Mail { get; set; }
        public string Telefono { get; set; }
        public string Calle { get; set; }
		public decimal? Numero { get; set; }
		public decimal? Piso { get; set; }
        public string Depto { get; set; }
        public string CodigoPostal { get; set; }
        public string Localidad { get; set; }
    }

    public class Cliente : Usuario
    {
        public decimal Dni { get; set; }
        public string TipoDocumento { get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
		public DateTime? FechaNacimiento { get; set; }
        public DateTime FechaCreacion { get; set; }
    }

    public class Empresa : Usuario
    {
        public string Cuit { get; set; }
        public string RazonSocial { get; set; }
        public string Ciudad { get; set; }
        public string NombreContacto { get; set; }
        public string RubroPrincipal { get; set; }
        public DateTime FechaCreacion { get; set; }
    }
}
