using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class PersonController : Controller
    {
        BalajiProductsManagementEntities _db;
        public PersonController()
        {
            _db=new BalajiProductsManagementEntities();
        }
        public ActionResult PersonView()
        {
            return View();
        }
        public ActionResult PersonReport()
        {
            var data=_db.SpPerson().ToList();
            return View(data);
        }
        public ActionResult PersonPartial()
        {
            return View();
        }
        public ActionResult SaveOrUpdate(Person person)
        {
            if(person.PersonId==0)
            {
                _db.Entry(person).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(person).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            return RedirectToAction("PersonView");
        }
        public ActionResult GetDataById(int id)
        {
            var data = (from x in _db.People.Where(x => x.PersonId == id) select x).FirstOrDefault();
            return View("PersonView", data);
        }
        public ActionResult Delete(int id)
        {
            var data = _db.People.Where(x => x.PersonId == id).FirstOrDefault();
            _db.People.Attach(data);
            _db.People.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("PersonView");
        }
    }
}