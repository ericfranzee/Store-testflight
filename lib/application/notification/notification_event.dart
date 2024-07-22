part of 'notification_bloc.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.fetchNotification(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchNotification;

  const factory NotificationEvent.readAll({required BuildContext context}) =
      ReadAll;

  const factory NotificationEvent.readOne(
      {required BuildContext context, required int? id}) = ReadOne;

  const factory NotificationEvent.removeItem(
      {required BuildContext context, required int? id}) = RemoveItem;

  const factory NotificationEvent.fetchCount({required BuildContext context}) =
      FetchCount;
}
