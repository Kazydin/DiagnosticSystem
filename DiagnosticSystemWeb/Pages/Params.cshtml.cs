using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class ParamsModel : PageModel
    {
        private readonly ILogger<ParamsModel> _logger;

        private Store _store;

        public Param[] Params = new Param[] { };

        public ParamsModel(ILogger<ParamsModel> logger, Store store)
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