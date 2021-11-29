using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Review
{
    [AllowUnauthorized]
    public class CreateReview : IRemoteCommand
    {
        public string Arg { get; set; }

        public static class ErrorCodes
        {
            public const int EmptyArg = 1;
        }
    }
}
