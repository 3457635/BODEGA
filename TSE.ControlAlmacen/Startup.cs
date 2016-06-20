using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TSE.ControlAlmacen.Startup))]
namespace TSE.ControlAlmacen
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
