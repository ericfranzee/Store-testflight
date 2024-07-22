// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/master.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'master_event.dart';

part 'master_state.dart';

part 'master_bloc.freezed.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final MasterInterface _masterRepo;

  MasterBloc(this._masterRepo) : super(const MasterState()) {
    int page = 0;

    on<FetchMasters>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(masters: [], isLoading: true));
      }

      final res = await _masterRepo.getMasters(
          page: ++page,
          shopId: event.shopId,
          serviceId: event.serviceId,
          serviceIds: event.serviceIds);

      res.fold((l) {
        List<MasterModel> list = List.from(state.masters);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, masters: list));
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

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchMasterById>((event, emit) async {
      emit(state.copyWith(isLoading: true, master: event.master));

      final res = await _masterRepo.getMasterById(id: event.master.id ?? 0);

      res.fold((l) {
        emit(state.copyWith(isLoading: false, master: l));
      }, (r) {
        emit(state.copyWith(isLoading: false));

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchLikeMasters>((event, emit) async {
      emit(state.copyWith(likeMasters: []));

      final res = await _masterRepo.getLikedMaster();

      res.fold((l) {
        emit(state.copyWith(likeMasters: l.data ?? []));
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchMasterImage>((event, emit) async {
      emit(state.copyWith(masterImages: []));

      final res = await _masterRepo.getMastersImage(event.id);
      res.fold((list) {
        emit(state.copyWith(masterImages: list));
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<UpdateState>((event, emit) {
      emit(state.copyWith(isLoading: true));
      emit(state.copyWith(isLoading: false));
    });
  }
}
