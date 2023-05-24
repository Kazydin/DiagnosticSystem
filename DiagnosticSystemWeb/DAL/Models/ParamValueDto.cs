using Microsoft.AspNetCore.Mvc;

using System.Text.Json.Serialization;

namespace DiagnosticSystem.DAL.Models
{
    public class ParamValueDto
    {
        public int ParamId { get; set; }

        public decimal Value { get; set; }
    }
}
