part of 'product_detail_bloc.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default([]) List<ProductData> relatedProduct,
    @Default([]) List<ProductData> viewedProduct,
    @Default([]) List<ProductData> buyWithProduct,
    @Default(null) ProductData? product,
    @Default([]) List<TypedExtra> typedExtras,
    @Default([]) List<Stocks> initialStocks,
    @Default([]) List<int> selectedIndexes,
    @Default([]) List<Galleries> galleries,
    @Default(true) bool jumpTo,
    @Default(true) bool nextImageTo,
    @Default(true) bool isLoading,
    @Default(true) bool isLoadingNew,
    @Default(0) int totalCount,
    @Default(0) int stockCount,
    @Default(null) Galleries? selectImage,
    @Default(null) Stocks? selectedStock,
  }) = _ProductDetailState;
}
