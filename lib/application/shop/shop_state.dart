part of 'shop_bloc.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({
    @Default([]) List<ShopData> shops,
    @Default([]) List<ShopData> shopsPopular,
    @Default([]) List<ShopData> shopsNew,
    @Default([]) List<ShopData> likeShops,
    @Default([]) List<ShopData> nearShops,
    @Default([]) List<Galleries> shopImages,
    @Default(null) FilterShopModel? filter,
    @Default(null) ShopData? shop,
    @Default(true) bool isLoadingPopular,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadingNear,
    @Default(true) bool isLoadingLike,
    @Default("") String shopLink,
  }) = _ShopState;
}