// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/cart.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/cart_calculate_response.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/product_calculate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class CartRepository implements CartInterface {
  @override
  Future<Either<CartModel, dynamic>> insertCart() async {
    final listCart = LocalStorage.getCartList();
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
      "products": [
        for (var element in listCart)
          {
            "stock_id": element.stockId,
            "quantity": element.count,
            if (element.image != null) "images": [element.image]
          }
      ]
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client
          .post('/api/v1/dashboard/user/cart/insert-product', data: data);
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      if ((e.runtimeType == DioException) &&
          ((e as DioException).response?.data["statusCode"] == "ERROR_400")) {
        if ((e.response?.data["params"] as Map)
            .keys
            .first
            .toString()
            .contains("products.")) {
          String message = (e.response?.data["params"] as Map)
              .keys
              .first
              .toString()
              .replaceAll("products.", "");
          int index =
              int.tryParse(message.substring(0, message.indexOf("."))) ?? -1;
          if (index == -1) {
            return right(AppHelper.errorHandler(e));
          }
          final listCart = LocalStorage.getCartList();
          listCart.removeAt(index);
          LocalStorage.setTotalCartList(list: listCart);
          return insertCart();
        }
      }
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartModel, dynamic>> removeProductCart(
      {required int cartDetailId}) async {
    final data = {
      'ids[0]': cartDetailId,
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.delete(
        '/api/v1/dashboard/user/cart/product/delete',
        queryParameters: data,
      );
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> checkCoupon({
    required String coupon,
    required int shopId,
  }) async {
    final data = {
      'coupon': coupon,
      'shop_id': shopId,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/rest/coupons/check',
        data: data,
      );
      return left(true);
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartModel, dynamic>> getCart() async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/cart',
          queryParameters: data);
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartCalculateResponse, dynamic>> calculateCart(
      {required int cartId,
        required bool fullDigital,
        int? pointId,
        Map<int, String>? coupon,
        int? deliveryPriceId,
        bool withoutDeliveryFee = false}) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (coupon?.isNotEmpty ?? false)
        "coupon": {
          for (int i = 0; i < (coupon?.length ?? 0); i++)
            "${coupon?.keys.elementAt(i)}": "${coupon?.values.elementAt(i)}",
        },
      if (!withoutDeliveryFee && LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      "delivery_type": fullDigital
          ? "digital"
          : deliveryPriceId != null
          ? "delivery"
          : "point",
      if (!withoutDeliveryFee && LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
      if (pointId != null && pointId != -1) 'delivery_point_id': pointId,
      if (deliveryPriceId != null && deliveryPriceId != -1)
        'delivery_price_id': deliveryPriceId,
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
          '/api/v1/dashboard/user/cart/calculate/$cartId',
          queryParameters: data);
      return left(CartCalculateResponse.fromJson(response.data));
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProductCalculateResponse, dynamic>>
  productCalculateCart() async {
    final listCart = LocalStorage.getCartList();
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
      "products": [
        for (var element in listCart)
          if (element.count != 0)
            {
              "stock_id": element.stockId,
              "quantity": element.count,
              if (element.image != null) "images": [element.image]
            }
      ]
    };

    try {
      final client = dioHttp.client(requireAuth: false);

      final response = await client.get('/api/v1/rest/order/products/calculate',
          queryParameters: data);

      return left(ProductCalculateResponse.fromJson(response.data));
    } catch (e) {
      if ((e.runtimeType == DioException) &&
          ((e as DioException).response?.data["statusCode"] == "ERROR_400")) {
        if ((e.response?.data["params"] as Map)
            .keys
            .first
            .toString()
            .contains("products.")) {
          String message = (e.response?.data["params"] as Map)
              .keys
              .first
              .toString()
              .replaceAll("products.", "");
          int index =
              int.tryParse(message.substring(0, message.indexOf("."))) ?? -1;
          if (index == -1) {
            return right(AppHelper.errorHandler(e));
          }
          final listCart = LocalStorage.getCartList();
          listCart.removeAt(index);
          LocalStorage.setTotalCartList(list: listCart);
          return productCalculateCart();
        }
      }
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartModel, dynamic>> startGroupOrder({int? cartId}) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      if (LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      if (cartId == null) {
        final resCart = await client.post('/api/v1/dashboard/user/cart/open',
            queryParameters: data);
        final response = await client.post(
            '/api/v1/dashboard/user/cart/set-group/${resCart.data["data"]["id"]}',
            queryParameters: data);
        return left(CartModel.fromJson(response.data));
      }
      final response = await client.post(
          '/api/v1/dashboard/user/cart/set-group/$cartId',
          queryParameters: data);
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> createLink({required int cartId}) async {
    try {
      final productLink = LocalStorage.getAddress()?.cityId == null
          ? "${AppConstants.webUrl}/group?cart_id=$cartId&country_id=${LocalStorage.getAddress()?.countryId}&region_id=${LocalStorage.getAddress()?.regionId}&user_id=${LocalStorage.getUser().id}"
          : "${AppConstants.webUrl}/group?cart_id=$cartId&country_id=${LocalStorage.getAddress()?.countryId}&city_id=${LocalStorage.getAddress()?.cityId}&region_id=${LocalStorage.getAddress()?.regionId}&user_id=${LocalStorage.getUser().id}";

      const dynamicLink =
          'https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=${AppConstants.firebaseWebKey}';

      final dataShare = {
        "dynamicLinkInfo": {
          "domainUriPrefix": AppConstants.urlPrefix,
          "link": productLink,
          "androidInfo": {
            "androidPackageName": AppConstants.androidPackageName,
            "androidFallbackLink": productLink
          },
          "iosInfo": {
            "iosBundleId": AppConstants.iosPackageName,
            "iosFallbackLink": productLink
          },
        }
      };

      final response = await Dio().post(dynamicLink, data: dataShare);

      return left(response.data["shortLink"]);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<bool, dynamic>> deleteCart({required int cartId}) async {
    final data = {
      'ids[0]': cartId,
    };

    try {
      final client = dioHttp.client(requireAuth: true);
      client.delete(
        '/api/v1/dashboard/user/cart/delete',
        queryParameters: data,
      );
      return left(true);
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> deleteUser(
      {required int cartId, required String uuid}) async {
    final data = {'cart_id': cartId, "ids[0]": uuid};

    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/cart/member/delete',
        queryParameters: data,
      );
      return left(true);
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future joinGroupOrder(
      {required int cartId,
        required String name,
        required BuildContext context}) async {
    final data = {"name": name, "cart_id": cartId};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post('/api/v1/rest/cart/open', data: data);
      LocalStorage.deleteCartList();
      LocalStorage.setGroupOrder(
          UserModel(uuid: response.data["data"]["uuid"], id: cartId));
      return;
    } catch (e) {
      return AppHelper.errorSnackBar(
          context: context, message: AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartModel, dynamic>> insertGroupCart() async {
    final listCart = LocalStorage.getCartList();
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      if (LocalStorage.getAddress()?.regionId != null)
        'region_id': LocalStorage.getAddress()?.regionId,
      "cart_id": LocalStorage.getGroupOrder().id ?? 0,
      "user_cart_uuid": LocalStorage.getGroupOrder().uuid,
      if (LocalStorage.getAddress()?.countryId != null)
        "country_id": LocalStorage.getAddress()?.countryId,
      if (LocalStorage.getAddress()?.cityId != null)
        "city_id": LocalStorage.getAddress()?.cityId,
      "products": [
        for (var element in listCart)
          {
            "stock_id": element.stockId,
            "quantity": element.count,
            if (element.image != null) "images": [element.image]
          }
      ]
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response =
      await client.post('/api/v1/rest/cart/insert-product', data: data);
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      if ((e.runtimeType == DioException) &&
          ((e as DioException).response?.data["statusCode"] == "ERROR_400")) {
        if ((e.response?.data["params"] as Map)
            .keys
            .first
            .toString()
            .contains("products.")) {
          String message = (e.response?.data["params"] as Map)
              .keys
              .first
              .toString()
              .replaceAll("products.", "");
          int index =
              int.tryParse(message.substring(0, message.indexOf("."))) ?? -1;
          if (index == -1) {
            return right(AppHelper.errorHandler(e));
          }
          final listCart = LocalStorage.getCartList();
          listCart.removeAt(index);
          LocalStorage.setTotalCartList(list: listCart);
          return insertCart();
        }
      }
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> changeStatus(
      {required int cartId, required String uuid}) async {
    final data = {'cart_id': cartId};

    try {
      final client = dioHttp.client(requireAuth: false);
      await client.post(
        '/api/v1/rest/cart/status/$uuid',
        data: data,
      );
      return left(true);
    } catch (e) {
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CartModel, dynamic>> getGroupCart() async {
    final data = {
      if (LocalStorage.getSelectedCurrency() != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      'user_cart_uuid': LocalStorage.getGroupOrder().uuid,
    };

    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/cart/${LocalStorage.getGroupOrder().id}',
        queryParameters: data,
      );
      return left(CartModel.fromJson(response.data));
    } catch (e) {
      LocalStorage.deleteGroupOrder();
      return right(AppHelper.errorHandler(e));
    }
  }
}
