using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class ProductionController : Controller
    {
        BalajiProductsManagementEntities _db;
        public ProductionController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult Index()
        {
            ViewBag.FormulationList = GetAllFormulation();
            ProductionHeader productionHeader = new ProductionHeader();
            var Lines = new List<ProductionLine>();
            ProductionHeaderLine model = new ProductionHeaderLine()
            {
                productionHeader = productionHeader,
                productionLine = Lines
            };
            return View(model);
        }
        public ActionResult ProductionHeaderPartial()
        {
            return View();
        }
        public ActionResult ProductionLinePartial()
        {
            return View();
        }
        public ActionResult SaveOrUpdate(FormCollection collection)
        {
            int HeaderId = 0;
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    if (Convert.ToInt32(collection.Get("ProductionHeaderId")) == 0)
                    {
                        ProductionHeader productionHeader = new ProductionHeader()
                        {
                            FormulationHeaderId = Convert.ToInt32(collection.Get("FormulationHeaderId")),
                            ProductionDate = Convert.ToDateTime(collection.Get("ProductionDate")),
                            Quantity = Convert.ToDecimal(collection.Get("Quantity")),
                            ActualQty = Convert.ToDecimal(collection.Get("ActualQty")),
                            LossQty = Convert.ToDecimal(collection.Get("LossQty")),
                        };
                        _db.Entry(productionHeader).State = System.Data.Entity.EntityState.Added;
                        _db.SaveChanges();
                        HeaderId = productionHeader.ProductionHeaderId;
                    }
                    string[] ProductId = collection.Get("item.ProductId").Split(',');
                    string[] ItemId = collection.Get("item.ItemId").Split(',');
                    string[] ItemQty = collection.Get("item.ItemQty").Split(',');
                    string[] QuantityRequired = collection.Get("item.QuantityRequired").Split(',');
                    string[] Stock = collection.Get("item.Stock").Split(',');
                    string[] GRNLineId = collection.Get("item.GRNLineId").Split(',');
                    string[] GRNHeaderId=collection.Get("item.GRNHeaderId").Split(',');
                    for (int i = 0; i < ProductId.Length; i++)
                    {
                        ProductionLine line = new ProductionLine()
                        {
                            ProductionHeaderId = HeaderId,
                            ProductId = Convert.ToInt32(ProductId[i]),
                            ItemId = Convert.ToInt32(ItemId[i]),
                            Quantity = Convert.ToDecimal(ItemQty[i]),
                            Stock = Convert.ToDecimal(Stock[i]),    
                            QuantityRequired = Convert.ToDecimal(QuantityRequired[i]),
                            GRNLineId = Convert.ToInt32(GRNLineId[i]),
                            GRNHeaderId = Convert.ToInt32(GRNHeaderId[i])
                        };
                        _db.Entry(line).State = System.Data.Entity.EntityState.Added;
                        _db.SaveChanges();
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
                finally
                {
                    transaction.Commit();
                    transaction.Dispose();
                    _db.Database.Connection.Close();
                };
            }
            return RedirectToAction("Index");
        }
        public SelectList GetAllFormulation()
        {
            var formulationlist = new List<SelectListItem>();
            formulationlist.Add(new SelectListItem() { Text = "Please Select Formulation Name", Value = "0" });
            var formulationname = (from x in _db.FormulationHeaders.Where(x=>x.AcFlag!=false)
                               select new { x.FormulationHeaderId, x.FormulationName }).ToList();
            foreach (var item in formulationname)
            {
                formulationlist.Add(new SelectListItem { Text = item.FormulationName.ToString(), Value = item.FormulationHeaderId.ToString() });
            }
            return new SelectList(formulationlist, "Value", "Text");
        }

        public JsonResult GetFormulationData(int FormulationId)
        {
            var get_item_name = _db.SpGetFormulationHeaderInfo(FormulationId).FirstOrDefault();
            var res = new { ItemName = get_item_name.ItemName, FormulaQty = get_item_name.FormulaQty};
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetProductionLineData(int FormulationId)
        {
            var data = _db.SpProductionLineData(FormulationId).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //public JsonResult GetStockData(int FormulationId)
        //{
        //    var get_item_name = _db.SpCalculateStock(FormulationId).FirstOrDefault();
        //    var res = new { ItemName = get_item_name.ItemName, FormulaQty = get_item_name.FormulaQty };
        //    return Json(res, JsonRequestBehavior.AllowGet);
        //}
    }
}