import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/domain/model/response/service_response.dart';

abstract class ServiceInterface {
  Future<Either<ServicePaginationResponse, dynamic>> getAllService({
    required int page,
    String? query,
    int? shopId,
    int? categoryId,
    int? masterId,
  });

  Future<Either<CategoriesPaginateResponse, dynamic>> getServiceOfCategory({
    required int page,
    String? query,
    int? shopId,
    int? masterId,
  });
}
