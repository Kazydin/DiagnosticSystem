using DiagnosticSystem.Database.Models;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DiagnosticSystem.Database.Configurations
{
    public class ParamValueConfiguration : IEntityTypeConfiguration<ParamValue>
    {
        public void Configure(EntityTypeBuilder<ParamValue> builder)
        {
            builder
                .ToTable("param_values")
                .HasKey(p => p.ValueId);

            builder.HasOne(p => p.Param);
        }
    }
}
