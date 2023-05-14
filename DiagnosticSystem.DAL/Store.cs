using DiagnosticSystem.Database.Models;

using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.Database
{
    public class Store : DbContext
    {
        public Store(DbContextOptions<Store> options)
        : base(options)
        { }

        public DbSet<Param> Params { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }
    }
}
