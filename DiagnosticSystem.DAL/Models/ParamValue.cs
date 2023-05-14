using System;

namespace DiagnosticSystem.DAL.Models
{
    /// <summary>
    /// Значения параметров
    /// </summary>
    public class ParamValue
    {
        public int ValueId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Значение
        /// </summary>
        public double Value { get; set; }

        /// <summary>
        /// Дата и время значения
        /// </summary>
        public DateTime DateTime { get; set; }

        public Param Param { get; set; }
    }
}
