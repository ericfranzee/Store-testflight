part of 'checkout_bloc.dart';

@freezed
abstract class CheckoutEvent with _$CheckoutEvent {

  const factory CheckoutEvent.deleteAddress({
    required BuildContext context,
    required int addressId,
    required int index,
  }) = DeleteAddress;

  const factory CheckoutEvent.selectAddress({
    required int index,
  }) = SelectAddress;

  const factory CheckoutEvent.fetchUserAddress(
      {required BuildContext context,
        bool? isRefresh,
        RefreshController? controller}) = FetchUserAddress;


  const factory CheckoutEvent.changeStep({required BuildContext context, int? step}) =
      ChangeStep;

  const factory CheckoutEvent.changeActive({required bool active}) =
  ChangeActive;


  const factory CheckoutEvent.fetchPayments({required BuildContext context}) =
      FetchPayments;

  const factory CheckoutEvent.changePayment({required int id}) = ChangePayment;

  const factory CheckoutEvent.changeDate({required DateTime date}) = ChangeDate;

  const factory CheckoutEvent.fetchDeliveryPoint(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchDeliveryPoint;

  const factory CheckoutEvent.fetchDeliveryPrice(
      {required BuildContext context}) = FetchDeliveryPrice;

  const factory CheckoutEvent.selectPoint({required DeliveryPoint? point}) = SelectPoint;

  const factory CheckoutEvent.setMapController({required GoogleMapController controller}) = SetMapController;

}
