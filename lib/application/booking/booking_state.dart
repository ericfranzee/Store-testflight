
part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    @Default([]) List<BookingModel> upcoming,
    @Default([]) List<BookingModel> past,
    @Default([]) List<PaymentData>? list,
    @Default([]) List<EnableDate>? listDate,
    @Default(true) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(true) bool isPaymentLoading,
    @Default(-1) int selectPayment,
    @Default(null) BookingCalculateResponse? calculate,
    @Default(null) DateTime? selectDateTime,
    @Default(null) String? selectBookTime,
    @Default([]) List<ServiceModel> selectServices,
    @Default({}) Map<int,MasterModel> selectMasters,
    @Default(null) MyGiftCartModel? giftCart,
  }) = _BookingState;
}
