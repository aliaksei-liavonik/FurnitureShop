using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Product
    {
        public Product(string name,decimal price,string desc,string pictureURL, Category ctg)
        {
            this.Name = name;
            this.Price = price;
            this.Description = desc;
            this.PictureURL = pictureURL;
            this.Category = ctg;
        }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string PictureURL { get; set; }
        public Category Category { get; set; }
    }
}
