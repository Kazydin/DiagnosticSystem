using DiagnosticSystem.DAL.Configurations;
using Microsoft.EntityFrameworkCore;

using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace DiagnosticSystem.DAL.Models
{
    /// <summary>
    /// Значения параметров
    /// </summary>
    [EntityTypeConfiguration(typeof(ParamValueConfiguration))]
    public class ParamValue
    {
        public int ValueId { get; set; }

        public int ParamId { get; set; }

        /// <summary>
        /// Значение
        /// </summary>
        public decimal Value { get; set; }

        /// <summary>
        /// Дата и время значения
        /// </summary>
        [Column("datetime")]
        public DateTime DateTime { get; set; }

        public Param Param { get; set; }
        public IEnumerable<Alert> Alerts { get; set; }
    }
}
