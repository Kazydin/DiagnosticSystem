using DiagnosticSystem.DAL.Configurations;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Models
{
    [EntityTypeConfiguration(typeof(AlertConfiguration))]
    public class Alert
    {
        public int AlertId { get; set; }

        public int ParamId { get; set; }

        public int RuleId { get; set; }

        public int ValueId { get; set; }

        public int? ConsId { get; set; }

        public int IsArchived { get; set; }

        public Param Param { get; set; }

        public ParamRule ParamRule { get; set; }

        public ParamValue ParamValue { get; set; }

        public ParamConsequence Consequence { get; set; }
    }
}
