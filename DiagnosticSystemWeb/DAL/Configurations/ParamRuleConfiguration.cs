using DiagnosticSystem.DAL.Models;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DiagnosticSystem.DAL.Configurations
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
