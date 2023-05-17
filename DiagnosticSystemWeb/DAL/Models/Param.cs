using DiagnosticSystem.DAL.Configurations;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Models
{
    [EntityTypeConfiguration(typeof(ParamConfiguration))]
    public class Param
    {
        public int ParamId { get; set; }

        public string Name { get; set; }

        public IEnumerable<Alert> Alerts { get; set; }
    }
}
