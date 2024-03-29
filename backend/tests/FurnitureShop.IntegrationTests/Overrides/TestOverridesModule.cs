using Autofac;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.Components;
using LeanCode.IntegrationTestHelpers;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace FurnitureShop.IntegrationTests.Overrides
{
    public sealed class TestOverridesPreModule : AppModule
    {
        public override void ConfigureServices(IServiceCollection services)
        {
            services.AddHostedService<DbContextInitializer<CoreDbContext>>();
        }
    }

    public sealed class TestOverridesPostModule : AppModule
    {
        public TestOverridesPostModule() { }

        protected override void Load(ContainerBuilder builder)
        {
            builder.Register(c => c.Resolve<CoreDbContext>()).As<DbContext>();
        }
    }
}
