using _1_DataContext.DataContext;
using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2_ProductionRepository.Master
{
    public class FormulationMaster
    {
        BalajiProductsManagementEntities _db;
        public FormulationMaster()
        {
            _db = new BalajiProductsManagementEntities();
        }
        public void FormulationHeaderPartial()
        {
            //return View();
        }
        public void FormulationLinePartial()
        {
            //return View();
        }
        public void GetProductName()
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
            //return productlist;
        }
        public void GetAllProductName()
        {
            var productlist = new List<SelectListItem>();
            productlist.Add(new SelectListItem() { Text = "Please Select Product Name", Value = "0" });
            var productname = (from x in _db.Products
                               select new { x.ProductId, x.ProductName }).ToList();
            foreach (var item in productname)
            {
                productlist.Add(new SelectListItem { Text = item.ProductName.ToString(), Value = item.ProductId.ToString() });
            }
            //return productlist;
        }
        public void GenerateCode()
        {
            string _Code = "";
            DateTime dt = System.DateTime.Now;
            int month = dt.Month;
            int years = dt.Year;
            string year = dt.ToString("yy");
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    var maxid = _db.SpFormulationMax().FirstOrDefault();
                    if (maxid.ToString().Length == 0)
                    {
                        _Code = month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 1)
                    {
                        _Code = month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 2)
                    {
                        _Code = month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                    else if (maxid.ToString().Length == 3)
                    {
                        _Code = month.ToString() + "/" + year.ToString() + "/" + "000" + maxid.ToString();
                    }
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    transaction.Dispose();
                }
                finally
                {
                    transaction.Commit();
                    transaction.Dispose();
                    _db.Database.Connection.Close();
                }
            }
            //return _Code;
        }
        //public JsonResult GetItem(string ItemName)
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
        public void GetItem(int productId)
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
            //return Json(_selectList, JsonRequestBehavior.AllowGet);
        }
        public void SaveOrUpdate(FormCollection collection)
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
            //return RedirectToAction("Index");
        }
    }
}
