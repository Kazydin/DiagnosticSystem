using Microsoft.AspNetCore.Mvc.RazorPages;

namespace DiagnosticSystemWeb.Pages
{
    public class RulesModel : PageModel
    {
        private readonly ILogger<RulesModel> _logger;

        public RulesModel(ILogger<RulesModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}