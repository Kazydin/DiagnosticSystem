using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.DataProtection.KeyManagement.Internal;
using Microsoft.EntityFrameworkCore;

namespace DiagnosticSystem.Services
{
    public class MonitoringService : IHostedService
    {
        private Store _store;

        private int _lastValueId = 0;

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
                    var value = await _store.ParamValues.Where(p => p.).FirstOrDefaultAsync(cancellationToken);

                    if (value != null)
                    {
                        var brokenRules = _paramRules.Where(p => p.ParamId == value.ParamId && value.Value >= p.MinValue && value.Value <= p.MaxValue);

                        foreach (var rule in brokenRules)
                        {
                            _store.Alerts.Add(new Alert()
                            {
                                ParamId = value.ParamId,
                                RuleId = rule.RuleId,
                                ValueId = value.ValueId
                            });
                        }

                        await _store.SaveChangesAsync(cancellationToken);

                        _lastValueId = value.ValueId;
                    }

                    await Task.Delay(5000, cancellationToken);
                }
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
