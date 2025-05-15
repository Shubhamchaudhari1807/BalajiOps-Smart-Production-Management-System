using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class ProductController : Controller
    {
        BalajiProductsManagementEntities _db;
        public ProductController()
        {
            _db=new BalajiProductsManagementEntities();
        }
        public ActionResult ProductView()
        {
            return View();
        }
        //public ActionResult ProductReport()
        //{
        //    //var data=_db.SpProduct().ToList();
        //    return View(data);
        //}
        public ActionResult ProductPartial()
        {

            return View();
        }
        public ActionResult SaveOrUpdate(Product product)
        {
            if(product.ProductId==0)
            {
                _db.Entry(product).State = System.Data.Entity.EntityState.Added;
            }
            else 
            {
                _db.Entry(product).State=System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("ProductView");
        }
    }
}