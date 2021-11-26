using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Example;
using LeanCode.CQRS.Execution;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Review
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

    public class CreateReviewCH : ICommandHandler<CoreContext, ExampleCommand>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<CreateReviewCH>();

        public Task ExecuteAsync(CoreContext context, ExampleCommand command)
        {
            logger.Information("ExampleCommandCH called");
            return Task.CompletedTask;
        }
    }
}
