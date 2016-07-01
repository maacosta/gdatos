using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication1.Core
{
    public enum TipoPublicacion
    {
        Compra_Inmediata = 'C',
        Subasta = 'S'
    }

    public enum TipoCompraOferta
    {
        Compra = 'C',
        Oferta = 'O'
    }

    public enum Estado
    {
        Borrador = 'B',
        Activa = 'A',
        Pausada = 'P',
        Finalizada = 'F'
    }
}
