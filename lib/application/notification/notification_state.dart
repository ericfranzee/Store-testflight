part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isLoading,
    @Default([]) List<NotificationModel> notifications,
    @Default(null) CountNotificationModel? countOfNotifications,
    @Default(false) bool isReadAllLoading,
  }) = _NotificationState;
}
