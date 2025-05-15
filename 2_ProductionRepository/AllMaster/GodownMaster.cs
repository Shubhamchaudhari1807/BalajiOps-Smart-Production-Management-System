using _1_DataContext.DataContext;
using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class GodownMaster
    {
        BalajiProductsManagementEntities _db;
        public GodownMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public void GodownPartial()
        {
            //return View();
        }
        public void GodownReport()
        {
            var data = _db.SpGodown().ToList();
            //return View(data);
        }
        public void SaveOrUpdate(Godown godown)
        {
            if (godown.GodownId == 0)
            {
                _db.Entry(godown).State = System.Data.Entity.EntityState.Added;
            }
            else
            {
                _db.Entry(godown).State = System.Data.Entity.EntityState.Modified;
            }
            _db.SaveChanges();

            //return RedirectToAction("GodownView");
        }
        public void GetPlant(int companyId)
        {
            var _selectList = new List<SelectListItem>();
            _selectList.Add(new SelectListItem { Value = "0", Text = "---Select---" });
            var get_plant_name = (dynamic)null;

            get_plant_name = (from x in _db.Plants.Where(x => x.ComapnyId == companyId)
                              select new
                              {
                                  x.PlantId,
                                  x.PlantName
                              });
            foreach (var item in get_plant_name)
            {
                _selectList.Add(new SelectListItem { Value = item.PlantId.ToString(), Text = item.PlantName.ToString() });
            }
            //return Json(_selectList, JsonRequestBehavior.AllowGet);
        }
        public void Getcompanyname()
        {
            var companyList = new List<SelectListItem>();
            companyList.Add(new SelectListItem() { Text = "Please Select Company Name", Value = "0" });

            var companyName = (from x in _db.Companies select new { x.CompanyId, x.CompanyName }).ToList();

            foreach (var item in companyName)
            {
                companyList.Add(new SelectListItem { Text = item.CompanyName.ToString(), Value = item.CompanyId.ToString() });
            }
            //return companyList;
        }
        private void GetPlantForGodowns(List<int?> godownPlantIds)
        {
            var plantList = new List<SelectListItem>();

            try
            {
                plantList.Add(new SelectListItem { Value = "0", Text = "---Select---" });

                var getPlantsQuery = from p in _db.Plants
                                     join g in _db.Godowns on p.PlantId equals g.PlantId
                                     where godownPlantIds.Any(id => id == p.PlantId)
                                     select new SelectListItem
                                     {
                                         Value = p.PlantId.ToString(),
                                         Text = p.PlantName
                                     };

                plantList.AddRange(getPlantsQuery);
            }
            catch (Exception ex)
            {
                plantList.Add(new SelectListItem { Value = "0", Text = "Error loading plants: " + ex.Message });
            }

            //return plantList;
        }
        public void Delete(int id)
        {
            var data = _db.Godowns.Where(x => x.GodownId == id).FirstOrDefault();
            _db.Godowns.Attach(data);
            _db.Godowns.Remove(data);
            _db.SaveChanges();
            //return RedirectToAction("GodownView");
        }
        public void GetDataById(int id)
        {
            var data = (from x in _db.Godowns.Where(x => x.GodownId == id) select x).FirstOrDefault();
            ViewBag.CompanyList = Getcompanyname();
            var godownPlantIds = _db.Godowns
                           .Where(g => g.GodownId == id)
                           .Select(g => g.PlantId)
                           .ToList();
            ViewBag.PlantList = GetPlantForGodowns(godownPlantIds);
            //return View("GodownView", data);
        }

    }
}
