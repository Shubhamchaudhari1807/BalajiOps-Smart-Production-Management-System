using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class HomeController : Controller
    {
        #region
        private int session_user_id = 0;

        private string session_user_name = "";
        #endregion
        public Boolean IsSesioonValid()
        {

            if (Session["session_user_name"] != null && Session["session_user_id"] != null)
            {

                session_user_id = Convert.ToInt32(Session["session_client_id"]);
                session_user_name = Session["session_user_name"].ToString();

                return true;
            }
            else
            {
                return false;
            }
        }
        public ActionResult Index()
        {
            if (IsSesioonValid())
            {
                TempData["session_user_name"] = session_user_name;
                return View();
            }
            else
            {
                return RedirectToAction("index", "Login");
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}