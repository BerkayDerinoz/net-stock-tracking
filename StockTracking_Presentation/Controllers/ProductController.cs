using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using StockTracking_Data.Models;
using StockTracking_Presentation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StockTracking_Presentation.Controllers
{
    public class ProductController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDBContext _context;

        public ProductController(ILogger<HomeController> logger, ApplicationDBContext context)
        {
            _context = context;
            _logger = logger;
        }

        public IActionResult Detail(int id)
        {
            ProductDetail model = _context.Products.Where(x => x.Id == id && !x.IsDeleted).Select(x => new ProductDetail
            {
                Id = x.Id,
                Name = x.Name,
                Photo = x.Photo,
                Price = x.Price,
                DateCreated = x.DateCreated.HasValue ? x.DateCreated.Value.ToString("dd MMMM yyyy HH:mm") : string.Empty,
                Description = x.Description,
                DescriptionIndex=x.DescriptionIndex,
                Stock = x.Stock,
            }).FirstOrDefault();
            return View(model);
        }
    }
}
