using System;
using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class AllProducts : SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }
    }
}
