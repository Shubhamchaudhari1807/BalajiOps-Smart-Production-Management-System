using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class PackingController : Controller
    {
        BalajiProductsManagementEntities _db;
        public PackingController()
        {
            _db=new BalajiProductsManagementEntities();
        }
        public ActionResult PackingView()
        {
            return View();
        }
        public ActionResult PackingPartial()
        {
            return View();
        }
        public ActionResult PackingReport() 
        {
            var data=_db.SpPacking().ToList();
            return View(data);
        }
        public ActionResult SaveOrUpdate(Packing packing)
        {
            if(packing.PackingId == 0)
            {
                _db.Entry(packing).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(packing).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("PackingView");
        }
        public ActionResult Edit(int id)
        {
            var data = (from x in _db.Packings.Where(x => x.PackingId == id) select x).FirstOrDefault();
            return View("PackingView",data);
        }
        public ActionResult Delete(int id) 
        {
            var data = _db.Packings.Where(x => x.PackingId == id).FirstOrDefault();
            _db.Packings.Attach(data);
            _db.Packings.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("PackingView");
        }
    }
}