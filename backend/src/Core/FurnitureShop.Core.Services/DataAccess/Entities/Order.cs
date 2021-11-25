using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Order
    {
        public Order(AuthUser User,decimal Price,OrderState State,DateTime OrderStartedDate, Address DeliveryAddress)
        {
            this.User = User;
            this.Price = Price;
            this.State = State;
            this.OrderStartedDate = OrderStartedDate;
            this.DeliveryAddress = DeliveryAddress;
        }
        public Guid Id {get;set;}
        public AuthUser User {get;set;}
        public Complaint? Complaint {get;set;}
        public decimal Price {get;set;}
        public OrderState State {get;set;}
        public DateTime OrderStartedDate {get;set;}
        public DateTime? OrderedFinishedDate {get;set;}
        public Address DeliveryAddress {get;set;}
    }
    public enum OrderState
    {
        Pending,
        InProgres,
        Cancelled,
        Finallized
    }
}
