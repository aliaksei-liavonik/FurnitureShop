using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Category
{
    [AllowUnauthorized]
    public class CreateCategory : IRemoteCommand
    {
        public string CategoryName { get; set; }

        public static class ErrorCodes
        {
            public const int EmptyArg = 1;
        }
    }
}
