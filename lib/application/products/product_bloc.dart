// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/products.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/products_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'product_event.dart';

part 'product_state.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsInterface _productsRepo;

  ProductBloc(this._productsRepo) : super(const ProductState()) {
    int mostPage = 0;
    int newPage = 0;
    int mostShopPage = 0;
    int newShopPage = 0;
    int common = 0;
    int discount = 0;
    int all = 0;

    on<FetchAllProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        all = 0;
        emit(state.copyWith(allProductList: [], isLoadingMostSale: true));
      }
      final res = await _productsRepo.getAllProducts(page: ++all);
      res.fold((l) {
        List<ProductData> list = List.from(state.allProductList);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
          isLoadingMostSale: false,
          allProductList: list,
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
        emit(state.copyWith(isLoadingMostSale: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
          typeFixed: true,
        );
      });
    });

    on<FetchMostSaleShopProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        mostShopPage = 0;
        emit(state.copyWith(mostSaleShopProduct: [], isLoadingMostSale: true));
      }
      final res = await _productsRepo.getMostSoldProducts(
          page: ++mostShopPage, shopId: event.shopId);
      res.fold((l) {
        List<ProductData> list = List.from(state.mostSaleShopProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
          isLoadingMostSale: false,
          mostSaleShopProduct: list,
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
        emit(state.copyWith(isLoadingMostSale: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
          typeFixed: true,
        );
      });
    });

    on<FetchNewShopProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        newShopPage = 0;
        emit(state.copyWith(newShopProduct: [], isLoadingNew: true));
      }
      final res = await _productsRepo.fetchProducts(
        page: ++newShopPage,
        isNew: true,
        shopId: event.shopId,
      );
      res.fold((l) {
        List<ProductData> list = List.from(state.newShopProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
          isLoadingNew: false,
          newShopProduct: list,
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
        emit(state.copyWith(isLoadingNew: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
          typeFixed: true,
        );
      });
    });

    on<FetchMostSaleProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        mostPage = 0;
        emit(state.copyWith(mostSaleProduct: [], isLoadingMostSale: true));
      }
      final res = await _productsRepo.getMostSoldProducts(page: ++mostPage);
      res.fold((l) {
        List<ProductData> list = List.from(state.mostSaleProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
            isLoadingMostSale: false,
            mostSaleProduct: list,
            mostSaleProductCount: l.meta?.total ?? 0));
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
        emit(state.copyWith(isLoadingMostSale: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchLikeProduct>((event, emit) async {
      if (!(event.isRefresh ?? false)) {
        event.controller?.resetNoData();
        emit(state.copyWith(likeProducts: [], isLoadingLike: true));
      }
      if (LocalStorage.getLikedProductsList().isEmpty &&
          LocalStorage.getToken().isEmpty) {
        emit(state.copyWith(isLoadingLike: false));
        return;
      }
      final res = await _productsRepo
          .getProductsByIds(LocalStorage.getLikedProductsList());
      res.fold((l) {
        emit(state.copyWith(
          isLoadingLike: false,
          likeProducts: l.data ?? [],
        ));
        event.controller?.refreshCompleted();
      }, (r) {
        emit(state.copyWith(isLoadingLike: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchDiscountProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        discount = 0;
        emit(state.copyWith(discountProduct: [], isLoadingDiscount: true));
      }
      final res = await _productsRepo.getDiscountProducts(page: ++discount);
      res.fold((l) {
        List<ProductData> list = List.from(state.discountProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
          isLoadingDiscount: false,
          discountProduct: list,
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
        emit(state.copyWith(isLoadingDiscount: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchNewProduct>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        newPage = 0;
        emit(state.copyWith(newProduct: [], isLoadingNew: true));
      }
      final res =
          await _productsRepo.fetchProducts(page: ++newPage, isNew: true);
      res.fold((l) {
        List<ProductData> list = List.from(state.newProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
            isLoadingNew: false,
            newProduct: list,
            newProductCount: l.meta?.total ?? 0));
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
        emit(state.copyWith(isLoadingNew: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchProducts>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        common = 0;
        emit(state.copyWith(commonProduct: [], isLoading: true));
      }
      final Either<ProductsPaginateResponse, dynamic> res;
      if (event.isMostSaleProduct ?? false) {
        res = await _productsRepo.getMostSoldProducts(
          page: ++common,
          shopId: event.shopId,
          brandIds: event.brandId,
          categoryIds: event.categoryIds,
          extrasId: event.extrasId,
          priceFrom: event.priceFrom,
          priceTo: event.priceTo,
        );
      } else if (event.isNewProduct ?? false) {
        res = await _productsRepo.fetchProducts(
          page: ++common,
          isNew: event.isNewProduct,
          shopId: event.shopId,
          brandIds: event.brandId,
          categoryIds: event.categoryIds,
          extrasId: event.extrasId,
          priceFrom: event.priceFrom,
          priceTo: event.priceTo,
          bannerId: event.bannerId,
        );
      } else {
        res = await _productsRepo.fetchProducts(
          page: ++common,
          categoryId: event.categoryId,
          shopId: event.shopId,
          brandIds: event.brandId,
          categoryIds: event.categoryIds,
          extrasId: event.extrasId,
          priceFrom: event.priceFrom,
          priceTo: event.priceTo,
          bannerId: event.bannerId,
        );
      }

      res.fold((l) {
        List<ProductData> list = List.from(state.commonProduct);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
            isLoading: false,
            commonProduct: list,
            totalCount: l.meta?.total ?? 0));
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

    on<UpdateState>((event, emit) {
      emit(state.copyWith(isLoadingNew: !state.isLoadingNew));
      emit(state.copyWith(isLoadingNew: !state.isLoadingNew));
    });
  }
}
