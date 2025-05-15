using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Balaji_ERP_Solution.Models
{
    public class GRNHeaderLine
    {
        public GRNHeader gRNHeader {  get; set; }
        public IEnumerable<GRNLine> gRNLines { get; set; }
    }
}