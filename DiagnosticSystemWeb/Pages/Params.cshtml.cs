using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace DiagnosticSystemWeb.Pages
{
    public class ParamsModel : PageModel
    {
        private readonly ILogger<ParamsModel> _logger;

        public ParamsModel(ILogger<ParamsModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}