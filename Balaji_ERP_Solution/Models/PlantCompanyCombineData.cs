using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Balaji_ERP_Solution.Models
{
    public class PlantCompanyCombineData
    {
        public Plant PlantData { get; set; }
        public IEnumerable<Company> CompanyNames { get; set; }
    }
}