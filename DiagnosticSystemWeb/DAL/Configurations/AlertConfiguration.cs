using DiagnosticSystem.DAL.Models;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DiagnosticSystem.DAL.Configurations
{
    public class AlertConfiguration : IEntityTypeConfiguration<Alert>
    {
        public void Configure(EntityTypeBuilder<Alert> builder)
        {
            builder
                .ToTable("alerts")
                .HasKey(p => p.AlertId);

            builder.HasOne(p => p.Param);
            builder.HasOne(p => p.ParamRule);
            builder.HasOne(p => p.ParamValue);
        }
    }
}
