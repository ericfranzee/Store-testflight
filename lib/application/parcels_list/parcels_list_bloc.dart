// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibeauty/domain/interface/parcel.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'parcels_list_event.dart';

part 'parcels_list_state.dart';

part 'parcels_list_bloc.freezed.dart';

class ParcelsListBloc extends Bloc<ParcelsListEvent, ParcelsListState> {
  final ParcelInterface _parcelRepo;

  ParcelsListBloc(this._parcelRepo) : super(const ParcelsListState()) {
    int activeOrder = 1;
    int historyOrder = 1;

    on<FetchActiveParcel>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        activeOrder = 0;
        emit(state.copyWith(activeOrders: [], isActiveLoading: true));
      }
      final res = await _parcelRepo.getActiveParcel(++activeOrder);
      res.fold((l) {
        List<ParcelOrder> list = List.from(state.activeOrders);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isActiveLoading: false, activeOrders: list));
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
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        emit(state.copyWith(isActiveLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchHistoryParcel>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        historyOrder = 0;
        emit(state.copyWith(historyOrders: [], isHistoryLoading: true));
      }
      final res = await _parcelRepo.getHistoryParcel(++historyOrder);
      res.fold((l) {
        List<ParcelOrder> list = List.from(state.historyOrders);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isHistoryLoading: false, historyOrders: list));
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
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        emit(state.copyWith(isHistoryLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });
  }
}
