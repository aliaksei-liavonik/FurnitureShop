using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Order
    {
        public Order(AuthUser user,decimal price,OrderState state,DateTime orderStartedDate, Address deliveryAddress, List<Product> products)
        {
            this.User = user;
            this.Price = price;
            this.State = state;
            this.OrderStartedDate = orderStartedDate;
            this.DeliveryAddress = deliveryAddress;
            this.Products = products;
        }
        public Guid Id {get;set;}
        public AuthUser User {get;set;}
        public Complaint? Complaint {get;set;}
        public decimal Price {get;set;}
        public OrderState State {get;set;}
        public DateTime OrderStartedDate {get;set;}
        public DateTime? OrderedFinishedDate {get;set;}
        public Address DeliveryAddress {get;set;}
        public List<Product> Products {get;set;}
    }
    public enum OrderState
    {
        Pending,
        InProgres,
        Cancelled,
        Finallized
    }
}
