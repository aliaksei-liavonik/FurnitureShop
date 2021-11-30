using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Address
    {
        public Address(string streetNumber, string street, string city, string state, string postalCode, string country)
        {
            this.State = state;
            this.Street = street;
            this.Country = country;
            this.PostalCode = postalCode;
            this.StreetNumber = streetNumber;
            this.City = city;
        }

        public Guid Id { get; set; }
        public string StreetNumber { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
    }
}
