part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(true) bool isLoadingPoint,
    @Default(true) bool isLoading,
    @Default(false) bool isActive,
    @Default(0) int selectAddress,
    @Default(1) int step,
    @Default(-1) int selectId,
    @Default(-1) int selectPointId,
    @Default(null) DateTime? deliveryDate,
    @Default([]) List<PaymentData>? list,
    @Default([]) List<DeliveryPoint>? deliveryPoints,
    @Default([]) List<DeliveryPoint>? deliveryPrice,
    @Default([]) List<UserAddress> address,
    GoogleMapController? mapController,
    Set<Marker>? markers,
  }) = _CheckoutState;
}
