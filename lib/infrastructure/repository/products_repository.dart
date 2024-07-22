import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/products.dart';
import 'package:ibeauty/domain/model/response/compare_response.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/domain/model/response/products_paginate_response.dart';
import 'package:ibeauty/domain/model/response/single_product_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class ProductsRepository implements ProductsInterface {
  @override
  Future<Either<ProductsPaginateResponse, dynamic>> fetchProducts({
    String? query,
    int? categoryId,
    int? brandId,
    int? shopId,
    int? bannerId,
    bool? isNew,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    required int page,
  }) async {
    final data = {
      if (query != null) 'search': query,
      'perPage': 10,
      "page": page,
      if (categoryIds != null)
        for (int i = 0; i < categoryIds.length; i++)
          'category_ids[$i]': categoryIds[i],
      if (brandIds != null)
        for (int i = 0; i < brandIds.length; i++) 'brand_ids[$i]': brandIds[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (shopId != null) 'shop_id': shopId,
      if (bannerId != null) 'banner_id': bannerId,
      if (isNew ?? false) "column": "created_at",
      if (isNew ?? false) 'sort': 'desc',
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> fetch products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<SingleProductResponse, dynamic>> getProductDetails(
      String uuid,
      ) async {
    final data = {
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client =
      dioHttp.client(requireAuth: LocalStorage.getToken().isNotEmpty);
      final response = await client.get(
        '/api/v1/rest/products/$uuid',
        queryParameters: data,
      );
      return left(SingleProductResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get product details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getMostSoldProducts({
    int? shopId,
    int? categoryId,
    int? brandId,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    required int page,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryIds != null)
        for (int i = 0; i < categoryIds.length; i++)
          'category_ids[$i]': categoryIds[i],
      if (brandIds != null)
        for (int i = 0; i < brandIds.length; i++) 'brand_ids[$i]': brandIds[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      "page": page,
      'perPage': 10,
      "column": "od_count",
      "sort": "desc",
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get most sold products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getProductsByIds(
      List<int> ids,
      ) async {
    Map<String, Object?> data;
    if (LocalStorage.getToken().isEmpty) {
      data = {
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
        'lang': LocalStorage.getLanguage()?.locale,
        if (LocalStorage.getAddress()?.countryId != null)
          'country_id': LocalStorage.getAddress()?.countryId,
        if (LocalStorage.getAddress()?.cityId != null)
          'city_id': LocalStorage.getAddress()?.cityId,
        if (LocalStorage.getAddress()?.regionId != null)
          'region_id': LocalStorage.getAddress()?.regionId,
      };
      for (int i = 0; i < ids.length; i++) {
        data['products[$i]'] = ids[i];
      }
    } else {
      data = {
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
        'lang': LocalStorage.getLanguage()?.locale,
        'type': "product",
        if( LocalStorage.getAddress()?.regionId != null)
          "region_id": LocalStorage.getAddress()?.regionId,
        if (LocalStorage.getAddress()?.countryId != null)
          'country_id': LocalStorage.getAddress()?.countryId,
        if (LocalStorage.getAddress()?.cityId != null)
          'city_id': LocalStorage.getAddress()?.cityId,
      };
    }

    try {
      final client =
      dioHttp.client(requireAuth: LocalStorage.getToken().isNotEmpty);
      final response = await client.get(
        LocalStorage.getToken().isEmpty
            ? '/api/v1/rest/products/ids'
            : "/api/v1/dashboard/likes",
        queryParameters: data,
      );
      if (LocalStorage.getToken().isNotEmpty) {
        if (ProductsPaginateResponse.fromJson(response.data).data?.isEmpty ??
            true) {
          LocalStorage.deleteLikedProductsList();
        }
        ProductsPaginateResponse.fromJson(response.data)
            .data
            ?.forEach((element) {
          if (!LocalStorage.getLikedProductsList().contains(element.id)) {
            LocalStorage.setLikedProductsList(element.id ?? 0);
          }
        });
      }
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get products by ids failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future addReview(
      String productUuid,
      String comment,
      double rating,
      String? imageUrl,
      ) async {
    final data = {
      'rating': rating,
      'comment': comment,
      if (imageUrl != null) 'images': [imageUrl],
    };
    debugPrint('===> add review data: $data');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/products/review/$productUuid',
        data: data,
      );
      return;
    } catch (e) {
      debugPrint('==> add review failure: $e');
      return;
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getDiscountProducts({
    int? page,
  }) async {
    final data = {
      if (page != null) 'page': page,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'perPage': 10,
      'has_discount': 1,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get discount products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<FilterResponse, dynamic>> fetchFilter({
    required String type,
    List<int>? shopId,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    int? parentId,
  }) async {
    List listOfCategory = [];
    listOfCategory.addAll(categoryId ?? []);
    if(parentId != null){
      listOfCategory.add(parentId);
    }

    final data = {
      for (int i = 0; i < listOfCategory.length; i++)
        'category_ids[$i]': listOfCategory[i],
      if (brandId != null)
        for (int i = 0; i < brandId.length; i++) 'brand_ids[$i]': brandId[i],
      if (shopId != null)
        for (int i = 0; i < shopId.length; i++) 'shop_ids[$i]': shopId[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      'type': type,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/filter',
        queryParameters: data,
      );
      return left(FilterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> fetch filter failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getRelatedProducts(
      {String? productUuid, required int page}) async {
    final data = {
      'page': page,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/related/$productUuid',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get discount products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getProductsViewed(
      {required int page, required int productId}) async {
    final data = {
      'page': page,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'perPage': 10,
      "id": productId,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/product-histories/paginate',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get viewed products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CompareResponse, dynamic>> getCompare(
      {required int page}) async {
    List ids = LocalStorage.getCompareList();
    final data = {
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    for (int i = 0; i < ids.length; i++) {
      data['ids[$i]'] = ids[i];
    }

    try {
      final client =
      dioHttp.client(requireAuth: LocalStorage.getToken().isNotEmpty);
      final response = await client.get(
        "/api/v1/rest/compare",
        queryParameters: data,
      );
      return left(CompareResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> compare failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getAllProducts({
    required int page,
    int? shopId,
    int? categoryId,
    int? brandId,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (categoryIds != null)
        for (int i = 0; i < categoryIds.length; i++)
          'category_ids[$i]': categoryIds[i],
      if (brandIds != null)
        for (int i = 0; i < brandIds.length; i++) 'brand_ids[$i]': brandIds[i],
      if (extrasId != null)
        for (int i = 0; i < extrasId.length; i++) 'extras[$i]': extrasId[i],
      if (priceTo != null) "price_to": priceTo,
      if (priceFrom != null) 'price_from': priceFrom,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      "page": page,
      'perPage': 10,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get most sold products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductsPaginateResponse, dynamic>> getBuyWithProducts(
      {int? productId, required int page}) async {
    final data = {
      'page': page,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/$productId/also-bought',
        queryParameters: data,
      );
      return left(ProductsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> buy with products failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
