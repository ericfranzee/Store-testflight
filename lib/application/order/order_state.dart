part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    @Default([]) List<OrderShops> activeOrders,
    @Default([]) List<RefundModel> refundOrders,
    @Default(null) OrderModel? order,
    @Default(null) RefundModel? refundOrder,
    @Default(true) bool isLoadingActive,
    @Default(true) bool isLoadingHistory,
    @Default(true) bool isLoadingRefund,
    @Default(false) bool isLoading,
    @Default(false) bool anotherOrder,
    @Default(false) bool isButtonLoading,
  }) = _OrderState;
}
