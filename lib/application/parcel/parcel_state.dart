part of 'parcel_bloc.dart';

@freezed
class ParcelState with _$ParcelState {
  const factory ParcelState({
    @Default(false) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(false) bool isMapLoading,
    @Default(false) bool error,
    @Default(null) LocationModel? locationFrom,
    @Default(null) LocationModel? locationTo,
    @Default(null) String? addressTo,
    @Default(null) String? addressFrom,
    @Default(null) TimeOfDay? time,
    @Default(null) ParcelCalculateResponse? calculate,
    @Default([]) List<TypeModel?> types,
    @Default(0) int selectType,
    @Default(false) bool expand,
    @Default(false) bool anonymous,
    @Default(null) ParcelOrder? parcel,
  }) = _ParcelState;
}
