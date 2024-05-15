using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CapaPresentacionAdmin.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        // Creamos el metodo Usuarios de tipo ActionResult
        public ActionResult Usuarios()
        {
            return View();
        }

    }
}