using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Services.DataAccess.Entities
{
    public class Address
    {
        public Address(string streetnum,string street,string city, string state, string postalcode, string country)
        {
            this.State = state;
            this.Street =street;
            this.Country = country;
            this.PostalCode = postalcode;
            this.StreetNumber = streetnum;
            this.City = city;
        }
        public Guid Id {get;set;}
        public string StreetNumber {get;set;}
        public string Street {get;set;}
        public string City {get;set;}
        public string State {get;set;}
        public string PostalCode {get;set;}
        public string Country {get;set;}
    }
}
