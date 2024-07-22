// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/category.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'category_event.dart';

part 'category_state.dart';

part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryInterface _categoryRepo;

  CategoryBloc(this._categoryRepo) : super(const CategoryState()) {
    int page = 0;
    int service = 0;

    on<FetchCategory>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(categories: [], isLoadingCategory: true));
      }
      final Either<CategoriesPaginateResponse, dynamic> res;
      if (event.shopId != null) {
        res = await _categoryRepo.getAllCategoriesByShop(
            page: ++page, shopId: event.shopId ?? 0);
      } else {
        res = await _categoryRepo.getAllCategories(page: ++page);
      }

      res.fold((l) {
        List<CategoryData> list = List.from(state.categories);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
            isLoadingCategory: false,
            categories: list,
            selectCategoryTwo: list.isNotEmpty ? list.first : null));
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
        emit(state.copyWith(isLoadingCategory: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchCategoryOfService>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        service = 0;
        emit(state.copyWith(categoriesOfService: []));
      }

      final res = await _categoryRepo.getAllService(page: ++service);

      res.fold((l) {
        List<CategoryData> list = List.from(state.categoriesOfService);
        list.addAll(l.data ?? []);
        emit(state.copyWith(categoriesOfService: list));
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

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SelectCategory>((event, emit) async {
      emit(state.copyWith(selectCategory: event.category));
    });

    on<SelectCategoryTwo>((event, emit) async {
      emit(state.copyWith(selectCategoryTwo: event.category));
    });
  }
}
