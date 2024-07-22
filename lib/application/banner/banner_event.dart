part of 'banner_bloc.dart';

@freezed
abstract class BannerEvent with _$BannerEvent {
  const factory BannerEvent.fetchBanner(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchBanner;

  const factory BannerEvent.fetchAdsBanner(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchAdsBanner;

  const factory BannerEvent.fetchLooks(
      {required BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller}) = FetchLooks;

  const factory BannerEvent.fetchProduct(
      {required BuildContext context, required int id}) = FetchProduct;


  const factory BannerEvent.updateProduct() = UpdateProduct;



  const factory BannerEvent.fetchAdsProduct(
      {required BuildContext context, required int id}) = FetchAdsProduct;

  const factory BannerEvent.fetchAdsListProduct(
      {required BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller}) = FetchAdsListProduct;
}
