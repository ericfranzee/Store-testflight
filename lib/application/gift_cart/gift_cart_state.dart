part of 'gift_cart_bloc.dart';

@freezed
class GiftCartState with _$GiftCartState {
  const factory GiftCartState({
    @Default([]) List<GiftCartModel> giftCarts,
    @Default([]) List<MyGiftCartModel> myGiftCarts,
    @Default(true) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(true) bool isPaymentLoading,
    @Default(-1) int selectPayment,
    @Default([]) List<PaymentData>? list,
  }) = _GiftCartState;
}
