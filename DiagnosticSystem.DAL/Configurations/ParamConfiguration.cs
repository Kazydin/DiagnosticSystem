using DiagnosticSystem.Database.Models;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DiagnosticSystem.Database.Configurations
{
    public class ParamConfiguration : IEntityTypeConfiguration<Param>
    {
        public void Configure(EntityTypeBuilder<Param> builder)
        {
            builder
                .ToTable("params")
                .HasKey(p => p.ParamId);
        }
    }
}
