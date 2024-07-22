import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/master.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/response/master_response.dart';
import 'package:ibeauty/domain/model/response/shop_images_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class MasterRepository implements MasterInterface {
  @override
  Future<Either<MasterPaginationResponse, dynamic>> getMasters({
    required int page,
    String? query,
    int? shopId,
    int? serviceId,
    List<int>? serviceIds,
  }) async {
    final data = {
      'per_page': 10,
      "page": page,
      "column": "r_avg",
      "sort": "desc",
      if (shopId != null) "shop_id": shopId,
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (query != null) 'search': query,
      'invite_status': 2,
      if (serviceId != null) "service_id": serviceId,
      for (int i = 0; i < (serviceIds?.length ?? 0); i++)
        'service_ids[$i]': serviceIds?[i],
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/masters',
        queryParameters: data,
      );
      return left(MasterPaginationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get masters failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<MasterPaginationResponse, dynamic>> getLikedMaster() async {
    List ids = LocalStorage.getLikedMaster();
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
        data['ids[$i]'] = ids[i];
      }
    } else {
      data = {
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
        'lang': LocalStorage.getLanguage()?.locale,
        'type': "master",
        if (LocalStorage.getAddress()?.regionId != null)
          "region_id": LocalStorage.getAddress()?.regionId,
        if (LocalStorage.getAddress()?.countryId != null)
          'country_id': LocalStorage.getAddress()?.countryId,
        if (LocalStorage.getAddress()?.cityId != null)
          'city_id': LocalStorage.getAddress()?.cityId,
      };
    }

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        LocalStorage.getToken().isEmpty
            ? '/api/v1/rest/masters'
            : "/api/v1/dashboard/likes",
        queryParameters: data,
      );
      return left(MasterPaginationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get like master failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<MasterModel, dynamic>> getMasterById({required int id}) async {
    final data = {
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
        '/api/v1/rest/masters/$id',
        queryParameters: data,
      );
      return left(MasterModel.fromJson(response.data?["data"]));
    } catch (e) {
      debugPrint('==> get master by id failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<Galleries>, dynamic>> getMastersImage(int? id) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/master/$id/galleries',
      );
      return left(ShopImages.fromJsonMaster(response.data).galleries ?? []);
    } catch (e) {
      debugPrint('==> get shops images failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
