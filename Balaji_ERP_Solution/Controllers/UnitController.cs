using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class UnitController : Controller
    {
        BalajiProductsManagementEntities _db;
        public UnitController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult UnitView()
        {
            return View();
        }
        public ActionResult UnitPartial() 
        {
            return View();
        }
        public ActionResult UnitReport() 
        {
            var data = _db.SpUnit().ToList();
            return View(data);
        }
        public ActionResult SaveOrUpdate(Unit unit) 
        {
            if(unit.UnitId == 0)
            {
                _db.Entry(unit).State = System.Data.Entity.EntityState.Added;
            }
            else 
            {
                _db.Entry(unit).State=System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("UnitView");
        }
        public ActionResult Edit(int id)
        {
            var data=_db.Units.Where(x=>x.UnitId == id).FirstOrDefault();
            return View("UnitView", data);
        }
        public ActionResult Delete(int id)
        {
            var data=_db.Units.Where(x=>x.UnitId == id).FirstOrDefault();
            return View("UnitView",data);
        }
    }
}