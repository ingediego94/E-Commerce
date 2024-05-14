using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    //IdDepartamento varchar(2) NOT NULL,
    //Descripcion varchar(45) NOT NULL
    public class Departamento
    {
        //Puede que nos toque cambiar este a:
        //  public string IdDepartamento { get; set; }
        public int IdDepartamento { get; set; }
        public string Descripcion { get; set; }
    }
}
