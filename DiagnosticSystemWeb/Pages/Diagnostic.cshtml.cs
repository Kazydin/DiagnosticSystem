using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class DiagnosticModel : PageModel
    {
        private readonly ILogger<DiagnosticModel> _logger;

        private Store _store;

        public Alert[] Alerts = new Alert[] { };

        public DiagnosticModel(ILogger<DiagnosticModel> logger, Store store)
        {
            _logger = logger;
            _store = store;
        }

        public async Task<PageResult> OnGetAsync()
        {
            Alerts = await _store.Alerts
                .Include(a => a.Param)
                .Include(a => a.ParamRule)
                .Include(a => a.ParamValue)
                .Where(a => a.IsArchived == 0)
                .ToArrayAsync();

            return Page();
        }
    }
}