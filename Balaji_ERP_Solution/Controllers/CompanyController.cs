using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class CompanyController : Controller
    {
        BalajiProductsManagementEntities _db;//globally declare connectionstring class's object
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
        public CompanyController()
        {
            _db= new BalajiProductsManagementEntities();
        }
        public ActionResult CompanyView()
        {
            if (IsSesioonValid())
            {
                return View();
            }
            else
            {
                return RedirectToAction("index", "Login");
            }
        }
        public ActionResult CompanyPartial()
        {
            return View();
        }
        public ActionResult CompanyReport()
        {
            var data = _db.SpCompany().ToList();
            return View(data);
        }


    public ActionResult SaveOrUpdate(Company company)
    {
            //string CompanyLogoName = Path.GetFileNameWithoutExtension(company.CompanyLogoImage.FileName);
            //string CompanyLogoExtension = Path.GetExtension(company.CompanyLogoImage.FileName);
            //CompanyLogoName = CompanyLogoName + DateTime.Now.ToString("yymmssfff") + CompanyLogoExtension;
            //company.CompanyLogo = "~/SaveImage/" + CompanyLogoName;
            //CompanyLogoName = Path.Combine(Server.MapPath("~/SaveImage/"), CompanyLogoName);
            //company.CompanyLogoImage.SaveAs(CompanyLogoName);

            if (company.CompanyId == 0)
            {
                _db.Entry(company).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(company).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();

            return RedirectToAction("CompanyView");
    }

    public ActionResult Delete(int id)
        {
            var data=_db.Companies.Where(x=>x.CompanyId == id).FirstOrDefault();
            _db.Companies.Attach(data);
            _db.Companies.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("CompanyView");
        }
        public ActionResult GetDataById(int id) 
        {
            var data = (from x in _db.Companies.Where(x => x.CompanyId == id) select x).FirstOrDefault();
            return View("CompanyView",data);
        }
       
    }
}