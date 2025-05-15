using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Balaji_ERP_Solution.Controllers
{
    public class LoginController : Controller
    {
        BalajiProductsManagementEntities _db;
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session["session_user_id"] = null;
            Session["session_user_name"] = null;

            return RedirectToAction("Index", "Login");
        }
        public ActionResult LoginAuthandication(LoginModel model)
        {


            using (_db = new BalajiProductsManagementEntities())
            {
                var authandication = new userTable();
                authandication = _db.userTables.Where(x => x.UserEmail == model.UserEmail && x.UserPass == model.UserPass).FirstOrDefault();
                if (authandication != null)
                {


                    Session.Add("session_user_id", authandication.userid);
                    Session.Add("session_user_name", authandication.UserEmail);


                    FormsAuthentication.SetAuthCookie(authandication.UserEmail, false);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    TempData["Error"] = "Please check user name and password..";
                    return RedirectToAction("Index");
                }
            }
        }
    }
}