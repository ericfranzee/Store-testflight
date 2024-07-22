import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/banner.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/ads_response.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/model/response/products_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class BannersRepository implements BannersInterface {
  @override
  Future<Either<BannersPaginateResponse, dynamic>> getBannersPaginate({
    int? page,
  }) async {
    final data = {
      'perPage': 50,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/paginate',
        queryParameters: data,
      );
      return left(BannersPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get banners paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BannersPaginateResponse, dynamic>> getAdsPaginate(
      {int? page}) async {
    final data = {
      'perPage': 5,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/ads-packages',
        queryParameters: data,
      );
      return left(BannersPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get ads failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BannersPaginateResponse, dynamic>> getLooksPaginate({
    int? page,
    int? shopId,
  }) async {
    final data = {
      'perPage': 5,
      "type": "look",
      if (shopId != null) "shop_id": shopId,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/paginate',
        queryParameters: data,
      );
      return left(BannersPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get ads failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<ProductData>, dynamic>> getBannerById(
      {required int id}) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
       'banner_id': id,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return left(
          ProductsPaginateResponse.fromJson(response.data).data ??
              []);
    } catch (e) {
      debugPrint('==> get look by id failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<ShopAdsPackage>, dynamic>> getAdsById(
      {required int id}) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/ads-packages/$id',
        queryParameters: data,
      );
      return left(
          AdsProductsResponse.fromJson(response.data).data?.shopAdsPackages ??
              []);
    } catch (e) {
      debugPrint('==> get ads by id failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<AdModel>, dynamic>> getAdsListProductPaginate({
    int? page,
    int? shopId,
  }) async {
    final data = {
      'perPage': 3,
      'page': page,
      if (shopId != null) "shop_id": shopId,
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products-ads-packages',
        queryParameters: data,
      );
      return left(
          AdsProductsResponse.fromJson(response.data, list: true).listOfAds ??
              []);
    } catch (e) {
      debugPrint('==> get ads product by id failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
