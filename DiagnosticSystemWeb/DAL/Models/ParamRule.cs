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
        public int RuleId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Тип уставки для срабатывания
        /// </summary>
        public string RuleType { get; set; }

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
        public string AlertKind { get; set; }

        public Param Param { get; set; }

        public IEnumerable<Alert> Alerts { get; set; }

        public string sRuleType
        {
            get
            {
                //string delimiter = RuleType switch
                //{
                //    ParamRuleType.MORE => "больше",
                //    ParamRuleType.LESS => "меньше"
                //};

                return "Значение в диапазоне от " + MinValue + " до" + MaxValue;
            }
        }

        public string s2RuleType
        {
            get
            {
                return RuleType switch
                {
                    ParamRuleType.MORE => "превышение",
                    ParamRuleType.LESS => "понижение"
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

        public bool IsViolated(decimal value)
        {
            return value >= MinValue && value <= MaxValue;
        }
    }
}
