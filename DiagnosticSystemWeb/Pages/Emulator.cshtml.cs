using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class EmulatorModel : PageModel
    {
        private readonly ILogger<EmulatorModel> _logger;

        private Store _store;

        public Param[] Params = new Param[] { };

        public EmulatorModel(ILogger<EmulatorModel> logger, Store store)
        {
            _logger = logger;
            _store = store;
        }

        public async Task<PageResult> OnGetAsync()
        {
            Params = await _store.Params.ToArrayAsync();

            return Page();
        }
    }
}