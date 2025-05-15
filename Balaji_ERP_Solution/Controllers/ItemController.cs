using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class ItemController : Controller
    {
        BalajiProductsManagementEntities _db;
        public ItemController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult ItemView()
        {
            ViewBag.ProductList = Getproductname();
            return View();
        }
        public ActionResult ItemPartial() 
        {
            ViewBag.ProductList = Getproductname();
            return View();
        }
        public ActionResult ItemReport() 
        {
            var data=_db.SpItem().ToList();
            return View(data);
        }
        public ActionResult SaveOrUpdate(Item item)
        {
            if (item.ItemId == 0)
            {
                _db.Entry(item).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("ItemView");
        }
        public ActionResult Delete(int id)
        {
            var data = _db.Items.Where(x => x.ItemId == id).FirstOrDefault();
            _db.Items.Attach(data);
            _db.Items.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("ItemView");
        }
        public ActionResult GetDataById(int id)
        {
            var data = (from x in _db.Items.Where(x => x.ItemId == id) select x).FirstOrDefault();
            return View("ItemView", data);
        }
        public List<SelectListItem> Getproductname()
        {
            var productlist = new List<SelectListItem>();
            productlist.Add(new SelectListItem() { Text = "Please Select Product Name", Value = "0" });

            var productname = (from x in _db.Products select new { x.ProductId, x.ProductName }).ToList();

            foreach (var item in productname)
            {
                productlist.Add(new SelectListItem { Text = item.ProductName.ToString(), Value = item.ProductId.ToString() });
            }
            return productlist;
        }
    }
}