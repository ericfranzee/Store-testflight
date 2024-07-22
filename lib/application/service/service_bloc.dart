// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/service.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'service_event.dart';

part 'service_state.dart';

part 'service_bloc.freezed.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceInterface _serviceRepo;

  ServiceBloc(this._serviceRepo) : super(const ServiceState()) {
    int page = 0;
    int pageCategory = 0;

    on<FetchServices>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(services: [], isLoading: true));
      }

      final res = await _serviceRepo.getAllService(
        page: ++page,
        shopId: event.shopId,
        categoryId: event.categoryId,
        masterId: event.masterId,
      );

      res.fold((l) {
        List<ServiceModel> list = List.from(state.services);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, services: list));
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

    on<FetchCategoryServices>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        pageCategory = 0;
        emit(state.copyWith(categoryServices: [], isLoading: true));
      }

      final res = await _serviceRepo.getServiceOfCategory(
        page: ++pageCategory,
        shopId: event.shopId,
        masterId: event.masterId,
      );

      res.fold((l) {
        List<CategoryData> list = List.from(state.categoryServices);
        list.addAll(l.data ?? []);

        emit(state.copyWith(
            isLoading: false,
            categoryServices: list,
            selectIndex:
                list.map((e) => e.id).toList().indexOf(event.categoryId) + 1));
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

    on<SelectServiceCategory>((event, emit) {
      emit(state.copyWith(selectIndex: event.index));
    });

    on<SelectService>((event, emit) {
      List<ServiceModel> list = List.from(state.selectServices);

      if (list.map((e) => e.id).contains(event.service.id)) {
        int index =
            list.map((e) => e.id).toList().indexOf(event.service.id ?? 0);
        list.removeAt(index);
        emit(state.copyWith(selectServices: list));
        return;
      }
      list.add(event.service);
      emit(state.copyWith(selectServices: list));
    });

  }
}
