using DiagnosticSystem.DAL;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.Features
{
    public class AlertToArchiveCommand : BaseController
    {
        public AlertToArchiveCommand(Store store) : base(store)
        {
        }

        [Route("alerts/{id}/archive")]
        [HttpPost]
        public async Task<IActionResult> RunAsync(int id, CancellationToken cancellationToken)
        {
            var alert = await _store.Alerts.Where(a => a.AlertId == id && a.IsArchived == 0).FirstOrDefaultAsync();

            if (alert != null)
            {
                alert.IsArchived = 1;
                await _store.SaveChangesAsync();

                return Ok();
            }
            else
            {
                return NotFound();
            }
        }
    }
}
