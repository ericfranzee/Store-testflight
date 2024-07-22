part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.fetchMostSaleProduct(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchMostSaleProduct;

  const factory ProductEvent.fetchAllProduct(
      {required BuildContext context,
        bool? isRefresh,
        RefreshController? controller}) = FetchAllProduct;

  const factory ProductEvent.fetchNewProduct(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchNewProduct;

  const factory ProductEvent.fetchLikeProduct(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchLikeProduct;

  const factory ProductEvent.fetchDiscountProduct(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchDiscountProduct;

  const factory ProductEvent.fetchMostSaleShopProduct(
      {required BuildContext context,
      required int? shopId,
      bool? isRefresh,
      RefreshController? controller}) = FetchMostSaleShopProduct;



  const factory ProductEvent.fetchNewShopProduct(
      {required BuildContext context,
      required int? shopId,
      bool? isRefresh,
      RefreshController? controller}) = FetchNewShopProduct;

  const factory ProductEvent.fetchProducts({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
    List<ProductData>? list,
    bool? isNewProduct,
    bool? isMostSaleProduct,
    int? categoryId,
    int? shopId,
    int? bannerId,
    List<int>? brandId,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  }) = FetchProducts;


  const factory ProductEvent.updateState() = UpdateState;


}
