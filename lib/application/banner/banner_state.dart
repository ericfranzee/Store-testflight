part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default([]) List<BannerData> banners,
    @Default([]) List<BannerData> adsBanners,
    @Default([]) List<BannerData> looks,
    @Default([]) List<ProductData> products,
    @Default([]) List<ShopAdsPackage> shopAds,
    @Default([]) List<AdModel> shopListAds,
    @Default(true) bool isLoadingBanner,
    @Default(true) bool isLoadingProduct,
  }) = _BannerState;
}
