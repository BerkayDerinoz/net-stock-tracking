using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;


namespace StockTracking_Data.Models.Entities
{
    [Table("Product")]
    public class Product : BaseEntity
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Photo { get; set; }
        public int Stock { get; set; }
        public string Description { get; set; }
        public string DescriptionIndex { get; set; }

    }
}