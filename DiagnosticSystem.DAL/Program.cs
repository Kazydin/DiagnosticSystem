using DiagnosticSystem.Database;

using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// DB Init

string connectionString = builder.Configuration.GetConnectionString("DsDatabase");
builder.Services.AddDbContext<Store>();

var app = builder.Build();

app.Run();
