import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/response/compare_response.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/domain/model/response/products_paginate_response.dart';
import 'package:ibeauty/domain/model/response/single_product_response.dart';

abstract class ProductsInterface {
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
  });

  Future<Either<SingleProductResponse, dynamic>> getProductDetails(String uuid);

  Future<Either<ProductsPaginateResponse, dynamic>> getMostSoldProducts(
      {int? shopId,
      int? categoryId,
      int? brandId,
      List<int>? brandIds,
      List<int>? categoryIds,
      List<int>? extrasId,
      num? priceTo,
      num? priceFrom,
      required int page});

  Future<Either<ProductsPaginateResponse, dynamic>> getRelatedProducts(
      {String? productUuid, required int page});

  Future<Either<ProductsPaginateResponse, dynamic>> getBuyWithProducts(
      {int? productId, required int page});

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
  });

  Future<Either<ProductsPaginateResponse, dynamic>> getProductsByIds(
    List<int> ids,
  );

  Future<Either<ProductsPaginateResponse, dynamic>> getProductsViewed(
      {required int page, required int productId});

  Future<Either<CompareResponse, dynamic>> getCompare({required int page});

  Future addReview(
    String productUuid,
    String comment,
    double rating,
    String? imageUrl,
  );

  Future<Either<ProductsPaginateResponse, dynamic>> getDiscountProducts({
    int? page,
  });

  Future<Either<FilterResponse, dynamic>> fetchFilter({
    required String type,
    List<int>? shopId,
    List<int>? brandId,
    List<int>? categoryId,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    int? parentId,
  });
}
