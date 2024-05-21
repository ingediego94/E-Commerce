using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Usuarios
    {
        // con este podemos accedder a los metodos de CD_Usuarios como por ejemplo listar
        private CD_Usuarios objCapaDato = new CD_Usuarios();

        public List <Usuario> Listar()
        {
            return objCapaDato.Listar();
        }

        //REVISAR POR QUE EN LA EJECUCION DEL PROGRAMA NO SE PUEDEN
        //VISUALIZAR LOS DATOS DE LA BASE DE DATOS.
        // CONFIRMAR EL PASO A PASO DE LAS ANTERIORES SESIONES.

    }
}
