﻿using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystemWeb.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public Alert[] Alerts;

        private Store _store;

        public Alert[] arrAlerts;

        public Alert[] arrWarnings;

        public IndexModel(ILogger<IndexModel> logger, Store store)
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
                .ToArrayAsync();

            arrAlerts = Alerts.Where(a => a.ParamRule?.AlertKind == ParamRuleAlertKind.ALERT).ToArray();

            arrWarnings = Alerts.Where(a => a.ParamRule?.AlertKind == ParamRuleAlertKind.WARNING).ToArray();

            return Page();
        }
    }
}