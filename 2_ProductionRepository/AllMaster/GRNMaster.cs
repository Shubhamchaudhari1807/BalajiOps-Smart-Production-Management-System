using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class GRNMaster
    {
        BalajiProductsManagementEntities _db;
        public GRNMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
       
        public void GRNHeaderPartial()
        {
            //return View();
        }
        public void GRNLinePartial()
        {
            //return View();
        }
        public void GetPONumber()
        {
            var POlist = new List<SelectListItem>();
            POlist.Add(new SelectListItem() { Text = "Please Select PO Number", Value = "0" });

            var getpo = (from x in _db.PurchaseHeaders select new { x.PurchaseHeaderId }).ToList();

            foreach (var item in getpo)
            {
                POlist.Add(new SelectListItem { Text = item.PurchaseHeaderId.ToString(), Value = item.PurchaseHeaderId.ToString() });
            }
            //return POlist;
        }

        public void GetGRNHeaderData(int POId)
        {
            var get_item_name = _db.SpGetHeaderInfo(POId).FirstOrDefault();
            var res = new { PersonName = get_item_name.PersonName, PersonContact = get_item_name.PersonContact, podate = get_item_name.purchase_order_date };
            //return Json(res, JsonRequestBehavior.AllowGet);
        }

        public void GetGRNLineData(int POId)
        {
            var data = _db.SpGRNLineData(POId).ToList();
            //return Json(data, JsonRequestBehavior.AllowGet);
        }
        public void SaveOrUpdate(FormCollection collection)
        {
            //return RedirectToAction("Index");
        }
    }
}
