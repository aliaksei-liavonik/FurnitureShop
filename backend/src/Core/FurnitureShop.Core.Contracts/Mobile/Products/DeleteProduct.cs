using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class DeleteProduct : IRemoteCommand
    {
        public Guid Id { get; set; }
    }
}
