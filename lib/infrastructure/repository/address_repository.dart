import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/address.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/response/city_pagination_response.dart';
import 'package:ibeauty/domain/model/response/country_paginate_response.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/draw_routing_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class AddressRepository implements AddressInterface {
  @override
  Future<Either<CountryPaginationResponse, dynamic>> getCountry(
      {required int page}) async {
    final data = {
      'perPage': 20,
      'page': page,
      'has_price': 1,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/countries',
        queryParameters: data,
      );
      return left(CountryPaginationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get country paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CountryPaginationResponse, dynamic>> searchCountry(
      {required String search}) async {
    final data = {
      'perPage': 48,
      'has_price': 1,
      "search": search,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/countries',
        queryParameters: data,
      );
      return left(CountryPaginationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> search country paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CityResponseModel, dynamic>> getCity(
      {required int page, required int countyId}) async {
    final data = {
      'perPage': 48,
      'has_price': 1,
      'page': page,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      'lang': LocalStorage.getLanguage()?.locale,
      'country_id': countyId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/cities',
        queryParameters: data,
      );
      return left(CityResponseModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get city paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CityResponseModel, dynamic>> searchCity(
      {required String search, required int countyId}) async {
    final data = {
      'perPage': 48,
      'has_price': 1,
      "search": search,
      'lang': LocalStorage.getLanguage()?.locale,
      'country_id': countyId,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/cities',
        queryParameters: data,
      );
      return left(CityResponseModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> search city paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<DeliveryPointResponse, dynamic>> getDeliveryPoint(
      {required int page}) async {
    final data = {
      'perPage': 100,
      "page": page,
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
        '/api/v1/rest/delivery-points',
        queryParameters: data,
      );
      return left(DeliveryPointResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> point paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<DrawRouting, dynamic>> getRouting(
      {required LatLng start, required LatLng end}) async {
    try {
      final client = dioHttp.client(requireAuth: false, routing: true);
      final response = await client.get(
        '/v2/directions/driving-car?api_key=${AppConstants.routingKey}&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}',
      );
      return left(
        DrawRouting.fromJson(response.data),
      );
    } catch (e) {
      return right((e.runtimeType == DioException)
          ? (e as DioException).response?.data["error"]["message"]
          : e.toString());
    }
  }

  @override
  Future<Either<UserAddress, dynamic>> addUserAddress(
      {required String firstName,
      required String lastName,
      required String phone,
      required String zipcode,
      required String city,
      required String detail,
      required LocationModel? locationModel,
      required String homeNumber}) async {
    final data = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phone,
      "zipcode": zipcode,
      "city_id": city,
      "additional_details": detail,
      "street_house_number": homeNumber,

      if( LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if( LocalStorage.getAddress()?.regionId != null)
        "region_id": LocalStorage.getAddress()?.regionId,
      "location": locationModel?.toJson()
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/addresses',
        data: data,
      );
      return left(UserAddress.fromJson(response.data["data"]));
    } catch (e) {
      debugPrint('==> add address failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<UserAddressResponse, dynamic>> getUserAddress(
      {required int page}) async {
    final data = {
      'perPage': 10,
      if( LocalStorage.getAddress()?.cityId != null)
      "city_id": LocalStorage.getAddress()?.cityId,
      if( LocalStorage.getAddress()?.countryId != null)
      "country_id": LocalStorage.getAddress()?.countryId,
      if( LocalStorage.getAddress()?.regionId != null)
      "region_id": LocalStorage.getAddress()?.regionId,
      'page': page,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/addresses',
        queryParameters: data,
      );
      return left(UserAddressResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get country paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> deleteAddress({required int addressId}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/addresses/delete?ids[0]=$addressId',
      );
      return left(true);
    } catch (e) {
      debugPrint('==> get country paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> editUserAddress(
      {required String firstName,
      required String lastName,
      required int addressId,
      required String phone,
      required String zipcode,
      required String city,
      required String detail,
      required LocationModel? locationModel,
      required String homeNumber}) async {
    final data = {
      "firstname": firstName,
      "lastname": lastName,
      "phone": phone,
      "zipcode": zipcode,
      "city_id": city,
      "additional_details": detail,
      "street_house_number": homeNumber,
      "country_id": LocalStorage.getAddress()?.countryId,
      "region_id": LocalStorage.getAddress()?.regionId,
      "location": locationModel?.toJson()
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put(
        '/api/v1/dashboard/user/addresses/$addressId',
        data: data,
      );
      return left(true);
    } catch (e) {
      debugPrint('==> address paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<DeliveryPointResponse, dynamic>> getDeliveryPrice() async {
    final data = {
      'perPage': 1,
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
        '/api/v1/rest/delivery-prices',
        queryParameters: data,
      );
      return left(DeliveryPointResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> delivery prices paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<DeliveryPointResponse, dynamic>> showWareHouse() async {
    final data = {
      'perPage': 1,
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
        '/api/v1/rest/warehouses',
        queryParameters: data,
      );
      if (DeliveryPointResponse.fromJson(response.data).data?.isNotEmpty ??
          false) {
        LocalStorage.setWareHouse(
            DeliveryPointResponse.fromJson(response.data).data?.first);
      }
      return left(DeliveryPointResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==>warehouse failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
