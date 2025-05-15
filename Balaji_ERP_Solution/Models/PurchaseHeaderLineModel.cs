using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Balaji_ERP_Solution.Models
{
    public class PurchaseHeaderLineModel
    {
        public PurchaseHeader Header {  get; set; }
        public IEnumerable<PurchaseLine> Lines { get; set; }
    }
}