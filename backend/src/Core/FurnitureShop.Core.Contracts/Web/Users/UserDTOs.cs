using System;

namespace FurnitureShop.Core.Contracts.Web.Users
{
    public class UserInfoDTO
    {
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public bool isBanned { get; set; }
    }
}