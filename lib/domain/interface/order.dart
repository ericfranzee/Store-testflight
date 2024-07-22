import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/create_order_model.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/response/order_pagenation_response.dart';
import 'package:ibeauty/domain/model/response/refund_pagination_response.dart';

abstract class OrderInterface {
  Future<Either<OrderPaginateResponse, dynamic>> getOrders(
      {required int page, required String type});

  Future<Either<RefundOrdersModel, dynamic>> getRefundOrders(
      {required int page});

  Future<Either<OrderModel, dynamic>> getOrderDetails(int id);

  Future<Either<RefundModel, dynamic>> getRefundOrderDetails(int id);

  Future<Either<bool, dynamic>> createOrder({required CreateOrderModel order});

  Future<Either<bool, dynamic>> cancelOrder({required int orderId});

  Future<Either<bool, dynamic>> refundOrder({required int orderId,required String title});

  Future<Either<String, dynamic>> getOrderInvoice({
    required int id,
  });

}
