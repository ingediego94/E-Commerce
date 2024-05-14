using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    //CREATE TABLE PRODUCTO(
    //IdProducto int primary key identity,
    //Nombre varchar(500),
    //Descripcion varchar(500),
    //IdMarca int references Marca(IdMarca), /*Establece una relacion con el campo en cuestion*/
    //IdCategoria int references Categoria(IdCategoria),
    //Precio decimal (10,2) default 0,   /*Un campo decimal de 10 digitos y precision de 2 decimales*/
    //Stock int,
    //RutaImagen varchar(100), /*Ruta donde se alojara la imagen*/
    //NombreImagen varchar(100),
    //Activo bit default 1,
    //FechaRegistro datetime default getdate()

    public class Producto
    {
        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Marca oMarca { get; set; } //se referencia a la clase Marca. el oMarca es un objeto de marca
        public Marca oCategoria { get; set; }  //se referencia a la clase Categoria. el oCatergoria es un objeto de Categoria
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public string RutaImagen { get; set; }
        public string NombreImagen { get; set; }
        public bool Activo { get; set; }

    }
}
