using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Dtos;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class MyOrders : SortableMulitiFilterPaginatedQuery<OrderDTO, MyOrdersSortFieldDTO?, MyOrdersFilterFieldDTO>
    {
        public static class ErrorCodes
        {
            public const int IncorrectStatus = 1;
        }
    }
    public enum MyOrdersSortFieldDTO
    {
        OrderedDate = 0,
        DeliveredDate = 1,
    }
    public enum MyOrdersFilterFieldDTO
    {
        OrderState = 0,
    }
}
