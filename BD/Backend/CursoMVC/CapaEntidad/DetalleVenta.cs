using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    //IdDetalleVenta int primary key identity,
    //IdVenta int references Venta(IdVenta),
    //IdProducto int references PRODUCTO(IdProducto),
    //Cantidad int,
    //Total decimal (10,2)
    public class DetalleVenta
    {
        public int IdDetalleVenta { get; set; }

        //Es muy probable que nos toque cambiar a este:
        //public Venta oVenta { get; set; }
        public int IdVenta { get; set; }
        public Producto oProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal Total { get; set; }

        // Aunque este no estaba en la BD, lo agregamos aqui porque es el id de la transaccion
        public string IdTransaccion { get; set; }

    }
}
