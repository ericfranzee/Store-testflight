part of 'shop_bloc.dart';

@freezed
abstract class ShopEvent with _$ShopEvent {
  const factory ShopEvent.fetchShops(
      {required BuildContext context,
      bool? isRefresh,
      FilterShopModel? filter,
      RefreshController? controller}) = FetchShops;

  const factory ShopEvent.fetchNewShops(
      {required BuildContext context,
      bool? isRefresh,
      FilterShopModel? filter,
      RefreshController? controller}) = FetchNewShops;

  const factory ShopEvent.fetchNearShops({
    required BuildContext context,
    bool? isRefresh,
    FilterShopModel? filter,
    RefreshController? controller,
    int? withoutShopId,
    int? category,
    required VoidCallback onSuccess,
    required LocationModel? location,
  }) = FetchNearShops;

  const factory ShopEvent.fetchPopularShops(
      {required BuildContext context,
      bool? isRefresh,
      FilterShopModel? filter,
      RefreshController? controller}) = FetchPopularShops;

  const factory ShopEvent.fetchLikeShops(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchLikeShops;

  const factory ShopEvent.generateLink({required BuildContext context}) =
      GenerateLink;

  const factory ShopEvent.fetchShopById(
      {required BuildContext context, required ShopData? shop}) = FetchShopById;

  const factory ShopEvent.updateState() = UpdateState;

  const factory ShopEvent.fetchShopsImages(
      {required BuildContext context, required int? shopId}) = FetchShopsImages;

  const factory ShopEvent.setFilter(
      { required FilterShopModel? filter}) = SetFilter;
}
