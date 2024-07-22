part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<ProductData> mostSaleProduct,
    @Default([]) List<ProductData> mostSaleShopProduct,
    @Default([]) List<ProductData> newProduct,
    @Default([]) List<ProductData> newShopProduct,
    @Default([]) List<ProductData> commonProduct,
    @Default([]) List<ProductData> likeProducts,
    @Default([]) List<ProductData> discountProduct,
    @Default([]) List<ProductData> allProductList,
    @Default(true) bool isLoadingMostSale,
    @Default(true) bool isLoadingNew,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingLike,
    @Default(true) bool isLoadingDiscount,
    @Default(0) int newProductCount,
    @Default(0) int mostSaleProductCount,
    @Default(0) int totalCount,
  }) = _ProductState;
}
