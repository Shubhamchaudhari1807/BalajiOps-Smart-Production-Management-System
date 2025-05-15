using Balaji_ERP_Solution.DataContext;
using Balaji_ERP_Solution.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Balaji_ERP_Solution.Controllers
{
    public class FormulationController : Controller
    {
        #region
        private int session_user_id = 0;

        private string session_user_name = "";
        #endregion
        public Boolean IsSesioonValid()
        {

            if (Session["session_user_name"] != null && Session["session_user_id"] != null)
            {

                session_user_id = Convert.ToInt32(Session["session_client_id"]);
                session_user_name = Session["session_user_name"].ToString();

                return true;
            }
            else
            {
                return false;
            }
        }

        BalajiProductsManagementEntities _db;
        public FormulationController()
        {
            _db=new BalajiProductsManagementEntities();
        }
        public ActionResult Index()
        {
            if (IsSesioonValid())
            {
                ViewBag.ProductName = GetProductName();
                ViewBag.AllProductName = GetAllProductName();
                var formulationHeader = new FormulationHeader();
                var formulationLine = new List<FormulationLine>();
                //formulationHeader.FormulationCode = GenerateCode();//used For Auto Generation of code but now we are using ItemName-Code so implementing on onchange of Itemname
                FormulationHeaderLineModel model = new FormulationHeaderLineModel()
                {
                    FormulationHeader = formulationHeader,
                    FormulationLine = formulationLine
                };
                return View(model);
            }
            else
            {
                return RedirectToAction("index", "Login");
            }
        }
        public ActionResult FormulationHeaderPartial() 
        {
            return View();
        }
        public ActionResult FormulationLinePartial() 
        { 
            return View();
        }
        public ActionResult FormulationEnable(int[] FormulationHeaderIds)
        {
            if (FormulationHeaderIds != null)
            {
                foreach (int id in FormulationHeaderIds)
                {
                    var formulationHeader = _db.FormulationHeaders.FirstOrDefault(fh => fh.FormulationHeaderId == id);
                    if (formulationHeader != null)
                    {
                        formulationHeader.AcFlag = false;
                    }
                }
                _db.SaveChanges();
            }
            return RedirectToAction("Index", "Home"); // Redirect to appropriate action
        }
        public ActionResult FormulationEnableDisable()
        {
            ViewBag.FormulationList = GetAllFormulation();
            return View();
        }
        public List<SelectListItem> GetAllFormulation()
        {
            var formulationlist = new List<SelectListItem>();
            //formulationlist.Add(new SelectListItem() { Text = "Please Select Formulation Name", Value = "0" });
            var productname = (from x in _db.FormulationHeaders
                               select new { x.FormulationHeaderId, x.FormulationName }).ToList();
            foreach (var item in productname)
            {
                formulationlist.Add(new SelectListItem { Text = item.FormulationName.ToString(), Value = item.FormulationHeaderId.ToString() });
            }
            return formulationlist;
        }
        public List<SelectListItem> GetProductName()
        {
            var productlist = new List<SelectListItem>();
            productlist.Add(new SelectListItem() { Text = "Please Select Product Name", Value = "0" });

            var productname = (from x in _db.Products
                               where x.ProductId == 2
                               select new { x.ProductId, x.ProductName }).ToList();

            foreach (var item in productname)
            {
                productlist.Add(new SelectListItem { Text = item.ProductName.ToString(), Value = item.ProductId.ToString() });
            }
            return productlist;
        }
        public List<SelectListItem> GetAllProductName()
        {
            var productlist = new List<SelectListItem>();
            productlist.Add(new SelectListItem() { Text = "Please Select Product Name", Value = "0" });
            var productname = (from x in _db.Products
                               select new { x.ProductId, x.ProductName }).ToList();
            foreach (var item in productname)
            {
                productlist.Add(new SelectListItem { Text = item.ProductName.ToString(), Value = item.ProductId.ToString() });
            }
            return productlist;
        }
        public JsonResult GenerateCode(int ItemId)
        {
            string _Code = "";
            DateTime dt =System.DateTime.Now;
            int month=dt.Month;
            int years=dt.Year;
            string year=dt.ToString("yy");
            
                try
                {
                    var maxid = _db.SpFormulationMax().FirstOrDefault();
                    var itemName = _db.Items.Where(x => x.ItemId == ItemId).Select(x => x.ItemName).FirstOrDefault();
                    if (maxid.ToString().Length==0)  
                    {
                        _Code = itemName.ToString()+"- /"+month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 1)
                    {
                        _Code = itemName.ToString()+"- /"+month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 2)
                    {
                        _Code = itemName.ToString() + "- /" + month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 3)
                    {
                        _Code = itemName.ToString() + "- /" + month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                }
                catch (Exception ex)
                {
                    LogException(ex);
                }
                finally
                {
                    _db.Database.Connection.Close();
                }
            var res = new { code = _Code };
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        //public JsonResult GetItem(string ItemName)//AutoComplete - To show top 5 result autocomplete typehead using js
        //{

        //    var data = (from x in _db.Items
        //                where x.ItemName.StartsWith(ItemName)
        //                select new
        //                {
        //                    x.ItemName,
        //                    x.ItemId

        //                }).Take(5);
        //    return Json(data, JsonRequestBehavior.AllowGet);
        //}
        public JsonResult GetItem(int productId)
        {
            var _selectList = new List<SelectListItem>();
            _selectList.Add(new SelectListItem { Value = "0", Text = "---Select---" });
            var get_plant_name = (dynamic)null;

            get_plant_name = (from x in _db.Items.Where(x => x.ProductId == productId)
                              select new
                              {
                                  x.ItemId,
                                  x.ItemName
                              });
            foreach (var item in get_plant_name)
            {
                _selectList.Add(new SelectListItem { Value = item.ItemId.ToString(), Text = item.ItemName.ToString() });
            }
            return Json(_selectList, JsonRequestBehavior.AllowGet);
        }
        public ActionResult SaveOrUpdate(FormCollection collection)
        {
            int HeaderId = 0;
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    if (Convert.ToInt32(collection.Get("FormulationHeaderId")) == 0)
                    {
                        FormulationHeader formulationHeader = new FormulationHeader()
                        {
                            FormulationDate = Convert.ToDateTime(collection.Get("FormulationDate")),
                            ProductId = Convert.ToInt32(collection.Get("ProductId")),
                            ItemId = Convert.ToInt32(collection.Get("ItemId")),
                            FormulationName = Convert.ToString(collection.Get("FormulationName")),
                            FormulationCode = Convert.ToString(collection.Get("FormulationCode")),
                            FormulaQty = Convert.ToDecimal(collection.Get("FormulaQty")),
                        };
                        _db.Entry(formulationHeader).State = System.Data.Entity.EntityState.Added;
                        _db.SaveChanges();
                        HeaderId = formulationHeader.FormulationHeaderId;
                    }
                    string[] ProductId = collection.Get("item.ProductId").Split(',');
                    string[] ItemId = collection.Get("item.ItemId").Split(',');
                    string[] ItemQty = collection.Get("item.ItemQty").Split(',');
                    for (int i = 0; i < ProductId.Length; i++)
                    {
                        FormulationLine line = new FormulationLine()
                        {
                            FormulationHeaderId = HeaderId,
                            ProductId = Convert.ToInt32(ProductId[i]),
                            ItemId = Convert.ToInt32(ItemId[i]),
                            ItemQty = Convert.ToDecimal(ItemQty[i])
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
        public void FormulaUpdate(int formulationId)
        {
            var formula = _db.FormulationHeaders.FirstOrDefault(x => x.FormulationHeaderId == formulationId);
            if (formula != null)
            {
                formula.AcFlag = false; 
                _db.SaveChanges(); 
            }
        }


        private void LogException(Exception ex)
        {
            EventLog eventLog = new EventLog("Application");
            eventLog.Source = "YourApplicationName";

            string logMessage = $"An exception occurred: {ex.Message}\nStack Trace: {ex.StackTrace}";
            eventLog.WriteEntry(logMessage, EventLogEntryType.Error);
        }
    }
}