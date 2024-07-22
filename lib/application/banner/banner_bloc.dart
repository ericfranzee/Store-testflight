// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/banner.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/ads_response.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'banner_event.dart';

part 'banner_state.dart';

part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannersInterface _bannersRepo;

  BannerBloc(this._bannersRepo) : super(const BannerState()) {
    int page = 0;
    int ads = 0;
    int look = 0;
    int listAdsProduct = 0;

    on<FetchBanner>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(banners: [], isLoadingBanner: true));
      }
      final res = await _bannersRepo.getBannersPaginate(page: ++page);
      res.fold((l) {
        List<BannerData> list = List.from(state.banners);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoadingBanner: false, banners: list));
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
        emit(state.copyWith(isLoadingBanner: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchLooks>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        look = 0;
        emit(state.copyWith(looks: []));
      }
      final res = await _bannersRepo.getLooksPaginate(
          page: ++look, shopId: event.shopId);
      res.fold((l) {
        List<BannerData> list = List.from(state.looks);
        list.addAll(l.data ?? []);
        emit(state.copyWith(looks: list));
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

    on<FetchAdsBanner>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        ads = 0;
        emit(state.copyWith(adsBanners: []));
      }
      final res = await _bannersRepo.getAdsPaginate(page: ++ads);
      res.fold((l) async {
        List<BannerData> list = List.from(state.adsBanners);
        list.addAll(l.data ?? []);
        emit(state.copyWith(adsBanners: list));
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

    on<FetchProduct>((event, emit) async {
      emit(state.copyWith(products: [], isLoadingProduct: true));
      final res = await _bannersRepo.getBannerById(id: event.id);
      res.fold((l) {
        emit(state.copyWith(products: l, isLoadingProduct: false));
      }, (r) {
        emit(state.copyWith(isLoadingProduct: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<UpdateProduct>((event, emit)  {
      emit(state.copyWith(isLoadingProduct: true));
      emit(state.copyWith(isLoadingProduct: false));
    });

    on<FetchAdsProduct>((event, emit) async {
      emit(state.copyWith(shopAds: [], isLoadingProduct: true));
      final res = await _bannersRepo.getAdsById(id: event.id);
      res.fold((l) {
        emit(state.copyWith(shopAds: l, isLoadingProduct: false));
      }, (r) {
        emit(state.copyWith(isLoadingProduct: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchAdsListProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        listAdsProduct = 0;
        emit(state.copyWith(banners: []));
      }
      final res = await _bannersRepo.getAdsListProductPaginate(
          page: ++listAdsProduct, shopId: event.shopId);
      res.fold((l) {
        List<AdModel> list = List.from(state.shopListAds);
        list.addAll(l);
        emit(state.copyWith(shopListAds: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.isEmpty) {
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
  }
}
