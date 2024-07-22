// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/interface/products.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/model/filter_shop_model.dart';
import 'package:ibeauty/domain/model/model/shop_filter_model.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/domain/service/helper.dart';

part 'filter_event.dart';

part 'filter_state.dart';

part 'filter_bloc.freezed.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final ProductsInterface _productsRepo;
  final ShopsInterface _shopsRepo;

  FilterBloc(this._productsRepo, this._shopsRepo) : super(const FilterState()) {
    on<FetchTags>((event, emit) async {
      emit(state.copyWith(shopFilter: null, isLoading: true));
      final res = await _shopsRepo.getShopFilter();
      res.fold((l) {
        emit(state.copyWith(isLoading: false, shopFilter: l));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<ClearFilter>((event, emit) {
      emit(state.copyWith(
          categories: [],
          brands: [],
          extras: [],
          selectType: LayoutType.twoH,
          rangeValues: null));
    });

    on<SetRangePrice>((event, emit) {
      emit(state.copyWith(rangeValues: event.price));
    });

    on<SelectType>((event, emit) {
      emit(state.copyWith(selectType: event.selectType));
    });

    on<SetExtras>((event, emit) {
      List<int> list = List.from(state.extras ?? []);
      if (list.contains(event.id)) {
        list.remove(event.id);
      } else {
        list.add(event.id);
      }
      emit(state.copyWith(extras: list));
    });

    on<SetCategory>((event, emit) {
      List<int> list = List.from(state.categories ?? []);
      if (list.contains(event.id)) {
        list.remove(event.id);
      } else {
        list.add(event.id);
      }
      emit(state.copyWith(categories: list));
    });

    on<SetBrands>((event, emit) {
      if (event.id == -1) {
        return;
      }
      List<int> list = List.from(state.brands ?? []);
      if (list.contains(event.id)) {
        list.remove(event.id);
      } else {
        list.add(event.id);
      }
      emit(state.copyWith(brands: list));
    });

    on<FetchExtras>((event, emit) async {
      if (event.isPrice) {
        emit(state.copyWith(rangeValues: null));
      }
      if (event.type != null) {
        emit(state.copyWith(type: event.type ?? "category"));
      }

      emit(state.copyWith(isLoading: true));
      final res = await _productsRepo.fetchFilter(
          type: state.type,
          extrasId: state.extras,
          categoryId: state.categories,
          parentId: event.categoryId,
          brandId: state.brands,
          priceFrom: state.rangeValues?.start,
          priceTo: state.rangeValues?.end);
      res.fold((l) {
        if (event.isPrice) {
          emit(
            state.copyWith(
                isLoading: false,
                filter: l,
                filterPrices: l.price,
                rangeValues: RangeValues(
                  (l.price?.min ?? 0).toDouble(),
                  (l.price?.max ?? 0).toDouble(),
                ),
                prices: List.generate(
                    (30).round(), (index) => (Random().nextInt(8) + 1))),
          );
          return;
        }
        emit(
          state.copyWith(isLoading: false, filter: l),
        );
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SetAmenities>((event, emit) {
      emit(state.copyWith(
          tagId: event.value == state.tagId ? null : event.value));
    });

    on<SetSort>((event, emit) {
      emit(
          state.copyWith(sort: event.value == state.sort ? null : event.value));
    });

    on<SetServiceType>((event, emit) {
      emit(state.copyWith(
          serviceType: event.value == state.serviceType ? null : event.value));
    });

    on<SetGender>((event, emit) {
      emit(state.copyWith(genderIndex: event.index));
    });

    on<SetFilter>((event, emit) {
      emit(
        state.copyWith(
          genderIndex: event.filter?.gender ?? 2,
          serviceType: event.filter?.serviceType,
          sort: event.filter?.sort,
          tagId: event.filter?.tag?.id,
        ),
      );
    });
  }
}
