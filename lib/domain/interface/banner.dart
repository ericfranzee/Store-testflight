import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/ads_response.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';

abstract class BannersInterface {
  Future<Either<BannersPaginateResponse, dynamic>> getBannersPaginate({
    int? page,
  });

  Future<Either<BannersPaginateResponse, dynamic>> getLooksPaginate({
    int? page,
    int? shopId,
  });

  Future<Either<List<AdModel>, dynamic>> getAdsListProductPaginate({
    int? page,
    int? shopId,
  });

  Future<Either<BannersPaginateResponse, dynamic>> getAdsPaginate({
    int? page,
  });

  Future<Either<List<ProductData>, dynamic>> getBannerById({
    required int id,
  });

  Future<Either<List<ShopAdsPackage>, dynamic>> getAdsById({
    required int id,
  });
}
