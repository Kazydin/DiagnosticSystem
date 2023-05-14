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

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }
    }
}
