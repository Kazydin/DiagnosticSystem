using DiagnosticSystem.DAL;

using Microsoft.AspNetCore.Mvc;

namespace DiagnosticSystem.Features
{
    [Route("api")]
    [ApiController]
    public class BaseController : Controller
    {
        protected Store _store;

        public BaseController(Store store)
        {
            _store = store;
        }
    }
}
