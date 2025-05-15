
using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;

namespace Balaji_ERP_Solution.Controllers
{
    public class GRNController : Controller
    {

        BalajiProductsManagementEntities _db;
        public GRNController()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public ActionResult Index()
        {
            ViewBag.PONo = GetPONumber();
            GRNHeader GRNHeader = new GRNHeader();
            var Lines = new List<GRNLine>();
            GRNHeaderLine model = new GRNHeaderLine()
            {
                gRNHeader = GRNHeader,
                gRNLines = Lines
            };
            return View(model);
        }
        public ActionResult GRNHeaderPartial()
        {
            return View();
        }
        public ActionResult GRNLinePartial()
        {
            return View();
        }
        public List<SelectListItem> GetPONumber()
        {
            var POlist = new List<SelectListItem>();
            POlist.Add(new SelectListItem() { Text = "Please Select PO Number", Value = "0" });

            var getpo = (from x in _db.PurchaseHeaders select new { x.PurchaseHeaderId}).ToList();

            foreach (var item in getpo)
            {
                POlist.Add(new SelectListItem { Text = item.PurchaseHeaderId.ToString(), Value = item.PurchaseHeaderId.ToString() });
            }
            return POlist;
        }
       
        public JsonResult GetGRNHeaderData(int POId)
        {
            var get_item_name = _db.SpGetHeaderInfo(POId).FirstOrDefault();
            var res = new { PersonName = get_item_name.PersonName, PersonContact = get_item_name.PersonContact, podate = get_item_name.purchase_order_date };          
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        //public JsonResult GET_GRN_Header_Data_IN_Date_Format()
        //{
        //    var data = db.sp_Grn_line_data(po_id).ToList();
        //    DateTime dt = Convert.ToDateTime();
        //    int date = dt.Day;
        //    int month = dt.Month;
        //    int year = dt.Year;
        //    string string_po_date = date.ToString() + "/" + month.ToString() + "/" + year.ToString();
        //    res{ po_date = string_po_date };
        //    return Json(data, JsonRequestBehavior.AllowGet);

        //    //}

        public JsonResult GetGRNLineData(int POId)
        {
            var data=_db.SpGRNLineData(POId).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult SaveOrUpdate(FormCollection collection)
        {
            int HeaderId = 0;
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    if (Convert.ToInt32(collection.Get("GRNHeaderId")) == 0)
                    {
                        GRNHeader gRNHeader = new GRNHeader()
                        {
                            PurchaseHeaderId = Convert.ToInt32(collection.Get("PurchaseHeaderId")),
                            GRNDate = Convert.ToDateTime(collection.Get("GRNDate")),
                            VehicleNo = Convert.ToString(collection.Get("VehicleNo")),
                            VehicleWeight = Convert.ToDecimal(collection.Get("VehicleWeight")),
                            VehicleLoadedWeight = Convert.ToDecimal(collection.Get("VehicleLoadedWeight")),
                            DCNo = Convert.ToString(collection.Get("DCNo")),
                        };
                        _db.Entry(gRNHeader).State = System.Data.Entity.EntityState.Added;
                        _db.SaveChanges();
                        HeaderId = gRNHeader.GRNHeaderId;
                    }
                    string[] ProductId = collection.Get("item.ProductId").Split(',');
                    string[] ItemId = collection.Get("item.ItemId").Split(',');
                    string[] UnitId = collection.Get("item.UnitId").Split(',');
                    string[] POQty = collection.Get("item.POQty").Split(',');
                    string[] AcceptedQty = collection.Get("item.AcceptedQty").Split(',');
                    string[] RejectedQty = collection.Get("item.RejectedQty").Split(',');
                    string[] FreeQty = collection.Get("item.FreeQty").Split(',');
                    string[] PORate = collection.Get("item.PORate").Split(',');
                    string[] BasicAmount = collection.Get("item.BasicAmount").Split(',');
                    string[] DiscountPercentage = collection.Get("item.DiscountPercentage").Split(',');
                    string[] DiscountAmount = collection.Get("item.DiscountAmount").Split(',');
                    string[] TaxableAmount = collection.Get("item.TaxableAmount").Split(',');
                    string[] TaxId = collection.Get("item.TaxId").Split(',');
                    string[] TaxAmount = collection.Get("item.TaxAmount").Split(',');
                    string[] PayableAmount = collection.Get("item.PayableAmount").Split(',');
                    string[] PurchaseLineId = collection.Get("item.PurchaseLineId").Split(',');

                    for (int i = 0; i < ProductId.Length; i++)
                    {
                        GRNLine line = new GRNLine()
                        {
                            GRNHeaderId = HeaderId,
                            ProductId = Convert.ToInt32(ProductId[i]),
                            ItemId = Convert.ToInt32(ItemId[i]),
                            UnitId = Convert.ToInt32(UnitId[i]),
                            POQty = Convert.ToDecimal(POQty[i]),
                            AcceptedQty = Convert.ToDecimal(AcceptedQty[i]),
                            RejectedQty = Convert.ToDecimal(RejectedQty[i]),
                            FreeQty = Convert.ToDecimal(FreeQty[i]),
                            PORate = Convert.ToDecimal(PORate[i]),
                            BasicAmount = Convert.ToDecimal(BasicAmount[i]),
                            DiscountPercentage = Convert.ToDecimal(DiscountPercentage[i]),
                            DiscountAmount = Convert.ToDecimal(DiscountAmount[i]),
                            TaxableAmount = Convert.ToDecimal(TaxableAmount[i]),
                            TaxId= Convert.ToInt32(TaxId[i]),
                            TaxAmount = Convert.ToDecimal(TaxAmount[i]),
                            PayableAmount= Convert.ToDecimal(PayableAmount[i]),
                            PurchaseLineId = Convert.ToInt32(PurchaseLineId[i]),
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
    }
}