//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Balaji_ERP_Solution.DataContext
{
    using System;
    using System.Collections.Generic;
    
    public partial class FormulationLine
    {
        public int FormulationLineId { get; set; }
        public Nullable<int> FormulationHeaderId { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> ItemId { get; set; }
        public Nullable<decimal> ItemQty { get; set; }
    }
}
