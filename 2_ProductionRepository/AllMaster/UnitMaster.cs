using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class UnitMaster
    {
        BalajiProductsManagementEntities _db;
        public UnitMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
       
        public void UnitPartial()
        {
            //return View();
        }
        public void UnitReport()
        {
            var data = _db.SpUnit().ToList();
            //return View(data);
        }
        public void SaveOrUpdate(UnitMaster unit)
        {
            if (unit.UnitId == 0)
            {
                _db.Entry(unit).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(unit).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            //return RedirectToAction("UnitView");
        }
        public void Edit(int id)
        {
            var data = _db.Units.Where(x => x.UnitId == id).FirstOrDefault();
            //return View("UnitView", data);
        }
        public ActionResult Delete(int id)
        {
            var data = _db.Units.Where(x => x.UnitId == id).FirstOrDefault();
            return View("UnitView", data);
        }
    }
}
