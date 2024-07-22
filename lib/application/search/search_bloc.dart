// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/brands.dart';
import 'package:ibeauty/domain/interface/category.dart';
import 'package:ibeauty/domain/interface/products.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/model/brand_data.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';

part 'search_event.dart';

part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ShopsInterface _shopRepo;
  final ProductsInterface _productRepo;
  final CategoryInterface _categoryRepo;
  final BrandsInterface _brandsRepo;

  SearchBloc(
      this._shopRepo, this._productRepo, this._categoryRepo, this._brandsRepo)
      : super(const SearchState()) {
    int? shopId;

    on<SearchShops>((event, emit) async {
      emit(state.copyWith(isShopLoading: true));

      final res = await _shopRepo.getAllShops(query: state.query, page: 1);
      res.fold((l) {
        emit(state.copyWith(isShopLoading: false, shops: l.data ?? []));
      }, (r) {
        emit(state.copyWith(isShopLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SetQuery>((event, emit) async {
      shopId = event.shopId;
      emit(state.copyWith(query: event.query));

    });

    on<SearchProduct>((event, emit) async {
      emit(state.copyWith(isProductLoading: true));

      final res = await _productRepo.fetchProducts(query: state.query, page: 1,shopId: shopId);
      res.fold((l) {
        emit(state.copyWith(isProductLoading: false, products: l.data ?? []));
      }, (r) {
        emit(state.copyWith(isProductLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SearchCategory>((event, emit) async {
      emit(state.copyWith(isCategoryLoading: true));

      final res =
          await _categoryRepo.getAllCategories(query: state.query, page: 1);
      res.fold((l) {
        emit(
            state.copyWith(isCategoryLoading: false, categories: l.data ?? []));
      }, (r) {
        emit(state.copyWith(isCategoryLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SearchBrand>((event, emit) async {
      emit(state.copyWith(isBrandLoading: true));

      final res = await _brandsRepo.getAllBrands(query: state.query, page: 1);
      res.fold((l) {
        emit(state.copyWith(isBrandLoading: false, brands: l.data ?? []));
      }, (r) {
        emit(state.copyWith(isBrandLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<UpdateRecently>((event, emit) async {
      emit(state.copyWith(isShopLoading: true));
      emit(state.copyWith(isShopLoading: false));
    });
  }
}
