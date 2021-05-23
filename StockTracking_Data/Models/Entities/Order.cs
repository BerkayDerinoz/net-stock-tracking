using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace StockTracking_Data.Models.Entities
{
    [Table("Order")]
    public class Order : BaseEntity
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
    }
}
