part of 'booking_bloc.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  const factory BookingEvent.fetchBookUpcoming(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchBookUpcoming;

  const factory BookingEvent.fetchBookPast(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchBookPast;

  const factory BookingEvent.fetchBookingById(
      {required BuildContext context, required int id}) = FetchBookingById;

  const factory BookingEvent.bookingService({
    required BuildContext context,
    required num totalPrice,
    required DateTime startTime,
    required ValueChanged<int> onSuccess,
  }) = BookingService;

  const factory BookingEvent.calculateBooking(
      {required BuildContext context,
      required DateTime startTime}) = CalculateBooking;

  const factory BookingEvent.checkTime({
    required BuildContext context,
    required DateTime startTime,
  }) = CheckTime;

  const factory BookingEvent.selectPaymentId({required int id}) =
      SelectPaymentId;

  const factory BookingEvent.fetchPayments({required BuildContext context}) =
      FetchPayments;

  const factory BookingEvent.fetchWebView(
      {required BuildContext context, required int id}) = FetchWebView;

  const factory BookingEvent.cancelBook(
      {required BuildContext context,
      required int id,
      VoidCallback? onSuccess}) = CancelBook;

  const factory BookingEvent.selectDateTime(
      {required DateTime selectDateTime}) = SelectDateTime;

  const factory BookingEvent.selectBookingTime({required String time}) =
      SelectBookingTime;

  const factory BookingEvent.setServices(
      {required List<ServiceModel> services,
      MasterModel? master}) = SetServices;

  const factory BookingEvent.selectMaster(
      {required int? serviceId, required MasterModel? master}) = SelectMaster;

  const factory BookingEvent.setGiftCart({required MyGiftCartModel? giftCart}) =
      SetGiftCart;

  const factory BookingEvent.saveForm({
    required BuildContext context,
    required FormOptionsData? form,
    VoidCallback? onSuccess,
  }) = SaveForm;
}
