import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/model/filter_shop_model.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/model/story_model.dart';
import 'package:ibeauty/domain/model/response/gift_cart_response.dart';
import 'package:ibeauty/domain/model/response/membership_response.dart';
import 'package:ibeauty/domain/model/response/my_gift_cart_response.dart';
import 'package:ibeauty/domain/model/response/my_membership_response.dart';
import 'package:ibeauty/domain/model/response/shop_images_response.dart';
import 'package:ibeauty/domain/model/response/shops_paginate_response.dart';
import 'package:ibeauty/domain/model/response/single_shop_response.dart';
import 'package:ibeauty/domain/model/model/shop_filter_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class ShopsRepository implements ShopsInterface {
  @override
  Future<Either<ShopsPaginateResponse, dynamic>> getAllShops(
      {String? query,
      int? page,
      int? categoryId,
      FilterShopModel? filter,
      int type = 2}) async {
    final data = {
      'perPage': 5,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      'location_type': type,
      if (filter?.sort == null) "column": "id",
      if (filter?.sort == null) "sort": "asc",
      if (categoryId != null) "category_id": categoryId,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (query != null) "search": query,
      if (LocalStorage.getLatLong() != null)
        "address": {
          "latitude":
              LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
          "longitude":
              LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
        }
    };
    data.addAll(filter?.toJson() ?? {});
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return left(ShopsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<SingleShopResponse, dynamic>> getSingleShop(int id) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getLatLong() != null)
        "address": {
          "latitude":
              LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
          "longitude":
              LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
        }
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/shops/$id', queryParameters: data);
      return left(SingleShopResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get single shop failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> createShop(
      {required String logo,
      required String bgImage,
      required String shopName,
      required String description,
      required String phone,
      required String deliveryTo,
      required String deliveryFrom,
      required String deliveryType,
      required String minAmount,
      required String tax,
      required LocationModel? location}) async {
    final data = {
      'tax': tax,
      'phone': phone,
      'min_amount': minAmount,
      'title': {LocalStorage.getLanguage()?.locale ?? 'en': shopName},
      'description': {LocalStorage.getLanguage()?.locale ?? 'en': description},
      if (location != null)
        'address': {
          LocalStorage.getLanguage()?.locale ?? 'en': location.address
        },
      'images': [
        logo,
        bgImage,
      ],
      'delivery_time_type': deliveryType,
      'delivery_time_from': deliveryFrom,
      'delivery_time_to': deliveryTo,
      if (location != null) 'lat_long': location.toJson(),
    };
    debugPrint('====> update shop ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/shops',
        data: data,
      );
      return left(true);
    } catch (e) {
      debugPrint('==> edit shop failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<List<StoryModel?>?>, dynamic>> getStory(int page) async {
    final data = {
      'perPage': 30,
      'page': page,
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
        '/api/v1/rest/stories/paginate',
        queryParameters: data,
      );
      return left(storyModelFromJson(response.data) ?? []);
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ShopsPaginateResponse, dynamic>> getPopularShops(
      {int? page, FilterShopModel? filter, int type = 2}) async {
    final data = {
      'perPage': 5,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      'location_type': type,
      if (filter?.sort == null) "column": "b_count",
      if (filter?.sort == null) "sort": "desc",
      if (filter?.tag?.id != null) "take": filter?.tag?.id ?? 0,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getLatLong() != null)
        "address": {
          "latitude":
              LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
          "longitude":
              LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
        }
    };
    data.addAll(filter?.toJson() ?? {});
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return left(ShopsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ShopsPaginateResponse, dynamic>> getNewShops(
      {int? page, FilterShopModel? filter, int type = 2}) async {
    final data = {
      'perPage': 5,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      'location_type': type,
      if (filter?.sort == null) "column": "id",
      if (filter?.sort == null) "sort": "desc",
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getLatLong() != null)
        "address": {
          "latitude":
              LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
          "longitude":
              LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
        }
    };
    data.addAll(filter?.toJson() ?? {});
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return left(ShopsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ShopsPaginateResponse, dynamic>> getShopsByIds(
      List<int> ids) async {
    final data = <String, dynamic>{
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getLatLong() != null)
        "address": {
          "latitude":
              LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
          "longitude":
              LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
        }
    };
    for (int i = 0; i < ids.length; i++) {
      data['shops[$i]'] = ids[i];
    }
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops',
        queryParameters: data,
      );
      return left(ShopsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> createLink({required int shopId}) async {
    try {
      final productLink = LocalStorage.getAddress()?.cityId == null
          ? "${AppConstants.webUrl}/shop_id=$shopId&country_id=${LocalStorage.getAddress()?.countryId}&region_id=${LocalStorage.getAddress()?.regionId}"
          : "${AppConstants.webUrl}/shop_id=$shopId&country_id=${LocalStorage.getAddress()?.countryId}&city_id=${LocalStorage.getAddress()?.cityId}&region_id=${LocalStorage.getAddress()?.regionId}";

      const dynamicLink =
          'https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=${AppConstants.firebaseWebKey}';

      final dataShare = {
        "dynamicLinkInfo": {
          "domainUriPrefix": AppConstants.urlPrefix,
          "link": productLink,
          "androidInfo": {
            "androidPackageName": AppConstants.androidPackageName,
            "androidFallbackLink": productLink
          },
          "iosInfo": {
            "iosBundleId": AppConstants.iosPackageName,
            "iosFallbackLink": productLink
          },
        }
      };

      final response = await Dio().post(dynamicLink, data: dataShare);

      return left(response.data["shortLink"]);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<ShopsPaginateResponse, dynamic>> getNearShops(
      {int? page,
      int? withoutShopId,
      int? categoryId,
      required LocationModel? location,
      FilterShopModel? filter,
      int type = 2}) async {
    final data = {
      'perPage': 5,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
      'location_type': type,
      if (filter?.sort == null) "column": "distance",
      if (filter?.sort == null) "sort": "asc",
      if (categoryId != null) "category_id": categoryId,
      if (withoutShopId != null) "without_shop_id": withoutShopId,
      "address": {
        "latitude":
            LocalStorage.getLatLong()?.latitude ?? AppConstants.demoLatitude,
        "longitude":
            LocalStorage.getLatLong()?.longitude ?? AppConstants.demoLongitude
      }
    };
    data.addAll(filter?.toJson() ?? {});
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return left(ShopsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get near shops failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ShopFilterModel, dynamic>> getShopFilter() async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shop-filter',
        queryParameters: data,
      );
      return left(ShopFilterModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get shops filter failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<Galleries>, dynamic>> getShopImage(int? id) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/$id/galleries',
      );
      return left(
          ShopImagesResponse.fromJson(response.data).data?.galleries ?? []);
    } catch (e) {
      debugPrint('==> get shops images failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  ///---> Memberships <---///

  @override
  Future<Either<List<MembershipModel>, dynamic>> getMembership(
      {required int page, required int id}) async {
    try {
      final data = {
        'perPage': 5,
        'page': page,
        'lang': LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/shop/$id/memberships',
          queryParameters: data);
      return left(MembershipResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      debugPrint('==> get shops membership failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<MyMembershipModel>, dynamic>> myMemberships(
      {required int page, int? shopId, int? serviceId}) async {
    try {
      final data = {
        'perPage': 10,
        'page': page,
        if (shopId != null) 'shop_id': shopId,
        if (serviceId != null) 'service_id': serviceId,
        'lang': LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/user/user-memberships',
          queryParameters: data);
      return left(MyMembershipResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      debugPrint('==> get my membership failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  ///---> Gift Cart <---///

  @override
  Future<Either<List<GiftCartModel>, dynamic>> getGiftCart(
      {required int page, required int shopId}) async {
    try {
      final data = {
        'perPage': 5,
        'page': page,
        'shop_id': shopId,
        'lang': LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/gift-carts/paginate',
          queryParameters: data);
      return left(GiftCartResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      debugPrint('==> get shops gift failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<MyGiftCartModel>, dynamic>> myGiftCarts(
      {required int page, int? shopId, int? serviceId, bool? valid}) async {
    try {
      final data = {
        'perPage': 10,
        'page': page,
        if (valid ?? false) 'valid': 1,
        if (shopId != null) 'shop_id': shopId,
        if (serviceId != null) 'service_id': serviceId,
        'lang': LocalStorage.getLanguage()?.locale,
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
          '/api/v1/dashboard/user/gift-carts/my-carts',
          queryParameters: data);
      return left(MyGiftCartResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      debugPrint('==> get my gift cart failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
