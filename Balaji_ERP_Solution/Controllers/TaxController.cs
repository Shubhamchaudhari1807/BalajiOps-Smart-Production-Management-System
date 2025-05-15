using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class TaxController : Controller
    {
        BalajiProductsManagementEntities _db;
        public TaxController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult TaxView()
        {
            return View();
        }
        public ActionResult TaxPartial()
        {
            ViewBag.TaxList= GetTaxName();
            return View();
        }
        public ActionResult TaxReport()
        {
            var data=_db.SpTax().ToList();
            return View(data);
        }
       
        public ActionResult SaveOrUpdate(Tax tax)
        {
            if(tax.TaxId==0)
            {
                _db.Entry(tax).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(tax).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("TaxView");
        }
        public ActionResult GetDataById(int id)
        {
            var data=(from x in _db.Taxes.Where(x=>x.TaxId==id)select x).FirstOrDefault();
            return View("TaxView",data);
        }
        public ActionResult Delete(int id) 
        {
            var data=_db.Taxes.Where(x=>x.TaxId==id).FirstOrDefault();
            _db.Taxes.Attach(data);
            _db.Taxes.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("TaxView");
        }
        public List<SelectListItem> GetTaxName()
        {
            var TaxList = new List<SelectListItem>();
            TaxList.Add(new SelectListItem() { Text = "Please Select Tax", Value = "0" });

            var Taxname = (from x in _db.Taxes select new { x.TaxId, x.TaxName }).ToList();

            foreach (var item in Taxname)
            {
                TaxList.Add(new SelectListItem { Text = item.TaxName.ToString(), Value = item.TaxId.ToString() });
            }
            return TaxList;
        }
    }
}