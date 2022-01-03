using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    public class ProductDetailsDTO
    {
        public string Description { get; set; }
        public string? ModelUrl { get; set; }
        public ProductInfoDTO ProductInfo { get; set; }
    }
    public class ProductInfoDTO
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public double AvergeRating { get; set; }
        public string? PreviewPhotoURL { get;set; }
        public Guid? CategoryId { get; set; }
    }

    public class ProductDetailsDTO
    {
        public Guid Id { get; set; }
        public ProductDetailsDTO ProductDetails { get; set; }
    }
    public class ProductDTO
    {
        public Guid Id { get; set; }
        public ProductInfoDTO ProductInfo { get; set; }
    }
}
