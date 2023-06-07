using DiagnosticSystem.DAL.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL.Configurations
{
    public class ParamConsequenceConfiguration : IEntityTypeConfiguration<ParamConsequence>
    {
        public void Configure(EntityTypeBuilder<ParamConsequence> builder)
        {
            builder
                .ToTable("param_consequences")
                .HasKey(p => p.ConsId);
        }
    }
}
