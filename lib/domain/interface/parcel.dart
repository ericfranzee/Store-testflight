

import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/model/response/parcel_calculate_response.dart';
import 'package:ibeauty/domain/model/response/parcel_paginate_response.dart';
import 'package:ibeauty/domain/model/response/parcel_response.dart';

abstract class ParcelInterface {
  Future<Either<ParcelTypeResponse,dynamic>> getTypes();

  Future<Either<ParcelCalculateResponse,dynamic>> getCalculate(
      {required int typeId,
      required LocationModel from,
      required LocationModel to});

  Future<Either> orderParcel(
      {required int typeId,
        required LocationModel from,
        required String fromTitle,
        required LocationModel to,
        required String toTitle,
        required String time,
        required String note,
        required String phoneFrom,
        required String phoneTo,
        required String usernameTo,
        required String usernameFrom,
        required String floorTo,
        required String floorFrom,
        required String houseFrom,
        required String houseTo,
        required String comment,
        required String value,
        required String instruction,
        required bool notify,
        required int? paymentId,
      });


  Future<Either<ParcelPaginateResponse,dynamic>> getActiveParcel(int page);

  Future<Either<ParcelPaginateResponse,dynamic>> getHistoryParcel(int page);

  Future<Either<ParcelOrder,dynamic>> getSingleParcel(num orderId);


  Future<Either<dynamic,dynamic>> addReview(
      num orderId, {
        required double rating,
        required String comment,
      });
}
