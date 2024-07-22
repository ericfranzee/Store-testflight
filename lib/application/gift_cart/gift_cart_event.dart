part of 'gift_cart_bloc.dart';

@freezed
abstract class GiftCartEvent with _$GiftCartEvent {
  const factory GiftCartEvent.fetchGiftCart({required BuildContext context,
    bool? isRefresh,
    int? shopId,
    RefreshController? controller}) = FetchGiftCart;

  const factory GiftCartEvent.selectPaymentId({required int id}) =
  SelectPaymentId;

  const factory GiftCartEvent.fetchPayments({required BuildContext context}) =
  FetchPayments;

  const factory GiftCartEvent.fetchWebView({required BuildContext context,
    required int giftCartId,
    required VoidCallback? onSuccess
  }) = FetchWebView;

  const factory GiftCartEvent.createTransaction(
      {required BuildContext context,
        required int giftCartId,
        required VoidCallback? onSuccess}) = CreateTransaction;

  const factory GiftCartEvent.myGiftCart({required BuildContext context,
    bool? isRefresh,
    int? serviceId,
    int? shopId,
    bool? valid,
    RefreshController? controller}) = MyGiftCart;
}
