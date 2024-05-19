using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;                  //Para tener conexion a la CapaEntidad
using System.Data.SqlClient;        // Para poder conectarnos a la BD con sql
using System.Data;                  //Para poder acceder a los datos de la BD

namespace CapaDatos
{
    public class CD_Usuarios
    {

        //Retorna una lista de los usuarios. El metpdo se llama listar.
        // Esta devolviendo una lista de la clase usuario
        public List<Usuario> Listar (){

            List < Usuario > lista = new List<Usuario>();

            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {   
                        //Una consulta que nos traera los siguientes campos de la BD en sql
                    string query = "select IdUsuario, Nombres, Apellidos, Correo, Clave, Reestablecer, Activo from USUARIO";
                        //le decimos que vamos a ejecutar un comando.
                    SqlCommand cmd = new SqlCommand(query, oconexion);
                        // Le especificamos que es solo un comando de tipo texto.
                    cmd.CommandType = CommandType.Text;
                        // Le decimos que la conexion este abierta para que proceda a ejecutar el query
                    oconexion.Open();
                    //Aqui le decimos que podamos leer los datos que provienen de ese select
                    using (SqlDataReader dr = cmd.ExecuteReader() ) 
                    {
                        while (dr.Read())
                        {
                            lista.Add(
                                new Usuario()
                                {   
                                    //Aqui hacemos la conversion al tipo de dato que entiende c#
                                    IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                    Nombres = dr["Nombres"].ToString(),
                                    Apellidos = dr["Apellidos"].ToString(),
                                    Correo = dr["Correo"].ToString(),
                                    Clave = dr["Clave"].ToString(),
                                    Reestablecer = Convert.ToBoolean(dr["Reestablecer"]),
                                    Activo = Convert.ToBoolean(dr["Activo"])
                                }
                                );
                        }
                     }
                }
            }
            catch
            {
                //Si todo el try presenta error, entonces se mostrará una lista nueva vacía.
                lista = new List<Usuario>();    
            }
            return lista;

        }

    }
}
