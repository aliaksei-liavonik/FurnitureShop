using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Product : IAggregateRoot<Id<Product>>
    {
        public Id<Product> Id { get; set; }
        public Id<Category>? CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string? ModelId { get; set; }
        public double Price { get; set; }
        public string? PreviewPhotoId { get; set; }
        public List<Review> Reviews { get; set; }
        public List<OrderProduct> OrdersProducts { get; set; }
        public List<ShoppingCartProduct> ShoppingCartProducts { get; set; }
        public List<Photo> Photos { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Product(string name, string description, double price)
        {
            Id = Id<Product>.New();
            Name = name;
            Description = description;
            Price = price;
            OrdersProducts = new List<OrderProduct>();
            ShoppingCartProducts = new List<ShoppingCartProduct>();
            Reviews = new List<Review>();
            Photos = new List<Photo>();
        }
    }
}
