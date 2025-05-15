using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class PurchaseController : Controller
    {
        BalajiProductsManagementEntities _db;
        public PurchaseController()
        {
            _db= new BalajiProductsManagementEntities();
        }
        public ActionResult Index() 
        {
            ViewBag.ProductList = GetProductName();
            ViewBag.PackingList = GetPackingName();
            ViewBag.UnitList = GetUnitName();
            ViewBag.TaxList = GetTaxName();
            ViewBag.PlantList = GetPlantName();
            ViewBag.SupplierList = GetSupplier();
            PurchaseHeader purchaseHeader = new PurchaseHeader();
            var Lines = new List<PurchaseLine>();
            PurchaseHeaderLineModel model = new PurchaseHeaderLineModel()
            {
                Header = purchaseHeader,
                Lines = Lines
            };
            return View(model);
        }
        public ActionResult PurchaseHeaderPartial() 
        { 
            return View(); 
        }  
        public ActionResult PurchaseLinePartial()
        {
            return View();
        }
        public List<SelectListItem> GetPlantName()
        {
            var plantlist = new List<SelectListItem>();
            plantlist.Add(new SelectListItem() { Text = "Please Select Plant Name", Value = "0" });

            var plantname = (from x in _db.Plants select new { x.PlantId, x.PlantName }).ToList();

            foreach (var item in plantname)
            {
                plantlist.Add(new SelectListItem { Text = item.PlantName.ToString(), Value = item.PlantId.ToString() });
            }
            return plantlist;
        }
        public List<SelectListItem> GetSupplier()
        {
            var supplierlist = new List<SelectListItem>();
            supplierlist.Add(new SelectListItem() { Text = "All Supplier Name", Value = "0" });

            var suppliername = (from x in _db.People select new { x.PersonId, x.PersonName }).ToList();

            foreach (var item in suppliername)
            {
                supplierlist.Add(new SelectListItem { Text = item.PersonName.ToString(), Value = item.PersonId.ToString() });
            }
            return supplierlist;
        }
        public ActionResult SaveOrUpdate(FormCollection collection)
        {
            int HeaderId = 0;
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    if(Convert.ToInt32(collection.Get("PurchaseHeaderId")) == 0)
                    {
                        PurchaseHeader purchaseHeader = new PurchaseHeader()
                        {
                            PurchaseDate = Convert.ToDateTime(collection.Get("PurchaseDate")),
                            PersonId = Convert.ToInt32(collection.Get("PersonId")),
                            BasicAmount = Convert.ToDecimal(collection.Get("BasicAmount")),
                            TaxAmount = Convert.ToDecimal(collection.Get("TaxAmount")),
                            DiscountAmount = Convert.ToDecimal(collection.Get("DiscountAmount")),
                            TotalAmount = Convert.ToDecimal(collection.Get("TotalAmount")),
                            PlantId = Convert.ToInt32(collection.Get("PlantId")),
                            GodownId = Convert.ToInt32(collection.Get("GodownId")),
                        };
                        _db.Entry(purchaseHeader).State = System.Data.Entity.EntityState.Added;
                        _db.SaveChanges();
                        HeaderId = purchaseHeader.PurchaseHeaderId;
                    }
                    string[]ProductId=collection.Get("item.ProductId").Split(',');
                    string[]ItemId=collection.Get("ItemId").Split(',');
                    string[]PackingId = collection.Get("item.PackingId").Split(',');
                    string[]UnitId=collection.Get("item.UnitId").Split(',');
                    string[]Quantity=collection.Get("item.Quantity").Split(',');
                    string[]Rate=collection.Get("item.Rate").Split(',');
                    string[] BasicAmount = collection.Get("item.BasicAmount").Split(',');
                    string[]DisountPercent=collection.Get("item.DiscountPercentage").Split(',');
                    string[]DiscountAmount=collection.Get("item.DiscountAmount").Split(',');
                    string[] TaxableAmount=collection.Get("item.TaxableAmount").Split(',');
                    string[] TaxId=collection.Get("item.TaxId").Split(',');
                    string[]TaxAmount=collection.Get("item.TaxAmount").Split(',');
                    string[] PayableAmount=collection.Get("item.PayableAmount").Split(',');
                    for (int i = 0; i < ProductId.Length; i++)
                    {
                        PurchaseLine line = new PurchaseLine()
                        {
                            PurchaseHeaderId = HeaderId,
                            ProductId = Convert.ToInt32(ProductId[i]),
                            ItemId = Convert.ToInt32(ItemId[i]),
                            PackingId = Convert.ToInt32(PackingId[i]),
                            UnitId = Convert.ToInt32(UnitId[i]),
                            Quantity = Convert.ToDecimal(Quantity[i]),
                            Rate = Convert.ToDecimal(Rate[i]),
                            BasicAmount = Convert.ToDecimal(BasicAmount[i]),
                            DiscountPercentage = Convert.ToDecimal(DisountPercent[i]),
                            DiscountAmount = Convert.ToDecimal(DiscountAmount[i]),
                            TaxableAmount = Convert.ToDecimal(TaxableAmount[i]),
                            TaxId = Convert.ToInt32(TaxId[i]),
                            TaxAmount = Convert.ToDecimal(TaxAmount[i]),
                            PayableAmount = Convert.ToDecimal(PayableAmount[i])
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
        public List<SelectListItem> GetProductName()
        {
            var productlist = new List<SelectListItem>();
            productlist.Add(new SelectListItem() { Text = "Please Select Product Name", Value = "0" });

            var productname = (from x in _db.Products select new { x.ProductId, x.ProductName }).ToList();

            foreach (var item in productname)
            {
                productlist.Add(new SelectListItem { Text = item.ProductName.ToString(), Value = item.ProductId.ToString() });
            }
            return productlist;
        }
        public JsonResult GetItem(int productId)
        {
            var _selectList = new List<SelectListItem>();
            _selectList.Add(new SelectListItem { Value = "0", Text = "---Select---" });
            var get_item_name = (dynamic)null;

            get_item_name = (from x in _db.Items.Where(x => x.ProductId == productId)
                                 select new
                                 {
                                     x.ItemId,
                                     x.ItemName
                                 });
            foreach (var item in get_item_name)
            {
                _selectList.Add(new SelectListItem { Value = item.ItemId.ToString(), Text = item.ItemName.ToString() });
            }
            return Json(_selectList, JsonRequestBehavior.AllowGet);
        }
        public List<SelectListItem> GetTaxName()
        {
            var taxlist = new List<SelectListItem>();
            taxlist.Add(new SelectListItem() { Text = "Please Select Tax Name", Value = "0" });
            var taxname = (from x in _db.Taxes select new { x.TaxId, x.TaxName }).ToList();

            foreach (var item in taxname)
            {
                taxlist.Add(new SelectListItem { Text = item.TaxName.ToString(), Value = item.TaxId.ToString() });
            }
            return taxlist;
        }
        public List<SelectListItem> GetPackingName()
        {
            var packinglist = new List<SelectListItem>();
            packinglist.Add(new SelectListItem() { Text = "Please Select Packing Name", Value = "0" });

            var productname = (from x in _db.Packings select new { x.PackingId, x.PackingName }).ToList();

            foreach (var item in productname)
            {
                packinglist.Add(new SelectListItem { Text = item.PackingName.ToString(), Value = item.PackingId.ToString() });
            }
            return packinglist;
        }
        public List<SelectListItem> GetUnitName()
        {
            var unitlist = new List<SelectListItem>();
            unitlist.Add(new SelectListItem() { Text = "Please Select Unit Name", Value = "0" });

            var unitname = (from x in _db.Units select new { x.UnitId, x.UnitName }).ToList();

            foreach (var item in unitname)
            {
                unitlist.Add(new SelectListItem { Text = item.UnitName.ToString(), Value = item.UnitId.ToString() });
            }
            return unitlist;
        }
        public JsonResult GetGodown(int plantId)
        {
            var _selectList = new List<SelectListItem>();
            _selectList.Add(new SelectListItem { Value = "0", Text = "---Select---" });
            var get_godown_name = (dynamic)null;

            get_godown_name = (from x in _db.Godowns.Where(x => x.PlantId == plantId)
                             select new
                             {
                                 x.GodownId,
                                 x.GodownName
                             });
            foreach (var item in get_godown_name)
            {
                _selectList.Add(new SelectListItem { Value = item.GodownId.ToString(), Text = item.GodownName.ToString() });
            }
            return Json(_selectList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetTaxPercentage(int TaxId)
        {
            var TaxPercent = (from x in _db.Taxes.Where(x => x.TaxId == TaxId) select x).FirstOrDefault();
            decimal taxper = (decimal)TaxPercent.TaxPercentage;
            var res = new { taxpercent = taxper };
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public ActionResult AllPurchase()
        {
            var data = _db.SpAllPurchase().ToList();
            return View(data);
        }
        
        public ActionResult GetPurchaseReport(int supplierId)
        {
            
            return RedirectToAction("Index");
        }
    }
}