using DiagnosticSystem.DAL;
using DiagnosticSystem.Services;

using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

// DB Init
string connectionString = builder.Configuration.GetConnectionString("DsDatabase");
builder.Services.AddDbContext<Store>(opt => opt.UseSqlServer(connectionString).UseSnakeCaseNamingConvention());

builder.Services.AddScoped<Store>();

builder.Services.AddHostedService<MonitoringService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
