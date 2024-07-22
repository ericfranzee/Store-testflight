part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<ShopData> shops,
    @Default([]) List<ProductData> products,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default(false) bool isShopLoading,
    @Default(false) bool isProductLoading,
    @Default(false) bool isCategoryLoading,
    @Default(false) bool isBrandLoading,
    @Default("") String query,
  }) = _SearchState;
}
