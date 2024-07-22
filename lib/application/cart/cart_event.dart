part of 'cart_bloc.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.getCart(
      {required BuildContext context, bool? refresh, String? coupon}) = GetCart;

  const factory CartEvent.insertCart(
      {required BuildContext context,
      bool? refresh,
      String? coupon,
      required VoidCallback onSuccess}) = InsertCart;

  const factory CartEvent.removeProductCart(
      {required BuildContext context,
      required int? cartDetailId}) = RemoveProductCart;

  const factory CartEvent.setNotes(
      {required int stockId, required String note}) = SetNotes;

  const factory CartEvent.changeReady(
      {required BuildContext context,
      required String uuid,
      required VoidCallback onSuccess}) = ChangeReady;

  const factory CartEvent.startGroupOrder(
      {required BuildContext context,
      required VoidCallback onSuccess}) = StartGroupOrder;

  const factory CartEvent.createLink({required BuildContext context}) =
      CreateLink;

  const factory CartEvent.deleteCart({required BuildContext context}) =
      DeleteCart;

  const factory CartEvent.deleteUser(
      {required BuildContext context,
      required String uuid,
      required VoidCallback onSuccess}) = DeleteUser;

  const factory CartEvent.checkCoupon(
      {required BuildContext context,
      required String coupon,
      required int shopId,
      bool? clear}) = CheckCoupon;

  const factory CartEvent.updateState() = UpdateState;

  const factory CartEvent.calculateCart({
    required BuildContext context,
    required int? deliveryPriceId,
    required int? pointId,
    required bool fullDigital,
  }) = CalculateCart;

  const factory CartEvent.calculateCartWithCoupon({
    required BuildContext context,
  }) = CalculateCartWithCoupon;
}
