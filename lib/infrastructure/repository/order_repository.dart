import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/order.dart';
import 'package:ibeauty/domain/model/model/create_order_model.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/response/order_pagenation_response.dart';
import 'package:ibeauty/domain/model/response/refund_pagination_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:path_provider/path_provider.dart';

class OrderRepository implements OrderInterface {
  @override
  Future<Either<bool, dynamic>> createOrder(
      {required CreateOrderModel order}) async {
    {
      try {
        final client = dioHttp.client(requireAuth: true);
         await client.post(
          '/api/v1/dashboard/user/orders',
          data: order.toJson(),
        );
        return left(true);
      } catch (e) {
        debugPrint('==> create order failure: $e');
        return right(AppHelper.errorHandler(e));
      }
    }
  }

  @override
  Future<Either<OrderModel, dynamic>> getOrderDetails(int id) async {
    try {
      final data = {
        if (LocalStorage.getSelectedCurrency() != null)
          'currency_id': LocalStorage.getSelectedCurrency()?.id,
        'lang': LocalStorage.getLanguage()?.locale
      };
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get('/api/v1/dashboard/user/orders/$id/get-all',
          queryParameters: data);
      return left(OrderModel.fromJson(res.data));
    } catch (e) {
      debugPrint('==> fetch order failure: $e');
      if ((e.runtimeType == DioException)) {
        if ((e as DioException).type == DioExceptionType.badResponse) {
          if (e.response?.statusCode == 404) {
            return right(404);
          }
        }
      }

      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<OrderPaginateResponse, dynamic>> getOrders(
      {required int page, required String type}) async {
    final data = {
      if (LocalStorage.getSelectedCurrency() != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'lang': LocalStorage.getLanguage()?.locale,
      'page': page,
      "parent": 1,
      "perPage": 10
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get('/api/v1/dashboard/user/orders/paginate',
          queryParameters: data);
      return left(OrderPaginateResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> fetch order list failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> cancelOrder({required int orderId}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
          '/api/v1/dashboard/user/orders/$orderId/status/change?status=canceled');
      return left(true);
    } catch (e) {
      debugPrint('==> cancel order failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> refundOrder(
      {required int orderId, required String title}) async {
    try {
      final data = {
        "order_id": orderId,
        "cause": title,
      };
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/user/order-refunds', data: data);
      return left(true);
    } catch (e) {
      debugPrint('==> refund order failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<RefundOrdersModel, dynamic>> getRefundOrders(
      {required int page}) async {
    final data = {
      if (LocalStorage.getSelectedCurrency() != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      if (LocalStorage.getLanguage() != null)
        'lang': LocalStorage.getLanguage()?.locale,
      "perPage": 10,
      "page": page
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get(
          '/api/v1/dashboard/user/order-refunds/paginate',
          queryParameters: data);
      return left(RefundOrdersModel.fromJson(res.data));
    } catch (e) {
      debugPrint('==> fetch refund order list failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> getOrderInvoice({required int id}) async {
    try {
      final localPath = (await findLocalPath(id))!;
      final savedDir = Directory(localPath);

      if (!savedDir.existsSync()) {
        await savedDir.create();
      }
      final taskId = await FlutterDownloader.enqueue(
          url:
              '${AppConstants.baseUrl}api/v1/dashboard/user/export/order/$id/pdf',
          headers: {"Authorization": "Bearer ${LocalStorage.getToken()}"},
          savedDir: localPath,
          showNotification: true,
          saveInPublicStorage: true);
      return left(taskId ?? "");
    } catch (e) {
      debugPrint('==> FlutterDownloader.enqueue failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  Future<String?> findLocalPath(int id) async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }

    String localPath = '${externalStorageDirPath!}/invoice-$id';
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return externalStorageDirPath;
  }

  @override
  Future<Either<RefundModel, dynamic>> getRefundOrderDetails(int id) async {
    try {
      final data = {
        if (LocalStorage.getSelectedCurrency() != null)
          'currency_id': LocalStorage.getSelectedCurrency()?.id,
        'lang': LocalStorage.getLanguage()?.locale
      };
      final client = dioHttp.client(requireAuth: true);
      final res = await client.get('/api/v1/dashboard/user/order-refunds/$id',
          queryParameters: data);
      return left(RefundModel.fromJson(res.data["data"]));
    } catch (e) {
      debugPrint('==> fetch refund order failure: $e');
      if ((e.runtimeType == DioException)) {
        if ((e as DioException).type == DioExceptionType.badResponse) {
          if (e.response?.statusCode == 404) {
            return right(404);
          }
        }
      }

      return right(AppHelper.errorHandler(e));
    }
  }
}
