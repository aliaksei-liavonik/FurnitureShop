using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    public class OrderDTOBase
    {
        public Guid? UserId { get; set; }
        public double Price { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<OrderProductDTO> OrderProducts { get; set; }
    }

    public class OrderDTO : OrderDTOBase
    {
        public Guid Id { get; set; }
    }
    public class OrderProductDTO
    {
        public Guid OrderId { get; set; }
        public ProductDTO Product { get; set; }
        public int Amount { get; set; }
    }
}
