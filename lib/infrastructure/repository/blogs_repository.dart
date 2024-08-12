import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:cea_zed/domain/di/dependency_manager.dart';
import 'package:cea_zed/domain/interface/blog.dart';
import 'package:cea_zed/domain/model/response/blog_details_response.dart';
import 'package:cea_zed/domain/model/response/blogs_paginate_response.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/infrastructure/local_storage/local_storage.dart';

class BlogsRepository implements BlogInterface {
  @override
  Future<Either<BlogsPaginateResponse, dynamic>> getBlogs(
    int page,
    String type,
  ) async {
    final data = {
      'perPage': 5,
      'page': page,
      'type': type,
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
        '/api/v1/rest/blogs/paginate',
        queryParameters: data,
      );
      return left(BlogsPaginateResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get blogs paginate failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<BlogDetailsResponse, dynamic>> getBlogDetails(int id) async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/blog-by-id/$id',
          queryParameters: data);
      return left(BlogDetailsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get blogs details failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
