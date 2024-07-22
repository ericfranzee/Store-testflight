// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibeauty/domain/interface/products.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'compare_event.dart';

part 'compare_state.dart';

part 'compare_bloc.freezed.dart';

class CompareBloc extends Bloc<CompareEvent, CompareState> {
  final ProductsInterface _productsRepo;

  CompareBloc(this._productsRepo) : super(const CompareState()) {
    int page = 0;

    on<FetchCompare>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(compare: [], isLoading: true));
      }
      final res = await _productsRepo.getCompare(page: page);
      res.fold((l) {
        List<List<ProductData>> list = List.from(state.compare);
        list.addAll(l.compare ?? []);
        emit(state.copyWith(isLoading: false, compare: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.compare?.isEmpty ?? true) {
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

    on<SetExtraGroup>((event, emit) {
      List<GroupProperties> group = [];
      for (var element in event.products) {
        element.stocks?.forEach((stock) {
          stock.extrasCompare?.forEach((extra) {
            if (!(group.map((e) => e.id).contains(extra.group?.id))) {
              group.add(extra.group ?? GroupProperties());
            }
          });
        });
      }

      for (int i = 0; i < group.length; i++) {
        Set<Map> mapOfList = {};
        for (var element in event.products) {
          element.stocks?.forEach((stock) {
            stock.extrasCompare?.forEach((extra) {
              if (group[i].id == extra.group?.id) {
                mapOfList.add({element.id: extra.value});
              }
            });
          });
        }

        GroupProperties newGroup =
            group[i].copyWith(values: mapOfList.toList());
        group[i] = newGroup;
      }
      emit(state.copyWith(extraGroup: group));

      List<GroupProperties> propertyOfList = [];
      for (var element in event.products) {
        element.properties?.forEach((property) {
          if (!(propertyOfList.map((e) => e.id).contains(property.group?.id))) {
            propertyOfList.add(property.group ?? GroupProperties());
          }
        });
      }

      for (int i = 0; i < propertyOfList.length; i++) {
        Set<Map> mapOfList = {};
        for (var element in event.products) {
          element.properties?.forEach((property) {
            if (propertyOfList[i].id == property.group?.id) {
              mapOfList.add({element.id: property.value?.value});
            }
          });
        }

        GroupProperties newGroup =
            propertyOfList[i].copyWith(values: mapOfList.toList());
        propertyOfList[i] = newGroup;
      }
      emit(state.copyWith(propertyGroup: propertyOfList));
    });
  }
}
