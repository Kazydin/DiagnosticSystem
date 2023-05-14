using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class RulesModel : PageModel
    {
        private readonly ILogger<RulesModel> _logger;

        private Store _store;

        public Param[] Params;

        public ParamRule[] Rules;

        public Param CurrentParam;

        public RulesModel(ILogger<RulesModel> logger, Store store)
        {
            _logger = logger;
            _store = store;
        }
 
        public async Task<PageResult> OnGetAsync()
        {
            var paramId = Convert.ToInt32(Request.Query["ParamId"].FirstOrDefault());

            Params = await _store.Params.ToArrayAsync();

            if (paramId != 0)
            {
                CurrentParam = Params.Where(p => p.ParamId == paramId).FirstOrDefault();
            }

            if (CurrentParam == null)
            {
                CurrentParam = Params.FirstOrDefault();
            }

            Rules = await _store.ParamRules.Where(p => p.ParamId == CurrentParam.ParamId).ToArrayAsync();

            return Page();
        }
    }
}