using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
        //IdCliente int primary key identity,
        //Nombres varchar(100),
        //Apellidos varchar(100),
        //Correo varchar(150),
        //Clave varchar(150),
        //Restablecer bit default 0,	/*Usado para restablecer contrasena*/
        //FechaRegistro datetime default getdate()
    public  class Cliente
    {
        public int IdCliente { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }
        public bool Restablecer { get; set; }

    }
}
