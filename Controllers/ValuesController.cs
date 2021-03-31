using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace iguesnetcoreapi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ValuesController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] {"Api .Net Core", "Projeto para dockerização", "Igues de Lacerda"};
        }
    }
}