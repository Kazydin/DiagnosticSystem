using DiagnosticSystem.DAL;
using DiagnosticSystem.DAL.Models;

using Microsoft.AspNetCore.Mvc;

namespace DiagnosticSystem.Features
{
    public class CreateRuleCommand : BaseController
    {
        public CreateRuleCommand(Store store) : base(store)
        {
        }

        [Route("rules")]
        [HttpPost]
        public async Task<IActionResult> RunAsync(ParamRuleDto ruleDto, CancellationToken cancellationToken)
        {
            try
            {
                var rule = new ParamRule(ruleDto);

                var addResult = await _store.ParamRules.AddAsync(rule, cancellationToken);

                rule = addResult.Entity;

                await _store.SaveChangesAsync(cancellationToken);

                return Ok(rule);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }
    }
}
