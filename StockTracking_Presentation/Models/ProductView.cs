using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StockTracking_Presentation.Models
{
    public class ProductView
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string DescriptionIndex { get; set; }
        public string Photo { get; set; }
        public int Stock { get; set; }
        public string DateCreated { get; set; }
    }
}
