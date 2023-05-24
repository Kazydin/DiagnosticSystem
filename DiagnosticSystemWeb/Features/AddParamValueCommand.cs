using DiagnosticSystem.DAL.Models;
using DiagnosticSystem.DAL;

using Microsoft.AspNetCore.Mvc;

namespace DiagnosticSystem.Features
{
    public class AddParamValueCommand : BaseController
    {
        public AddParamValueCommand(Store store) : base(store)
        {
        }

        [Route("params")]
        [HttpPost]
        public async Task<IActionResult> RunAsync(ParamValueDto dto, CancellationToken cancellationToken)
        {
            try
            {
                var paramValue = new ParamValue()
                {
                    ParamId = dto.ParamId,
                    Value = dto.Value,
                    DateTime = DateTime.Now
                };

                await _store.ParamValues.AddAsync(paramValue, cancellationToken);


                await _store.SaveChangesAsync(cancellationToken);

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
