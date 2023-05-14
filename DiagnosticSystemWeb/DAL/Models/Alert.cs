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

        public string Consequence { get; set; }

        public Param Param { get; set; }

        public ParamRule ParamRule { get; set; }

        public ParamValue ParamValue { get; set; }
    }
}
