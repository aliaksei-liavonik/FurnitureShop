using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Example;
using LeanCode.CQRS.Execution;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Complaint
{
    public class ExampleCommandCV : ContextualValidator<ExampleCommand>
    {
        public ExampleCommandCV()
        {
            RuleFor(c => c.Arg)
                .Cascade(CascadeMode.Stop)
                .NotNull()
                .WithCode(ExampleCommand.ErrorCodes.EmptyArg)
                .NotEmpty()
                .WithCode(ExampleCommand.ErrorCodes.EmptyArg);
        }
    }

    public class CreateComplaintCH : ICommandHandler<CoreContext, ExampleCommand>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<CreateComplaintCH>();

        public Task ExecuteAsync(CoreContext context, ExampleCommand command)
        {
            logger.Information("ExampleCommandCH called");
            return Task.CompletedTask;
        }
    }
}
