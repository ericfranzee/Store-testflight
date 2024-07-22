part of 'brand_bloc.dart';

@freezed
abstract class BrandEvent with _$BrandEvent {
  const factory BrandEvent.fetchBrands(
      {required BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller}) = FetchBrands;


}
