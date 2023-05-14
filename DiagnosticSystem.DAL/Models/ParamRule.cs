namespace DiagnosticSystem.Database.Models
{
    /// <summary>
    /// Уставки
    /// </summary>
    public class ParamRule
    {
        public int RuleId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Тип уставки
        /// </summary>
        public ParamRuleType Type { get; set; }

        /// <summary>
        /// Значение
        /// </summary>
        public double Value { get; set; }

        public Param Param { get; set; }
    }
}
