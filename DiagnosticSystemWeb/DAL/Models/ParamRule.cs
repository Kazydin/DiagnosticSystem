using DiagnosticSystem.DAL.Configurations;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Models
{
    /// <summary>
    /// Уставки
    /// </summary>
    [EntityTypeConfiguration(typeof(ParamRuleConfiguration))]
    public class ParamRule
    {
        public int RuleId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Тип уставки для срабатывания
        /// </summary>
        public ParamRuleType RuleType { get; set; }

        /// <summary>
        /// Значение
        /// </summary>
        public decimal Value { get; set; }

        /// <summary>
        /// Тип уставки
        /// </summary>
        public ParamRuleAlertKind AlertKind { get; set; }

        public Param Param { get; set; }

        public string sRuleType
        {
            get
            {
                string delimiter = RuleType switch
                {
                    ParamRuleType.Higher => "больше",
                    ParamRuleType.Below => "меньше"
                };

                return "Значение " + delimiter + " " + Value;
            }
        }

        public string s2RuleType
        {
            get
            {
                return RuleType switch
                {
                    ParamRuleType.Higher => "превышение",
                    ParamRuleType.Below => "понижение"
                };
            }
        }

        public string sAlertKind
        {
            get
            {
                return AlertKind switch
                {
                    ParamRuleAlertKind.ALERT => "тревога",
                    ParamRuleAlertKind.WARNING => "предупреждение"
                };
            }
        }
    }
}
