using _1_DataContext.DataContext;
using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class TaxMaster
    {
        BalajiProductsManagementEntities _db;
        public TaxMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
       
        public void TaxPartial()
        {
            //return View();
        }
        public void TaxReport()
        {
            var data = _db.SpTax().ToList();
            //return View(data);
        }

        public void SaveOrUpdate(Tax tax)
        {
            if (tax.TaxId == 0)
            {
                _db.Entry(tax).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(tax).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            //return RedirectToAction("TaxView");
        }
        public void GetDataById(int id)
        {
            var data = (from x in _db.Taxes.Where(x => x.TaxId == id) select x).FirstOrDefault();
            //return View("TaxView", data);
        }
        public void Delete(int id)
        {
            var data = _db.Taxes.Where(x => x.TaxId == id).FirstOrDefault();
            _db.Taxes.Attach(data);
            _db.Taxes.Remove(data);
            _db.SaveChanges();
            //return RedirectToAction("TaxView");
        }
        public void GetTaxName()
        {
            var TaxList = new List<SelectListItem>();
            TaxList.Add(new SelectListItem() { Text = "Please Select Tax", Value = "0" });

            var Taxname = (from x in _db.Taxes select new { x.TaxId, x.TaxName }).ToList();

            foreach (var item in Taxname)
            {
                TaxList.Add(new SelectListItem { Text = item.TaxName.ToString(), Value = item.TaxId.ToString() });
            }
            //return TaxList;
        }
    }
}
