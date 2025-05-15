using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Balaji_ERP_Solution.Models
{
    public class ProductionHeaderLine
    {
        public ProductionHeader productionHeader { get; set; }
        public IEnumerable<ProductionLine> productionLine { get; set; }
    }
}