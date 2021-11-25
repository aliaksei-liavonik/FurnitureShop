using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Product
    {
        public Product(string Name,decimal Price,string Desc,string PictureURL, Category Ctg)
        {
            this.Name = Name;
            this.Price = Price;
            this.Description = Desc;
            this.PictureURL = PictureURL;
            this.Category = Ctg;
        }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string PictureURL { get; set; }
        public Category Category { get; set; }
    }
}
