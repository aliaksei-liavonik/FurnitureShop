using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class CreateOrder : IRemoteCommand
    {
        public OrderInfoDTO OrderInfo { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectAddress = 1;
            public const int NoProducts = 2;
        }
    }
}
