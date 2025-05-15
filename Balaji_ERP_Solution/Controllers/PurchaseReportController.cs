using Balaji_ERP_Solution.DataContext;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace Balaji_ERP_Solution.Controllers
{
    public class PurchaseReportController : Controller
    {
        BalajiProductsManagementEntities _db;
        public PurchaseReportController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult AllPurchase()
        {
            var data=_db.SpAllPurchase().ToList();
            return View(data);
        }
        public ActionResult PurchaseReports()
        {
            ViewBag.SupplierList = GetSupplier();
            var data = _db.SpAllPurchase().ToList();
            return View();
        }
        public List<SelectListItem> GetSupplier()
        {
            var supplierlist = new List<SelectListItem>();
            supplierlist.Add(new SelectListItem() { Text = "All Supplier Name", Value = "0" });

            var suppliername = (from x in _db.People select new { x.PersonId, x.PersonName }).ToList();

            foreach (var item in suppliername)
            {
                supplierlist.Add(new SelectListItem { Text = item.PersonName.ToString(), Value = item.PersonId.ToString() });
            }
            return supplierlist;
        }
        
        public JsonResult Datewise(string fromdate,string todate) 
        {
            var data = _db.SpDatewise(fromdate, todate).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SupplierWise(int supplierId)
        {

             var data= _db.SpSupplierWise(supplierId).ToList();

            return Json(data,JsonRequestBehavior.AllowGet);
        }
        public JsonResult SupplierwiseandDatewise(int supplierId,string fromDate,string toDate)
        {
            var data = _db.SpSupplierwiseDatewise(supplierId, fromDate, toDate).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public List<SpProductWiseDateWise_Result> ProductwiseDatewise(int productId, string fromDate, string toDate)
        {
            return _db.SpProductWiseDateWise(productId, fromDate, toDate).ToList();
        }
        public List<SpItemWiseDateWise_Result> ItemwiseDatewise(int itemId,string fromDate,string toDate)
        {
            return _db.SpItemWiseDateWise(itemId,fromDate,toDate).ToList();
        }
    }
}