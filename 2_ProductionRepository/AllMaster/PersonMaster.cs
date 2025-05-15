using _1_DataContext.DataContext;
using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class PersonMaster
    {
        BalajiProductsManagementEntities _db;
        public PersonMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
       
        public void PersonReport()
        {
            var data = _db.SpPerson().ToList();
            //return View(data);
        }
        public void PersonPartial()
        {
            //return View();
        }
        public void SaveOrUpdate(Person person)
        {
            if (person.PersonId == 0)
            {
                _db.Entry(person).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(person).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            //return RedirectToAction("PersonView");
        }
        public void GetDataById(int id)
        {
            var data = (from x in _db.People.Where(x => x.PersonId == id) select x).FirstOrDefault();
            //return View("PersonView", data);
        }
        public void Delete(int id)
        {
            var data = _db.People.Where(x => x.PersonId == id).FirstOrDefault();
            _db.People.Attach(data);
            _db.People.Remove(data);
            _db.SaveChanges();
            //return RedirectToAction("PersonView");
        }
    }
}
