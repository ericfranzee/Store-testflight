// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/user.dart';
import 'package:ibeauty/domain/model/response/count_of_notifications_data.dart';
import 'package:ibeauty/domain/model/response/notification_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final UserInterface _userRepository;

  NotificationBloc(this._userRepository) : super(const NotificationState()) {
    int page = 0;

    on<FetchNotification>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(notifications: [], isLoading: true));
      }
      final res = await _userRepository.getNotifications(page: ++page);
      res.fold((l) {
        List<NotificationModel> list = List.from(state.notifications);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
          isLoading: false,
          notifications: list,
        ));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.data?.isEmpty ?? true) {
          event.controller?.loadNoData();
          return;
        }
        event.controller?.loadComplete();
        return;
      }, (r) {
        emit(state.copyWith(isLoading: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
    });

    on<ReadAll>((event, emit) async {
      List<NotificationModel> list = List.from(state.notifications);
      for (var i = 0; i < list.length; i++) {
        if (list[i].readAt == null) {
          list[i] = list[i].copyWith(readAt: DateTime.now());
        }
      }
      emit(state.copyWith(
        notifications: list,
        countOfNotifications:
            state.countOfNotifications?.copyWith(notification: 0),
      ));

      final response = await _userRepository.readAll();
      response.fold(
          (l) => null,
          (r) => AppHelper.errorSnackBar(
                context: event.context,
                message: r,
              ));
    });

    on<ReadOne>((event, emit) async {
      List<NotificationModel> list = List.from(state.notifications);
      for (int i = 0; i < list.length; i++) {
        if (list[i].id == event.id) {
          if (list[i].readAt != null) {
            return;
          }
          list[i] = list[i].copyWith(
            readAt: DateTime.now(),
          );
        }
      }
      final notification = state.countOfNotifications?.copyWith(
          notification: (state.countOfNotifications?.notification ?? 0) - 1);

      emit(state.copyWith(
          notifications: list, countOfNotifications: notification));

      final response = await _userRepository.readOne(id: event.id);
      response.fold(
          (l) => null,
          (r) => AppHelper.errorSnackBar(
                context: event.context,
                message: r,
              ));
    });

    on<RemoveItem>((event, emit) async {
      List<NotificationModel> list = List.from(state.notifications);
      for (int i = 0; i < list.length; i++) {
        if (list[i].id == event.id) {
          list.removeAt(i);
        }
      }

      emit(state.copyWith(
        notifications: list,
      ));

      final response = await _userRepository.deleteNotification(id: event.id);
      response.fold(
          (l) => null,
          (r) => AppHelper.errorSnackBar(
                context: event.context,
                message: r,
              ));
    });

    on<FetchCount>((event, emit) async {
      final response = await _userRepository.getCount(event.context);
      response.fold(
          (l) => emit(state.copyWith(countOfNotifications: l)),
          (r) => AppHelper.errorSnackBar(
                context: event.context,
                message: r,
              ));
    });
  }
}
