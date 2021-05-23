using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using StockTracking_Data.Models;
using StockTracking_Data.Models.Entities;
using StockTracking_Presentation.Hubs;
using StockTracking_Presentation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StockTracking_Presentation.Controllers
{

    public class OrderController : Controller
    {
        private readonly IHubContext<OrderHub> _orderHub;
        private readonly ApplicationDBContext _context;
        public OrderController(IHubContext<OrderHub> orderHub, ApplicationDBContext context)
        {
            _context = context;
            _orderHub = orderHub;
        }

        public IActionResult Index()
        {
            return View();
        }

        [Route("[Controller]")]
        [HttpPost]
        public IActionResult Order([FromBody] OrderDTO data)
        {

            var findProduct = _context.Products.Where(product => product.Id == data.product).FirstOrDefault();
            if (findProduct != null)
            {
                if (findProduct.Stock >= data.size)
                {
                    _context.Orders.Add(new Order()
                    {
                        ProductId = data.product,
                        Quantity = data.size,
                        IsDeleted = false,
                        DateCreated = DateTime.UtcNow,
                    });

                    findProduct.Stock -= data.size;
                    _context.SaveChanges();
                    _orderHub.Clients.All.SendAsync("lastOrder", new { isSuccess = true, activeStock = findProduct.Stock, message = "Başarılı." });
                    return Accepted();
                }
                else
                {
                    _orderHub.Clients.All.SendAsync("lastOrder", new { isSuccess = false, activeStock = findProduct.Stock, message = "Stokta yeterli ürün yok." });
                    return BadRequest();
                }
            }

            else
            {
                _orderHub.Clients.All.SendAsync("lastOrder", new { isSuccess = false, activeStock = 0, message = "Ürün bulunamadı." });
                return BadRequest();
            }

        }

    }
}
