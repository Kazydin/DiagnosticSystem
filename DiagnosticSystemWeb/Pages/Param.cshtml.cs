using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class ParamModel : PageModel
    {
        private readonly ILogger<ParamModel> _logger;

        private Store _store;

        public Param Param;

        public ParamModel(ILogger<ParamModel> logger, Store store)
        {
            _logger = logger;
            _store = store;
        }

        public async Task<PageResult> OnGetAsync(int id)
        {
            Param = await _store.Params
                .Include(p => p.Values)
                .Include(p => p.Rules)
                .Include(p => p.Alerts)
                .ThenInclude(a => a.ParamRule)
                .Include(p => p.Alerts)
                .ThenInclude(a => a.ParamValue)
                .Where(p => p.ParamId == id).FirstOrDefaultAsync();

            return Page();
        }
    }
}