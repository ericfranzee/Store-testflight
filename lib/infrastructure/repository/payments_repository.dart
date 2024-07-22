// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/payments.dart';
import 'package:ibeauty/domain/model/model/create_order_model.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/model/response/transactions_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class PaymentsRepository implements PaymentsInterface {
  @override
  Future<Either<PaymentsResponse, dynamic>> getPayments() async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/payments', queryParameters: data);
      return left(PaymentsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get payments failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<TransactionsResponse, dynamic>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return left(
        TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> paymentWebView(
      {CreateOrderModel? order,
      required String name,
      bool parcel = false,
      int? parcelId}) async {
    try {
      final data = {"parcel_id": parcelId};
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post('/api/v1/dashboard/user/$name-process',
          data: parcel ? data : order?.toJson(isPayment: false));

      return left(res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> paymentWalletWebView(
      {required String name, required int walletId, required num price}) async {
    try {
      final data = {
        'wallet_id': walletId,
        'total_price': price,
        "currency_id": LocalStorage.getSelectedCurrency()?.id
      };

      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/dashboard/user/$name-process', data: data);

      return left(res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view wallet failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> sendWallet(
      {required String uuid, required num price}) async {
    try {
      final data = {
        'uuid': uuid,
        'price': price,
        "currency_id": LocalStorage.getSelectedCurrency()?.id
      };

      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/user/wallet/send', data: data);

      return left(true);
    } catch (e) {
      debugPrint('==> send wallet failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> paymentBookWebView(
      {required String name, required int? bookId}) async {
    try {
      final data = {
        'booking_id': bookId,
      };

      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/dashboard/user/$name-process', data: data);

      return left(res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view booking failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> paymentMembershipWebView(
      {required String name, required int? memberShip}) async {
    try {
      final data = {
        'member_ship_id': memberShip,
      };

      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/dashboard/user/$name-process', data: data);

      return left(res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view membership failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<TransactionsResponse, dynamic>> createMembershipTransaction(
      {required int membershipId, required int paymentId}) async {
    final data = {'payment_sys_id': paymentId};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/member-ship/$membershipId/transactions',
        data: data,
      );
      return left(
        TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction membership failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> paymentGiftCartWebView(
      {required String name, required int? giftCartId}) async {
    try {
      final data = {
        'gift_cart_id': giftCartId,
      };

      final client = dioHttp.client(requireAuth: true);
      final res =
          await client.post('/api/v1/dashboard/user/$name-process', data: data);

      return left(res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view gift cart failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<TransactionsResponse, dynamic>> createGiftCartTransaction(
      {required int giftCartId, required int paymentId}) async {
    final data = {'payment_sys_id': paymentId};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/gift-cart/$giftCartId/transactions',
        data: data,
      );
      return left(
        TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction gift failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
