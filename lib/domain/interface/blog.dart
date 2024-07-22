

import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/response/blog_details_response.dart';
import 'package:ibeauty/domain/model/response/blogs_paginate_response.dart';

abstract class BlogInterface {
  Future<Either<BlogsPaginateResponse,dynamic>> getBlogs(int page, String type);

  Future<Either<BlogDetailsResponse,dynamic>> getBlogDetails(int id);
}
