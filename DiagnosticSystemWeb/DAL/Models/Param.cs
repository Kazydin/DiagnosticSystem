using DiagnosticSystem.DAL.Configurations;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Models
{
    [EntityTypeConfiguration(typeof(ParamConfiguration))]
    public class Param
    {
        public int ParamId { get; set; }

        public string Name { get; set; }

        public IEnumerable<ParamRule> Rules { get; set; }

        public IEnumerable<Alert> Alerts { get; set; }

        public IEnumerable<ParamValue> Values { get; set; }

        public IEnumerable<ParamConsequence> Consequences { get; set; }
    }
}
