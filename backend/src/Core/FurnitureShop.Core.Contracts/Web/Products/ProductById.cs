using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Web.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class ProductById : IRemoteQuery<ProductDetailsDTO?>
    {
        public Guid Id { get; set; }
    }
}
