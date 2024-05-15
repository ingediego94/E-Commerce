using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CapaPresentacionAdmin.Controllers
{
    public class MantenedorController : Controller
    {
        // GET: Mantenedor
            //Categoria
        public ActionResult Categoria()  // Cambiamos Index por Categoria para que nos
                                       // muestre categorias, no Index
        {
            return View();
        }
        //Marca
        public ActionResult Marca()  // Cambiamos Index por Marca
        {
            return View();
        }
        //Producto
        public ActionResult Producto()  // Cambiamos Index por Producto 
        {
            return View();
        }
    }
}