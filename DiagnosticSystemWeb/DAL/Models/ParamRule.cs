using DiagnosticSystem.DAL.Configurations;
using Microsoft.EntityFrameworkCore;

using Newtonsoft.Json;

namespace DiagnosticSystem.DAL.Models
{
    /// <summary>
    /// Уставки
    /// </summary>
    [EntityTypeConfiguration(typeof(ParamRuleConfiguration))]
    public class ParamRule
    {
        public ParamRule(ParamRuleDto ruleDto)
        {
            ParamId = ruleDto.ParamId;
            MinValue = ruleDto.MinValue;
            MaxValue = ruleDto.MaxValue;
            RuleType = ruleDto.RuleType;
        }

        public ParamRule() { }

        public int RuleId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Минимальное значение
        /// </summary>
        public decimal MinValue { get; set; }

        /// <summary>
        /// Максимальное значение
        /// </summary>
        public decimal MaxValue { get; set; }

        /// <summary>
        /// Тип уставки
        /// </summary>
        public string RuleType { get; set; }

        public Param Param { get; set; }

        public IEnumerable<Alert> Alerts { get; set; }

        public string RuleRange
        {
            get
            {
                return "Значение в диапазоне от " + MinValue + " до " + MaxValue;
            }
        }

        public string sRuleType
        {
            get
            {
                return RuleType switch
                {
                    ParamRuleType.ALERT => "тревога",
                    ParamRuleType.WARNING => "предупреждение",
                    _ => ""
                };
            }
        }

        public bool IsViolated(decimal value)
        {
            return value >= MinValue && value <= MaxValue;
        }
    }
}
