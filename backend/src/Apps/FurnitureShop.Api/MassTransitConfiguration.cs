using System;
using FurnitureShop.Core.Services.DataAccess.Serialization;
using GreenPipes;
using LeanCode.DomainModels.MassTransitRelay;
using LeanCode.DomainModels.MassTransitRelay.Middleware;
using MassTransit;
using MassTransit.AutofacIntegration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

namespace FurnitureShop.Api
{
    public static class MassTransitConfiguration
    {
        private const string QueueName = "furnitureshop-api-events";

        public static Action<IContainerBuilderBusConfigurator> ConfigureBus(
            IConfiguration configuration,
            IWebHostEnvironment hostEnv
        )
        {
            if (hostEnv.IsDevelopment())
            {
                return InMemory;
            }
            else
            {
                var connString = Config.ConnectionString.AzureServiceBusConnectionstring(
                    configuration
                );
                return cfg => ServiceBus(cfg, connString);
            }
        }

        private static void InMemory(IContainerBuilderBusConfigurator cfg)
        {
            cfg.UsingInMemory(
                (ctx, cfg) =>
                {
                    ConfigureBusCommon(ctx, cfg);
                }
            );
        }

        private static void ServiceBus(
            IContainerBuilderBusConfigurator busCfg,
            string asbConnString
        )
        {
            busCfg.AddServiceBusMessageScheduler();

            busCfg.UsingAzureServiceBus(
                (ctx, cfg) =>
                {
                    cfg.Host(
                        asbConnString,
                        host =>
                        {
                            host.RetryLimit = 5;
                            host.RetryMinBackoff = TimeSpan.FromSeconds(3);
                        }
                    );

                    cfg.UseServiceBusMessageScheduler();
                    ConfigureBusCommon(ctx, cfg);
                }
            );
        }

        private static void ConfigureBusCommon(
            IBusRegistrationContext ctx,
            IBusFactoryConfigurator cfg
        )
        {
            cfg.ConfigureJsonSerializer(KnownConverters.AddAll);
            cfg.ConfigureJsonDeserializer(KnownConverters.AddAll);

            cfg.ReceiveEndpoint(
                QueueName,
                rcv =>
                {
                    rcv.UseLogsCorrelation();
                    rcv.UseRetry(
                        retryConfig =>
                            retryConfig.Incremental(
                                5,
                                TimeSpan.FromSeconds(1),
                                TimeSpan.FromSeconds(5)
                            )
                    );
                    rcv.UseConsumedMessagesFiltering(ctx);
                    rcv.StoreAndPublishDomainEvents(ctx);

                    rcv.ConfigureConsumers(ctx);
                    rcv.ConnectReceiveEndpointObservers(ctx);
                }
            );

            cfg.ConnectBusObservers(ctx);
        }
    }
}
