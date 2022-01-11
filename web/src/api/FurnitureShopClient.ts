/*eslint-disable import/no-anonymous-default-export, prettier/prettier*/
import { CQRS } from "./index";
import { CategoryById, CategoryDTO, CreateCategory, DeleteCategory, GetAllCategories, UpdateCategory, ComplaintById, ComplaintDTO, CreateComplaint, DeleteComplaint, GetAllComplaints, PaginatedResult, UpdateComplaint, CreateOrder, OrderById, OrderDTO, DeleteProduct, GetAllProducts, ProductDTO, ProductById, ProductWithDetailsDTO, UpdateProduct, CreateReview, DeleteReview, GetAllReviews, ReviewDTO, ReviewById, UpdateReview, RegisterUser, UpdateProfile, UserInfo, UserInfoDTO, CreateProduct } from "./FurnitureShopTypes";
export default function (cqrsClient: CQRS) {
    return {
        CategoryById: cqrsClient.createQuery<CategoryById, CategoryDTO>("FurnitureShop.Core.Contracts.Mobile.Categories.CategoryById"),
        CreateCategory: cqrsClient.createCommand<CreateCategory, CreateCategory.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Categories.CreateCategory", CreateCategory.ErrorCodes),
        DeleteCategory: cqrsClient.createCommand<DeleteCategory, DeleteCategory.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Categories.DeleteCategory", DeleteCategory.ErrorCodes),
        GetAllCategories: cqrsClient.createQuery<GetAllCategories, CategoryDTO[]>("FurnitureShop.Core.Contracts.Mobile.Categories.GetAllCategories"),
        UpdateCategory: cqrsClient.createCommand<UpdateCategory, UpdateCategory.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Categories.UpdateCategory", UpdateCategory.ErrorCodes),
        ComplaintById: cqrsClient.createQuery<ComplaintById, ComplaintDTO>("FurnitureShop.Core.Contracts.Mobile.Complaints.ComplaintById"),
        CreateComplaint: cqrsClient.createCommand<CreateComplaint, {}>("FurnitureShop.Core.Contracts.Mobile.Complaints.CreateComplaint", {}),
        DeleteComplaint: cqrsClient.createCommand<DeleteComplaint, {}>("FurnitureShop.Core.Contracts.Mobile.Complaints.DeleteComplaint", {}),
        GetAllComplaints: cqrsClient.createQuery<GetAllComplaints, PaginatedResult<ComplaintDTO>>("FurnitureShop.Core.Contracts.Mobile.Complaints.GetAllComplaints"),
        UpdateComplaint: cqrsClient.createCommand<UpdateComplaint, {}>("FurnitureShop.Core.Contracts.Mobile.Complaints.UpdateComplaint", {}),
        CreateOrder: cqrsClient.createCommand<CreateOrder, CreateOrder.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Orders.CreateOrder", CreateOrder.ErrorCodes),
        OrderById: cqrsClient.createQuery<OrderById, OrderDTO>("FurnitureShop.Core.Contracts.Mobile.Orders.OrderById"),
        DeleteProduct: cqrsClient.createCommand<DeleteProduct, {}>("FurnitureShop.Core.Contracts.Mobile.Products.DeleteProduct", {}),
        GetAllProducts: cqrsClient.createQuery<GetAllProducts, PaginatedResult<ProductDTO>>("FurnitureShop.Core.Contracts.Mobile.Products.GetAllProducts"),
        ProductById: cqrsClient.createQuery<ProductById, ProductWithDetailsDTO>("FurnitureShop.Core.Contracts.Mobile.Products.ProductById"),
        UpdateProduct: cqrsClient.createCommand<UpdateProduct, UpdateProduct.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Products.UpdateProduct", UpdateProduct.ErrorCodes),
        CreateReview: cqrsClient.createCommand<CreateReview, {}>("FurnitureShop.Core.Contracts.Mobile.Reviews.CreateReview", {}),
        DeleteReview: cqrsClient.createCommand<DeleteReview, {}>("FurnitureShop.Core.Contracts.Mobile.Reviews.DeleteReview", {}),
        GetAllReviews: cqrsClient.createQuery<GetAllReviews, PaginatedResult<ReviewDTO>>("FurnitureShop.Core.Contracts.Mobile.Reviews.GetAllReviews"),
        ReviewById: cqrsClient.createQuery<ReviewById, ReviewDTO>("FurnitureShop.Core.Contracts.Mobile.Reviews.ReviewById"),
        UpdateReview: cqrsClient.createCommand<UpdateReview, {}>("FurnitureShop.Core.Contracts.Mobile.Reviews.UpdateReview", {}),
        RegisterUser: cqrsClient.createCommand<RegisterUser, RegisterUser.ErrorCodes>("FurnitureShop.Core.Contracts.Mobile.Users.RegisterUser", RegisterUser.ErrorCodes),
        UpdateProfile: cqrsClient.createCommand<UpdateProfile, {}>("FurnitureShop.Core.Contracts.Mobile.Users.UpdateProfile", {}),
        UserInfo: cqrsClient.createQuery<UserInfo, UserInfoDTO>("FurnitureShop.Core.Contracts.Mobile.Users.UserInfo"),
        CreateProduct: cqrsClient.createCommand<CreateProduct, CreateProduct.ErrorCodes>("FurnitureShop.Core.Contracts.Web.Products.CreateProduct", CreateProduct.ErrorCodes)
    };
}
