export type Query<TResult> = {};
export type Command = {};
export interface Auth {
}
export interface Clients {
}
export namespace Clients {
    export const AdminApp = "admin_app";
    export const ClientApp = "client_app";
}
export interface KnownClaims {
}
export namespace KnownClaims {
    export const UserId = "sub";
    export const Role = "role";
}
export interface Roles {
}
export namespace Roles {
    export const User = "user";
    export const Admin = "admin";
}
export interface Scopes {
}
export namespace Scopes {
    export const InternalApi = "internal_api";
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface CategoryById extends Query<CategoryDTO> {
    Id: string;
}
export interface CategoryDTO {
    Id: string;
    Name: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface CreateCategory extends Command {
    CategoryName: string;
}
export namespace CreateCategory {
    export const ErrorCodes = {
        EmptyArgs: 1
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface DeleteCategory extends Command {
    Id: string;
}
export namespace DeleteCategory {
    export const ErrorCodes = {
        EmptyArgs: 1
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface GetAllCategories extends Query<CategoryDTO[]> {
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface UpdateCategory extends Command {
    Id: string;
    NewName: string;
}
export namespace UpdateCategory {
    export const ErrorCodes = {
        EmptyArgs: 1
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface ComplaintById extends Query<ComplaintDTO> {
    Id: string;
}
export interface ComplaintDTO {
    Id: string;
    ComplaintInfo: ComplaintInfoDTO;
}
export interface ComplaintInfoDTO {
    UserId?: string;
    OrderId?: string;
    Text: string;
    Response?: string;
    CreatedDate: string;
    Resolved: boolean;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface CreateComplaint extends Command {
    ComplaintInfo: ComplaintInfoDTO;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface DeleteComplaint extends Command {
    Id: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface GetAllComplaints extends PaginatedQuery<ComplaintDTO> {
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface UpdateComplaint extends Command {
    Id: string;
    ComplaintInfo: ComplaintInfoDTO;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface CreateOrder extends Command {
    OrderInfo: OrderInfoDTO;
}
export namespace CreateOrder {
    export const ErrorCodes = {
        IncorrectAddress: 1,
        NoProducts: 2
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface OrderById extends Query<OrderDTO> {
    Id: string;
}
export interface OrderDTO {
    Id: string;
    OrderInfo: OrderInfoDTO;
}
export interface OrderInfoDTO {
    UserId?: string;
    Price: number;
    Street: string;
    City: string;
    State: string;
    PostalCode: string;
    Country: string;
    OrderState: string;
    OrderedDate: string;
    DeliveredDate?: string;
    OrderProducts: OrderProductDTO[];
}
export interface OrderProductDTO {
    ProductId?: string;
    Amount: number;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface DeleteProduct extends Command {
    Id: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface GetAllProducts extends SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO> {
    CategoryId?: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface ProductById extends Query<ProductWithDetailsDTO> {
    Id: string;
}
export enum ProductsSortFieldDTO {
    Name = 0,
    Rating = 1
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface UpdateProduct extends Command {
    Id: string;
    ProductDetails: ProductDetailsDTO;
}
export namespace UpdateProduct {
    export const ErrorCodes = {
        IncorrectName: 1,
        IncorrectDescription: 2,
        IncorrectPrice: 3
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface CreateReview extends Command {
    ReviewInfo: ReviewInfoDTO;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface DeleteReview extends Command {
    Id: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface GetAllReviews extends PaginatedQuery<ReviewDTO> {
    ProductId: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface ReviewById extends Query<ReviewDTO> {
    Id: string;
}
export interface ReviewDTO {
    Id: string;
    ReviewInfo: ReviewInfoDTO;
}
export interface ReviewInfoDTO {
    UserId?: string;
    ProductId?: string;
    Text: string;
    Rating: number;
    CreatedDate: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface UpdateReview extends Command {
    Id: string;
    ReviewInfo: ReviewInfoDTO;
}
/**
 * @attribute LeanCode.CQRS.Security.AllowUnauthorizedAttribute
 */
export interface RegisterUser extends Command {
    UserInfo: UserInfoDTO;
    Password: string;
}
export namespace RegisterUser {
    export const ErrorCodes = {
        UserDTOIsNull: 1,
        PasswordTooWeak: 2
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface UpdateProfile extends Command {
    Firstname?: string;
    Surname?: string;
    Username?: string;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface UserInfo extends Query<UserInfoDTO> {
}
export interface UserInfoDTO {
    Firstname: string;
    Surname: string;
    Username: string;
    EmailAddress: string;
}
export interface PaginatedQuery<TResult> extends Query<PaginatedResult<TResult>> {
    PageNumber: number;
    PageSize: number;
}
export interface PaginatedResult<TResult> {
    Items: TResult[];
    TotalCount: number;
}
export interface ProductDetailsDTO {
    Description: string;
    ModelUrl?: string;
    ProductInfo: ProductInfoDTO;
}
export interface ProductDTO {
    Id: string;
    ProductInfo: ProductInfoDTO;
}
export interface ProductInfoDTO {
    Name: string;
    Price: number;
    AverageRating?: number;
    PreviewPhotoURL?: string;
    CategoryId?: string;
}
export interface ProductWithDetailsDTO {
    Id: string;
    ProductDetails: ProductDetailsDTO;
}
export interface SortablePaginatedQuery<TResult, TBy> extends PaginatedQuery<TResult> {
    FilterBy?: string;
    SortBy: TBy;
    SortByDescending: boolean;
}
/**
 * @attribute LeanCode.CQRS.Security.AuthorizeWhenHasAnyOfAttribute
 */
export interface CreateProduct extends Command {
    ProductDetails: ProductDetailsDTO;
}
export namespace CreateProduct {
    export const ErrorCodes = {
        IncorrectName: 1,
        IncorrectDescription: 2,
        IncorrectPrice: 3
    } as const;
    export type ErrorCodes = typeof ErrorCodes;
}
