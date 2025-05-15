using Balaji_ERP_Solution.DataContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Balaji_ERP_Solution.Models
{
    public class FormulationHeaderLineModel
    {
        public FormulationHeader FormulationHeader {  get; set; }

        public IEnumerable<FormulationLine> FormulationLine { get; set; }

    }
}