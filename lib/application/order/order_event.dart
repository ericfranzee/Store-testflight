part of 'order_bloc.dart';

@freezed
abstract class OrderEvent with _$OrderEvent {
  const factory OrderEvent.fetchActiveOrders(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchActiveOrders;

  const factory OrderEvent.fetchRefundOrders(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchRefundOrders;

  const factory OrderEvent.fetchOrderById(
      {required BuildContext context,
      required int id,
      OrderModel? order}) = FetchOrderById;

  const factory OrderEvent.fetchRefundOrderById(
      {required BuildContext context,
        required int id,
        RefundModel? refund}) = FetchRefundOrderById;

  const factory OrderEvent.createOrder(
      {required BuildContext context,
      required CreateOrderModel order,
      required PaymentData payment,
      required num totalPrice,
      required VoidCallback onSuccess}) = CreateOrder;

  const factory OrderEvent.cancelOrder(
      {required BuildContext context,
      required int id,
      required VoidCallback onSuccess}) = CancelOrder;

  const factory OrderEvent.refundOrder(
      {required BuildContext context,
        required int id,
        required String reason,
        required VoidCallback onSuccess}) = RefundOrder;
}
