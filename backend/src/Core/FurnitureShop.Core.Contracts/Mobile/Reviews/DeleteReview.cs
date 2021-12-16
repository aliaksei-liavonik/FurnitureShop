using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class DeleteReview : IRemoteCommand
    {
        public Guid Id { get; set; }
        public static class ErrorCodes
        {

        }
    }
}
