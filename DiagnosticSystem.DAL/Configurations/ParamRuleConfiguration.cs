using DiagnosticSystem.Database.Models;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DiagnosticSystem.Database.Configurations
{
    public class ParamRuleConfiguration : IEntityTypeConfiguration<ParamRule>
    {
        public void Configure(EntityTypeBuilder<ParamRule> builder)
        {
            builder
                .ToTable("param_rules")
                .HasKey(p => p.RuleId);

            builder.HasOne(p => p.Param);
        }
    }
}
