

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/booking.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/response/blog_details_response.dart';
import 'package:ibeauty/domain/model/response/booking_calculate_response.dart';
import 'package:ibeauty/domain/model/response/booking_response.dart';
import 'package:ibeauty/domain/model/response/check_time_response.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/model/response/service_of_master_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class BookingRepository implements BookingInterface {
  @override
  Future<Either<BookingResponse, dynamic>> getBooks({
    required int page,
    required String type,
  }) async {
    final data = {
      'perPage': 5,
      'page': page,
      "parent": 1,
      if (type == TrKeys.past) 'statuses[0]': "canceled",
      if (type == TrKeys.past) 'statuses[1]': "ended",
      if (type != TrKeys.past) 'statuses[0]': "new",
      if (type != TrKeys.past) 'statuses[1]': "progress",
      if (type != TrKeys.past) 'statuses[2]': "booked",
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/bookings',
        queryParameters: data,
      );
      return left(BookingResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get booking paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BlogDetailsResponse, dynamic>> getBlogDetails(int id) async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/rest/blog-by-id/$id',
          queryParameters: data);
      return left(BlogDetailsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get booking list failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<int, dynamic>> bookingService(
      {required List<MasterModel> serviceMasters,
      bool isPayment = true,
      required int? paymentId,
      int? giftCartId,
      required DateTime? dateTime}) async {
    final data = {
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      "data": [
        for (var i = 0; i < serviceMasters.length; i++)
          {
            "service_master_id": serviceMasters[i].serviceMaster?.id,
            if (serviceMasters[i].membership != null)
              "user_member_ship_id": serviceMasters[i].membership?.id,
            if (serviceMasters[i].note != null &&
                (serviceMasters[i].note?.isNotEmpty ?? false))
              'note': serviceMasters[i].note,
            if (serviceMasters[i].address != null &&
                (serviceMasters[i].address?.isNotEmpty ?? false))
              "data": {
                "address": serviceMasters[i].address,
                "lat": serviceMasters[i].lat,
                "long": serviceMasters[i].long,
              }
          }
      ],
      'start_date': TimeService.dateFormatYMDHm(dateTime),
      if (giftCartId != null) 'gift_cart_id': giftCartId,
      if (isPayment) "payment_id": paymentId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/dashboard/user/bookings', data: data);
      return left((BookingResponse.fromJson(res.data).data?.isNotEmpty ?? false)
          ? (BookingResponse.fromJson(res.data).data?.first.id ?? 0)
          : 0);
    } catch (e) {
      debugPrint('==> create book details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> cancelBook(int id) async {
    final data = {
      'status': "canceled",
    };
    try {
      final client = dioHttp.client(requireAuth: true);

      await client.post('/api/v1/dashboard/user/booking/parent/$id/canceled',
          data: data);
      return left(true);
    } catch (e) {
      debugPrint('==> create book details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BookingCalculateResponse, dynamic>> calculateBooking(
      {required Map<int, MasterModel> selectMasters,
      int? giftCartId,
      required DateTime startTime}) async {
    final data = {
      "currency_id": LocalStorage.getSelectedCurrency()?.id,
      "start_date": TimeService.dateFormatYMDHm(startTime),
      if (giftCartId != null) "gift_cart_id": giftCartId,
      "data": [
        for (var i = 0; i < selectMasters.length; i++)
          {
            "service_master_id":
                selectMasters.values.elementAt(i).serviceMaster?.id,
            if (selectMasters.values.elementAt(i).membership != null)
              "user_member_ship_id":
                  selectMasters.values.elementAt(i).membership?.id,
          },
      ]
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/rest/bookings/calculate', data: data);
      return left(BookingCalculateResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> calculate book failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CheckTimeResponse, dynamic>> checkTime({
    required DateTime start,
    required List<int> serviceId,
  }) async {
    final data = {
      "start_date": TimeService.dateFormatYMDHm(start),
      for (int i = 0; i < serviceId.length; i++)
        "service_master_ids[$i]": serviceId[i],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get('/api/v1/rest/master/times-all',
          queryParameters: data);
      return left(CheckTimeResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> check time book failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BookingResponse, dynamic>> getBookingById(
      {required int id}) async {
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
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/bookings/$id/get-all',
        queryParameters: data,
      );
      return left(BookingResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get booking detail failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ServiceOfMasterResponse, dynamic>> getServiceOfMasters(
      {required int? masterId}) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      if (LocalStorage.getAddress()?.countryId != null)
        'country_id': LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        'city_id': LocalStorage.getAddress()?.cityId,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.regionId != null) 'master_id': masterId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/service-masters',
        queryParameters: data,
      );
      return left(ServiceOfMasterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get booking detail failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> saveForm({required List<FormOptionsData?> form,required int id}) async {
    try {
      final client = dioHttp.client(requireAuth: true);

      await client.put('/api/v1/dashboard/user/bookings/$id',
          data: {
        "data":{
          "form": List<dynamic>.from(form.map((x) => x?.toJson()))
        }
          });
      return left(true);
    } catch (e) {
      debugPrint('==> create book details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }



}
