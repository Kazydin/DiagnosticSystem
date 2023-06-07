using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using System.Threading.Tasks;

namespace DiagnosticSystem.Features.GetAlerts
{
    public class GetAlertsQuery : BaseController
    {
        public GetAlertsQuery(Store store) : base(store)
        {
        }

        [Route("alerts")]
        [HttpGet]
        public async Task<IActionResult> GetAsync()
        {
            GetAlertsDto model = new GetAlertsDto();

            var Alerts = await _store.Alerts
                .Include(a => a.Param)
                .Include(a => a.ParamRule)
                .Include(a => a.ParamValue)
                .Include(p => p.Consequence)
            .Where(a => a.IsArchived == 0)
            .ToArrayAsync();

            model.arrAlerts = Alerts.Where(a => a.ParamRule?.RuleType == ParamRuleType.ALERT).ToArray();

            model.arrWarnings = Alerts.Where(a => a.ParamRule?.RuleType == ParamRuleType.WARNING).ToArray();

            return Ok(model);
        }
    }
}
