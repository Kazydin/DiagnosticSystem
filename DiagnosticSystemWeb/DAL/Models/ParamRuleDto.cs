using Microsoft.AspNetCore.Mvc;

using System.Text.Json.Serialization;

namespace DiagnosticSystem.DAL.Models
{
    public class ParamRuleDto
    {
        public int ParamId { get; set; }

        public decimal MinValue { get; set; }

        public decimal MaxValue { get; set; }

        public string RuleType { get; set; }
    }
}
