part of 'brand_bloc.dart';


@freezed
class BrandState with _$BrandState {
  const factory BrandState({
    @Default([]) List<BrandData> brands,
    @Default(true) bool isLoading,
  }) = _BrandState;
}
