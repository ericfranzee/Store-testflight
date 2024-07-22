part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default([]) List<CountryModel> countries,
    @Default([]) List<CityModel> cities,
    @Default([]) List<UserAddress> address,
    @Default([]) List<AutocompletePrediction> autoTitles,
    @Default(true) bool isLoading,
    @Default(true) bool isCityLoading,
    @Default(false) bool isButtonLoading,
    @Default(0) int selectAddress,
  }) = _AddressState;
}
