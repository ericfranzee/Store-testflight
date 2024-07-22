part of 'parcel_bloc.dart';

@freezed
abstract class ParcelEvent with _$ParcelEvent {
  const factory ParcelEvent.addReview(
      {required BuildContext context,
      required String comment,
      required double rating}) = AddReview;

  const factory ParcelEvent.changeExpand() = ChangeExpand;

  const factory ParcelEvent.showParcel(
      {required BuildContext context,
        required int orderId,
         ParcelOrder? parcel}) = ShowParcel;

  const factory ParcelEvent.setTime({required TimeOfDay time}) = SetTime;

  const factory ParcelEvent.switchAddress({required BuildContext context}) =
      SwitchAddress;

  const factory ParcelEvent.setFromAddress(
      {required String? title,
      required LocationModel? location,
      required BuildContext context}) = SetFromAddress;

  const factory ParcelEvent.setToAddress(
      {required String? title,
      required LocationModel? location,
      required BuildContext context}) = SetToAddress;

  const factory ParcelEvent.selectType(
      {required int index, required BuildContext context}) = SelectType;

  const factory ParcelEvent.changeAnonymous() = ChangeAnonymous;

  const factory ParcelEvent.fetchTypes(BuildContext context) = FetchTypes;

  const factory ParcelEvent.getCalculate(BuildContext context) = GetCalculate;

  const factory ParcelEvent.orderParcel({
    required BuildContext context,
    required String note,
    required String usernameTo,
    required String usernameFrom,
    required String phoneTo,
    required String phoneFrom,
    required String houseFrom,
    required String houseTo,
    required String floorTo,
    required String floorFrom,
    required String comment,
    required String value,
    required String instruction,
    required PaymentData paymentData
  }) = OrderParcel;
}
