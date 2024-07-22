part of 'product_detail_bloc.dart';

@freezed
abstract class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.fetchProductById({
    required BuildContext context,
    RefreshController? controller,
    ProductData? product,
  }) = FetchProductById;

  const factory ProductDetailEvent.fetchRelatedProduct(
      {required BuildContext context,
      required String? productUuid,
      bool? isRefresh,
      RefreshController? controller}) = FetchRelatedProduct;

  const factory ProductDetailEvent.fetchViewedProducts(
      {required BuildContext context,
      required int? productId,
      bool? isRefresh,
      RefreshController? controller}) = FetchViewedProducts;

  const factory ProductDetailEvent.fetchBuyWithProduct(
      {required BuildContext context,
        required int? productId,
        bool? isRefresh,
        RefreshController? controller}) = FetchBuyWithProduct;


  const factory ProductDetailEvent.updateState() = UpdateState;

  const factory ProductDetailEvent.setSelectedIndexes(
      {required List<int> indexes,
      required BuildContext context}) = SetSelectedIndexes;

  const factory ProductDetailEvent.updateExtras() = UpdateExtras;

  const factory ProductDetailEvent.updateSelectedIndexes(
      int index, int value, BuildContext context) = UpdateSelectedIndexes;

  const factory ProductDetailEvent.selectImage(
      {required Galleries image, bool? jumpTo, bool? nextImageTo}) = SelectImage;
}
