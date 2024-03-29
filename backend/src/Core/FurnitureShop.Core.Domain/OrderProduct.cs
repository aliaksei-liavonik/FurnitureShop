using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class OrderProduct : IAggregateRoot<Id<OrderProduct>>
    {
        public Id<OrderProduct> Id { get; set; }
        public Id<Order> OrderId { get; set; }
        public Id<Product> ProductId { get; set; }
        public int Amount { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public OrderProduct()
        {
            Id = Id<OrderProduct>.New();
        }
    }
}
