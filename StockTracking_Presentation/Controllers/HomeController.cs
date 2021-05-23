using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using StockTracking_Data.Models;
using StockTracking_Presentation.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace StockTracking_Presentation.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDBContext _context;

        public HomeController(ILogger<HomeController> logger, ApplicationDBContext context)
        {
            _context = context;
            _logger = logger;
        }

        public IActionResult Index()
        {
            List<ProductView> model = _context.Products.Where(x => !x.IsDeleted).Select(x => new ProductView
            {
                Id = x.Id,
                Name = x.Name,
                Photo = x.Photo,
                Price = x.Price,
                DateCreated = x.DateCreated.HasValue? x.DateCreated.Value.ToString("dd MMMM yyyy HH:mm"):string.Empty,
                Description=x.Description,
                DescriptionIndex=x.DescriptionIndex,
                Stock = x.Stock
            }).ToList();

            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
