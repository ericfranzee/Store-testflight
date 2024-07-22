import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ibeauty/domain/model/response/cart_calculate_response.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/product_calculate_response.dart';

abstract class CartInterface {
  Future<Either<CartModel, dynamic>> insertCart();

  Future<Either<CartModel, dynamic>> insertGroupCart();

  Future<Either<ProductCalculateResponse, dynamic>> productCalculateCart();

  Future<Either<CartModel, dynamic>> getCart();

  Future<Either<String, dynamic>> createLink({required int cartId});

  Future<Either<CartModel, dynamic>> startGroupOrder({int? cartId});

  Future<Either<bool, dynamic>> deleteCart({required int cartId});

  Future joinGroupOrder({
    required int cartId,
    required String name,
    required BuildContext context,
  });

  Future<Either<bool, dynamic>> deleteUser(
      {required int cartId, required String uuid});

  Future<Either<CartModel, dynamic>> getGroupCart();

  Future<Either<bool, dynamic>> changeStatus(
      {required int cartId, required String uuid});

  Future<Either<CartModel, dynamic>> removeProductCart(
      {required int cartDetailId});

  Future<Either<bool, dynamic>> checkCoupon({
    required String coupon,
    required int shopId,
  });

  Future<Either<CartCalculateResponse, dynamic>> calculateCart(
      {required int cartId,
        required bool fullDigital,
        int? pointId,
        Map<int,String>? coupon,
        int? deliveryPriceId,
        bool withoutDeliveryFee = false});
}
