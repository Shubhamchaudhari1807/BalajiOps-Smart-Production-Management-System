using _1_DataContext.DataContext;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class CompanyMaster
    {
        BalajiProductsManagementEntities _db;

        public CompanyMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public void CompanyPartial()
        {
            //return View();
        }
        public void CompanyReport()
        {
            var data = _db.SpCompany().ToList();
            //return View(data);
        }
        public void SaveOrUpdate(Company company)
        {
            if (company.CompanyId == 0)
            {
                _db.Entry(company).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                //_db.Entry(company).State = System.Data.Entity.EntityState.Modified;
            }
            _db.Companies.SaveChanges();
            //return RedirectToAction("CompanyView");
        }

        public void Delete(int id)
        {
            var data = _db.Companies.Where(x => x.CompanyId == id).FirstOrDefault();
            _db.Companies.Attach(data);
            _db.Companies.Remove(data);
            _db.Companies.SaveChanges();
            //return RedirectToAction("CompanyView");
        }
        public void GetDataById(int id)
        {
            var data = (from x in _db.Companies.Where(x => x.CompanyId == id) select x).FirstOrDefault();
            //return View("CompanyView", data);
        }

    }
}
