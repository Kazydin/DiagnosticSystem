using DiagnosticSystem.DAL.Models;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.DAL
{
    public class Store : DbContext
    {
        public Store(DbContextOptions<Store> options)
        : base(options)
        { }

        public DbSet<Param> Params { get; set; }

        public DbSet<ParamRule> ParamRules { get; set; }

        public DbSet<ParamValue> ParamValues { get; set; }

        public DbSet<Alert> Alerts { get; set; }
    }
}
