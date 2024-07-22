// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEventCopyWith<OrderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchActiveOrdersImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$FetchActiveOrdersImplCopyWith(_$FetchActiveOrdersImpl value,
          $Res Function(_$FetchActiveOrdersImpl) then) =
      __$$FetchActiveOrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchActiveOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$FetchActiveOrdersImpl>
    implements _$$FetchActiveOrdersImplCopyWith<$Res> {
  __$$FetchActiveOrdersImplCopyWithImpl(_$FetchActiveOrdersImpl _value,
      $Res Function(_$FetchActiveOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchActiveOrdersImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchActiveOrdersImpl implements FetchActiveOrders {
  const _$FetchActiveOrdersImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'OrderEvent.fetchActiveOrders(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchActiveOrdersImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchActiveOrdersImplCopyWith<_$FetchActiveOrdersImpl> get copyWith =>
      __$$FetchActiveOrdersImplCopyWithImpl<_$FetchActiveOrdersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return fetchActiveOrders(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return fetchActiveOrders?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (fetchActiveOrders != null) {
      return fetchActiveOrders(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return fetchActiveOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return fetchActiveOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (fetchActiveOrders != null) {
      return fetchActiveOrders(this);
    }
    return orElse();
  }
}

abstract class FetchActiveOrders implements OrderEvent {
  const factory FetchActiveOrders(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchActiveOrdersImpl;

  @override
  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchActiveOrdersImplCopyWith<_$FetchActiveOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchRefundOrdersImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$FetchRefundOrdersImplCopyWith(_$FetchRefundOrdersImpl value,
          $Res Function(_$FetchRefundOrdersImpl) then) =
      __$$FetchRefundOrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchRefundOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$FetchRefundOrdersImpl>
    implements _$$FetchRefundOrdersImplCopyWith<$Res> {
  __$$FetchRefundOrdersImplCopyWithImpl(_$FetchRefundOrdersImpl _value,
      $Res Function(_$FetchRefundOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchRefundOrdersImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchRefundOrdersImpl implements FetchRefundOrders {
  const _$FetchRefundOrdersImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'OrderEvent.fetchRefundOrders(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchRefundOrdersImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchRefundOrdersImplCopyWith<_$FetchRefundOrdersImpl> get copyWith =>
      __$$FetchRefundOrdersImplCopyWithImpl<_$FetchRefundOrdersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return fetchRefundOrders(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return fetchRefundOrders?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (fetchRefundOrders != null) {
      return fetchRefundOrders(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return fetchRefundOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return fetchRefundOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (fetchRefundOrders != null) {
      return fetchRefundOrders(this);
    }
    return orElse();
  }
}

abstract class FetchRefundOrders implements OrderEvent {
  const factory FetchRefundOrders(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchRefundOrdersImpl;

  @override
  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchRefundOrdersImplCopyWith<_$FetchRefundOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchOrderByIdImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$FetchOrderByIdImplCopyWith(_$FetchOrderByIdImpl value,
          $Res Function(_$FetchOrderByIdImpl) then) =
      __$$FetchOrderByIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int id, OrderModel? order});
}

/// @nodoc
class __$$FetchOrderByIdImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$FetchOrderByIdImpl>
    implements _$$FetchOrderByIdImplCopyWith<$Res> {
  __$$FetchOrderByIdImplCopyWithImpl(
      _$FetchOrderByIdImpl _value, $Res Function(_$FetchOrderByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? order = freezed,
  }) {
    return _then(_$FetchOrderByIdImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc

class _$FetchOrderByIdImpl implements FetchOrderById {
  const _$FetchOrderByIdImpl(
      {required this.context, required this.id, this.order});

  @override
  final BuildContext context;
  @override
  final int id;
  @override
  final OrderModel? order;

  @override
  String toString() {
    return 'OrderEvent.fetchOrderById(context: $context, id: $id, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchOrderByIdImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchOrderByIdImplCopyWith<_$FetchOrderByIdImpl> get copyWith =>
      __$$FetchOrderByIdImplCopyWithImpl<_$FetchOrderByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return fetchOrderById(context, id, order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return fetchOrderById?.call(context, id, order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (fetchOrderById != null) {
      return fetchOrderById(context, id, order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return fetchOrderById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return fetchOrderById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (fetchOrderById != null) {
      return fetchOrderById(this);
    }
    return orElse();
  }
}

abstract class FetchOrderById implements OrderEvent {
  const factory FetchOrderById(
      {required final BuildContext context,
      required final int id,
      final OrderModel? order}) = _$FetchOrderByIdImpl;

  @override
  BuildContext get context;
  int get id;
  OrderModel? get order;
  @override
  @JsonKey(ignore: true)
  _$$FetchOrderByIdImplCopyWith<_$FetchOrderByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchRefundOrderByIdImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$FetchRefundOrderByIdImplCopyWith(_$FetchRefundOrderByIdImpl value,
          $Res Function(_$FetchRefundOrderByIdImpl) then) =
      __$$FetchRefundOrderByIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int id, RefundModel? refund});
}

/// @nodoc
class __$$FetchRefundOrderByIdImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$FetchRefundOrderByIdImpl>
    implements _$$FetchRefundOrderByIdImplCopyWith<$Res> {
  __$$FetchRefundOrderByIdImplCopyWithImpl(_$FetchRefundOrderByIdImpl _value,
      $Res Function(_$FetchRefundOrderByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? refund = freezed,
  }) {
    return _then(_$FetchRefundOrderByIdImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      refund: freezed == refund
          ? _value.refund
          : refund // ignore: cast_nullable_to_non_nullable
              as RefundModel?,
    ));
  }
}

/// @nodoc

class _$FetchRefundOrderByIdImpl implements FetchRefundOrderById {
  const _$FetchRefundOrderByIdImpl(
      {required this.context, required this.id, this.refund});

  @override
  final BuildContext context;
  @override
  final int id;
  @override
  final RefundModel? refund;

  @override
  String toString() {
    return 'OrderEvent.fetchRefundOrderById(context: $context, id: $id, refund: $refund)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchRefundOrderByIdImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.refund, refund) || other.refund == refund));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id, refund);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchRefundOrderByIdImplCopyWith<_$FetchRefundOrderByIdImpl>
      get copyWith =>
          __$$FetchRefundOrderByIdImplCopyWithImpl<_$FetchRefundOrderByIdImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return fetchRefundOrderById(context, id, refund);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return fetchRefundOrderById?.call(context, id, refund);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (fetchRefundOrderById != null) {
      return fetchRefundOrderById(context, id, refund);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return fetchRefundOrderById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return fetchRefundOrderById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (fetchRefundOrderById != null) {
      return fetchRefundOrderById(this);
    }
    return orElse();
  }
}

abstract class FetchRefundOrderById implements OrderEvent {
  const factory FetchRefundOrderById(
      {required final BuildContext context,
      required final int id,
      final RefundModel? refund}) = _$FetchRefundOrderByIdImpl;

  @override
  BuildContext get context;
  int get id;
  RefundModel? get refund;
  @override
  @JsonKey(ignore: true)
  _$$FetchRefundOrderByIdImplCopyWith<_$FetchRefundOrderByIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrderImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$CreateOrderImplCopyWith(
          _$CreateOrderImpl value, $Res Function(_$CreateOrderImpl) then) =
      __$$CreateOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context,
      CreateOrderModel order,
      PaymentData payment,
      num totalPrice,
      VoidCallback onSuccess});
}

/// @nodoc
class __$$CreateOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$CreateOrderImpl>
    implements _$$CreateOrderImplCopyWith<$Res> {
  __$$CreateOrderImplCopyWithImpl(
      _$CreateOrderImpl _value, $Res Function(_$CreateOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? order = null,
    Object? payment = null,
    Object? totalPrice = null,
    Object? onSuccess = null,
  }) {
    return _then(_$CreateOrderImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as CreateOrderModel,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentData,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$CreateOrderImpl implements CreateOrder {
  const _$CreateOrderImpl(
      {required this.context,
      required this.order,
      required this.payment,
      required this.totalPrice,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final CreateOrderModel order;
  @override
  final PaymentData payment;
  @override
  final num totalPrice;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'OrderEvent.createOrder(context: $context, order: $order, payment: $payment, totalPrice: $totalPrice, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, order, payment, totalPrice, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      __$$CreateOrderImplCopyWithImpl<_$CreateOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return createOrder(context, order, payment, totalPrice, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return createOrder?.call(context, order, payment, totalPrice, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(context, order, payment, totalPrice, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return createOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return createOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(this);
    }
    return orElse();
  }
}

abstract class CreateOrder implements OrderEvent {
  const factory CreateOrder(
      {required final BuildContext context,
      required final CreateOrderModel order,
      required final PaymentData payment,
      required final num totalPrice,
      required final VoidCallback onSuccess}) = _$CreateOrderImpl;

  @override
  BuildContext get context;
  CreateOrderModel get order;
  PaymentData get payment;
  num get totalPrice;
  VoidCallback get onSuccess;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelOrderImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$CancelOrderImplCopyWith(
          _$CancelOrderImpl value, $Res Function(_$CancelOrderImpl) then) =
      __$$CancelOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int id, VoidCallback onSuccess});
}

/// @nodoc
class __$$CancelOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$CancelOrderImpl>
    implements _$$CancelOrderImplCopyWith<$Res> {
  __$$CancelOrderImplCopyWithImpl(
      _$CancelOrderImpl _value, $Res Function(_$CancelOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? onSuccess = null,
  }) {
    return _then(_$CancelOrderImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$CancelOrderImpl implements CancelOrder {
  const _$CancelOrderImpl(
      {required this.context, required this.id, required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int id;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'OrderEvent.cancelOrder(context: $context, id: $id, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      __$$CancelOrderImplCopyWithImpl<_$CancelOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return cancelOrder(context, id, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return cancelOrder?.call(context, id, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(context, id, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class CancelOrder implements OrderEvent {
  const factory CancelOrder(
      {required final BuildContext context,
      required final int id,
      required final VoidCallback onSuccess}) = _$CancelOrderImpl;

  @override
  BuildContext get context;
  int get id;
  VoidCallback get onSuccess;
  @override
  @JsonKey(ignore: true)
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefundOrderImplCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory _$$RefundOrderImplCopyWith(
          _$RefundOrderImpl value, $Res Function(_$RefundOrderImpl) then) =
      __$$RefundOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, int id, String reason, VoidCallback onSuccess});
}

/// @nodoc
class __$$RefundOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$RefundOrderImpl>
    implements _$$RefundOrderImplCopyWith<$Res> {
  __$$RefundOrderImplCopyWithImpl(
      _$RefundOrderImpl _value, $Res Function(_$RefundOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
    Object? reason = null,
    Object? onSuccess = null,
  }) {
    return _then(_$RefundOrderImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$RefundOrderImpl implements RefundOrder {
  const _$RefundOrderImpl(
      {required this.context,
      required this.id,
      required this.reason,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int id;
  @override
  final String reason;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'OrderEvent.refundOrder(context: $context, id: $id, reason: $reason, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundOrderImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id, reason, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundOrderImplCopyWith<_$RefundOrderImpl> get copyWith =>
      __$$RefundOrderImplCopyWithImpl<_$RefundOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveOrders,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchRefundOrders,
    required TResult Function(BuildContext context, int id, OrderModel? order)
        fetchOrderById,
    required TResult Function(BuildContext context, int id, RefundModel? refund)
        fetchRefundOrderById,
    required TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)
        createOrder,
    required TResult Function(
            BuildContext context, int id, VoidCallback onSuccess)
        cancelOrder,
    required TResult Function(
            BuildContext context, int id, String reason, VoidCallback onSuccess)
        refundOrder,
  }) {
    return refundOrder(context, id, reason, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult? Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult? Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult? Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult? Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult? Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
  }) {
    return refundOrder?.call(context, id, reason, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveOrders,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchRefundOrders,
    TResult Function(BuildContext context, int id, OrderModel? order)?
        fetchOrderById,
    TResult Function(BuildContext context, int id, RefundModel? refund)?
        fetchRefundOrderById,
    TResult Function(BuildContext context, CreateOrderModel order,
            PaymentData payment, num totalPrice, VoidCallback onSuccess)?
        createOrder,
    TResult Function(BuildContext context, int id, VoidCallback onSuccess)?
        cancelOrder,
    TResult Function(BuildContext context, int id, String reason,
            VoidCallback onSuccess)?
        refundOrder,
    required TResult orElse(),
  }) {
    if (refundOrder != null) {
      return refundOrder(context, id, reason, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveOrders value) fetchActiveOrders,
    required TResult Function(FetchRefundOrders value) fetchRefundOrders,
    required TResult Function(FetchOrderById value) fetchOrderById,
    required TResult Function(FetchRefundOrderById value) fetchRefundOrderById,
    required TResult Function(CreateOrder value) createOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(RefundOrder value) refundOrder,
  }) {
    return refundOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult? Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult? Function(FetchOrderById value)? fetchOrderById,
    TResult? Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult? Function(CreateOrder value)? createOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(RefundOrder value)? refundOrder,
  }) {
    return refundOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveOrders value)? fetchActiveOrders,
    TResult Function(FetchRefundOrders value)? fetchRefundOrders,
    TResult Function(FetchOrderById value)? fetchOrderById,
    TResult Function(FetchRefundOrderById value)? fetchRefundOrderById,
    TResult Function(CreateOrder value)? createOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(RefundOrder value)? refundOrder,
    required TResult orElse(),
  }) {
    if (refundOrder != null) {
      return refundOrder(this);
    }
    return orElse();
  }
}

abstract class RefundOrder implements OrderEvent {
  const factory RefundOrder(
      {required final BuildContext context,
      required final int id,
      required final String reason,
      required final VoidCallback onSuccess}) = _$RefundOrderImpl;

  @override
  BuildContext get context;
  int get id;
  String get reason;
  VoidCallback get onSuccess;
  @override
  @JsonKey(ignore: true)
  _$$RefundOrderImplCopyWith<_$RefundOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderState {
  List<OrderShops> get activeOrders => throw _privateConstructorUsedError;
  List<RefundModel> get refundOrders => throw _privateConstructorUsedError;
  OrderModel? get order => throw _privateConstructorUsedError;
  RefundModel? get refundOrder => throw _privateConstructorUsedError;
  bool get isLoadingActive => throw _privateConstructorUsedError;
  bool get isLoadingHistory => throw _privateConstructorUsedError;
  bool get isLoadingRefund => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get anotherOrder => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {List<OrderShops> activeOrders,
      List<RefundModel> refundOrders,
      OrderModel? order,
      RefundModel? refundOrder,
      bool isLoadingActive,
      bool isLoadingHistory,
      bool isLoadingRefund,
      bool isLoading,
      bool anotherOrder,
      bool isButtonLoading});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeOrders = null,
    Object? refundOrders = null,
    Object? order = freezed,
    Object? refundOrder = freezed,
    Object? isLoadingActive = null,
    Object? isLoadingHistory = null,
    Object? isLoadingRefund = null,
    Object? isLoading = null,
    Object? anotherOrder = null,
    Object? isButtonLoading = null,
  }) {
    return _then(_value.copyWith(
      activeOrders: null == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderShops>,
      refundOrders: null == refundOrders
          ? _value.refundOrders
          : refundOrders // ignore: cast_nullable_to_non_nullable
              as List<RefundModel>,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      refundOrder: freezed == refundOrder
          ? _value.refundOrder
          : refundOrder // ignore: cast_nullable_to_non_nullable
              as RefundModel?,
      isLoadingActive: null == isLoadingActive
          ? _value.isLoadingActive
          : isLoadingActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingHistory: null == isLoadingHistory
          ? _value.isLoadingHistory
          : isLoadingHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingRefund: null == isLoadingRefund
          ? _value.isLoadingRefund
          : isLoadingRefund // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      anotherOrder: null == anotherOrder
          ? _value.anotherOrder
          : anotherOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderShops> activeOrders,
      List<RefundModel> refundOrders,
      OrderModel? order,
      RefundModel? refundOrder,
      bool isLoadingActive,
      bool isLoadingHistory,
      bool isLoadingRefund,
      bool isLoading,
      bool anotherOrder,
      bool isButtonLoading});
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeOrders = null,
    Object? refundOrders = null,
    Object? order = freezed,
    Object? refundOrder = freezed,
    Object? isLoadingActive = null,
    Object? isLoadingHistory = null,
    Object? isLoadingRefund = null,
    Object? isLoading = null,
    Object? anotherOrder = null,
    Object? isButtonLoading = null,
  }) {
    return _then(_$OrderStateImpl(
      activeOrders: null == activeOrders
          ? _value._activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderShops>,
      refundOrders: null == refundOrders
          ? _value._refundOrders
          : refundOrders // ignore: cast_nullable_to_non_nullable
              as List<RefundModel>,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      refundOrder: freezed == refundOrder
          ? _value.refundOrder
          : refundOrder // ignore: cast_nullable_to_non_nullable
              as RefundModel?,
      isLoadingActive: null == isLoadingActive
          ? _value.isLoadingActive
          : isLoadingActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingHistory: null == isLoadingHistory
          ? _value.isLoadingHistory
          : isLoadingHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingRefund: null == isLoadingRefund
          ? _value.isLoadingRefund
          : isLoadingRefund // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      anotherOrder: null == anotherOrder
          ? _value.anotherOrder
          : anotherOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl(
      {final List<OrderShops> activeOrders = const [],
      final List<RefundModel> refundOrders = const [],
      this.order = null,
      this.refundOrder = null,
      this.isLoadingActive = true,
      this.isLoadingHistory = true,
      this.isLoadingRefund = true,
      this.isLoading = false,
      this.anotherOrder = false,
      this.isButtonLoading = false})
      : _activeOrders = activeOrders,
        _refundOrders = refundOrders;

  final List<OrderShops> _activeOrders;
  @override
  @JsonKey()
  List<OrderShops> get activeOrders {
    if (_activeOrders is EqualUnmodifiableListView) return _activeOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeOrders);
  }

  final List<RefundModel> _refundOrders;
  @override
  @JsonKey()
  List<RefundModel> get refundOrders {
    if (_refundOrders is EqualUnmodifiableListView) return _refundOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_refundOrders);
  }

  @override
  @JsonKey()
  final OrderModel? order;
  @override
  @JsonKey()
  final RefundModel? refundOrder;
  @override
  @JsonKey()
  final bool isLoadingActive;
  @override
  @JsonKey()
  final bool isLoadingHistory;
  @override
  @JsonKey()
  final bool isLoadingRefund;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool anotherOrder;
  @override
  @JsonKey()
  final bool isButtonLoading;

  @override
  String toString() {
    return 'OrderState(activeOrders: $activeOrders, refundOrders: $refundOrders, order: $order, refundOrder: $refundOrder, isLoadingActive: $isLoadingActive, isLoadingHistory: $isLoadingHistory, isLoadingRefund: $isLoadingRefund, isLoading: $isLoading, anotherOrder: $anotherOrder, isButtonLoading: $isButtonLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            const DeepCollectionEquality()
                .equals(other._activeOrders, _activeOrders) &&
            const DeepCollectionEquality()
                .equals(other._refundOrders, _refundOrders) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.refundOrder, refundOrder) ||
                other.refundOrder == refundOrder) &&
            (identical(other.isLoadingActive, isLoadingActive) ||
                other.isLoadingActive == isLoadingActive) &&
            (identical(other.isLoadingHistory, isLoadingHistory) ||
                other.isLoadingHistory == isLoadingHistory) &&
            (identical(other.isLoadingRefund, isLoadingRefund) ||
                other.isLoadingRefund == isLoadingRefund) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.anotherOrder, anotherOrder) ||
                other.anotherOrder == anotherOrder) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeOrders),
      const DeepCollectionEquality().hash(_refundOrders),
      order,
      refundOrder,
      isLoadingActive,
      isLoadingHistory,
      isLoadingRefund,
      isLoading,
      anotherOrder,
      isButtonLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState(
      {final List<OrderShops> activeOrders,
      final List<RefundModel> refundOrders,
      final OrderModel? order,
      final RefundModel? refundOrder,
      final bool isLoadingActive,
      final bool isLoadingHistory,
      final bool isLoadingRefund,
      final bool isLoading,
      final bool anotherOrder,
      final bool isButtonLoading}) = _$OrderStateImpl;

  @override
  List<OrderShops> get activeOrders;
  @override
  List<RefundModel> get refundOrders;
  @override
  OrderModel? get order;
  @override
  RefundModel? get refundOrder;
  @override
  bool get isLoadingActive;
  @override
  bool get isLoadingHistory;
  @override
  bool get isLoadingRefund;
  @override
  bool get isLoading;
  @override
  bool get anotherOrder;
  @override
  bool get isButtonLoading;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
