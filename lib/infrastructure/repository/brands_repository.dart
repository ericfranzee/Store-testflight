import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/brands.dart';
import 'package:ibeauty/domain/model/response/brands_paginate_response.dart';
import 'package:ibeauty/domain/model/response/single_brand_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class BrandsRepository implements BrandsInterface {
  @override
  Future<Either<SingleBrandResponse, dynamic>> getSingleBrand(int id) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/brands/$id');
      return left(SingleBrandResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get brand failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BrandsPaginateResponse, dynamic>> getAllBrands(
      {String? query, required int page, int? shopId}) async {
    final data = {
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale,
      "page": page,
      if(shopId != null)
      "shop_id": shopId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (query != null) 'search': query,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/brands/paginate',
        queryParameters: data,
      );
      return left(BrandsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all brands failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
