using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_Erp_Solution.Controllers
{
    public class PlantController : Controller
    {
        BalajiProductsManagementEntities _db;
        public PlantController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult PlantView()
        {
            ViewBag.CompanyList = Getcompanyname();
            return View();
        }

        public ActionResult PlantPartial()
        {
            return View();
        }
        public ActionResult PlantReport()
        {
            var plantCompanyList = (from p in _db.Plants
                                    join c in _db.Companies on p.ComapnyId equals c.CompanyId
                                    select new PlantViewModel
                                    {
                                        PlantId = p.PlantId,
                                        CompanyName = c.CompanyName,
                                        Capacity = p.Capacity,
                                        PlantName = p.PlantName,
                                        PlantAddress = p.PlantAddress
                                    }).ToList();

            return View(plantCompanyList);
        }
        public ActionResult SaveOrUpdate(Plant plant)
        {
            if(plant.PlantId==0) 
            {
                _db.Entry(plant).State = System.Data.Entity.EntityState.Added;
            }
            else 
            {
                _db.Entry(plant).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();
            
            return RedirectToAction("PlantView");
        }

        

        public ActionResult GetById(int id)
        {
            var data = (from x in _db.Plants.Where(x => x.PlantId == id) select x).FirstOrDefault();
            return View("PlantView", data);
        }
        public ActionResult Delete(int id)
        {
            var data=(from x in _db.Plants.Where(x=>x.PlantId==id) select x).FirstOrDefault();
            _db.Plants.Attach(data);
            _db.Plants.Remove(data);
            _db.SaveChanges();
            return RedirectToAction("PlantView");
        }
        public List<SelectListItem> Getcompanyname()
        {
            var companylist = new List<SelectListItem>();
            companylist.Add(new SelectListItem() { Text = "Please Select Company Name", Value = "0" });

            var companyname = (from x in _db.Companies select new { x.CompanyId, x.CompanyName }).ToList();

            foreach (var item in companyname)
            {
                companylist.Add(new SelectListItem { Text = item.CompanyName.ToString(), Value = item.CompanyId.ToString() });
            }
            return companylist;
        }
        public ActionResult GetDataById(int id)
        {
            var data = (from x in _db.Plants.Where(x => x.PlantId == id) select x).FirstOrDefault();
            //var companyNames = _db.Companies.ToList();

            //var viewModel = new PlantCompanyCombineData
            //{
            //    PlantData = data,
            //    CompanyNames = companyNames
            //};
            ViewBag.CompanyList = Getcompanyname();
            return View("PlantView",data);
        }
        
    }
}