using DiagnosticSystem.DAL;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// DB Init
string connectionString = builder.Configuration.GetConnectionString("DsDatabase");
builder.Services.AddDbContext<Store>(opt => opt.UseSqlServer(connectionString));

var app = builder.Build();

app.Run();
