using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.DataProtection.KeyManagement.Internal;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.Services
{
    public class MonitoringService : IHostedService
    {
        private Store _store;

        private ParamRule[] _paramRules;

        private Param[] _params;

        private IServiceScopeFactory _scopeFactory;

        public MonitoringService(IServiceScopeFactory scopeFactory)
        {
            _scopeFactory = scopeFactory;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            DoWork(cancellationToken);

            return Task.CompletedTask;
        }

        private async Task DoWork(CancellationToken cancellationToken)
        {
            await using (var scope = _scopeFactory.CreateAsyncScope())
            {
                _store = scope.ServiceProvider.GetRequiredService<Store>();

                _params = await _store.Params.ToArrayAsync(cancellationToken);
                _paramRules = await _store.ParamRules.ToArrayAsync(cancellationToken);

                while (!cancellationToken.IsCancellationRequested)
                {
                    var value = await _store.ParamValues
                        .Include(p => p.Param)
                        .ThenInclude(r => r.Rules)
                        .Include(p => p.Param)
                        .ThenInclude(p => p.Consequences)
                        .Where(pv => pv.IsChecked == 0)
                        .FirstOrDefaultAsync(cancellationToken);

                    if (value != null)
                    {
                        var brokenRules = value.Param.Rules.Where(r => r.IsViolated(value.Value));

                        foreach (var rule in brokenRules)
                        {
                            var brokenConsequence = value.Param.Consequences.FirstOrDefault(r => r.IsViolated(value.Value));

                            await _store.Alerts.AddAsync(new Alert()
                            {
                                ParamId = value.ParamId,
                                RuleId = rule.RuleId,
                                ValueId = value.ValueId,
                                ConsId = brokenConsequence?.ConsId
                            }, cancellationToken);
                        }

                        value.IsChecked = 1;

                        await _store.SaveChangesAsync(cancellationToken);
                    }
                    else
                    {
                        await Task.Delay(5000, cancellationToken);
                    }
                }
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
