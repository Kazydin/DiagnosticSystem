using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc;

namespace DiagnosticSystem.Features.GetAlerts
{
    public class GetAlertsDto
    {
        public Alert[] arrAlerts;

        public Alert[] arrWarnings;
    }
}
