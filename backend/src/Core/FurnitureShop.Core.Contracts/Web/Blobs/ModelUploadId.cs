using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Blobs
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class ModelUploadId : IRemoteQuery<string>
    {
        public static class ErrorCodes
        {
            public const int ConnectionError = 1;
        }
    }
}