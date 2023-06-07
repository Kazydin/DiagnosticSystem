using DiagnosticSystem.DAL.Configurations;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Models
{
    [EntityTypeConfiguration(typeof(ParamConsequenceConfiguration))]
    public class ParamConsequence
    {
        public int ConsId { get; set; }

        public int ParamId { get; set; }

        public decimal MinValue { get; set; }

        public decimal MaxValue { get; set; }

        public string ConsequenceText { get; set; }

        public string ReasonText { get; set; }

        public Param Param { get; set; }

        public bool IsViolated(decimal value)
        {
            return value >= MinValue && value <= MaxValue;
        }
    }
}
