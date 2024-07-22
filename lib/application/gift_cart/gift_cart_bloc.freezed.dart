// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GiftCartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCartEventCopyWith<$Res> {
  factory $GiftCartEventCopyWith(
          GiftCartEvent value, $Res Function(GiftCartEvent) then) =
      _$GiftCartEventCopyWithImpl<$Res, GiftCartEvent>;
}

/// @nodoc
class _$GiftCartEventCopyWithImpl<$Res, $Val extends GiftCartEvent>
    implements $GiftCartEventCopyWith<$Res> {
  _$GiftCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchGiftCartImplCopyWith<$Res> {
  factory _$$FetchGiftCartImplCopyWith(
          _$FetchGiftCartImpl value, $Res Function(_$FetchGiftCartImpl) then) =
      __$$FetchGiftCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchGiftCartImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$FetchGiftCartImpl>
    implements _$$FetchGiftCartImplCopyWith<$Res> {
  __$$FetchGiftCartImplCopyWithImpl(
      _$FetchGiftCartImpl _value, $Res Function(_$FetchGiftCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchGiftCartImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchGiftCartImpl implements FetchGiftCart {
  const _$FetchGiftCartImpl(
      {required this.context, this.isRefresh, this.shopId, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final int? shopId;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'GiftCartEvent.fetchGiftCart(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchGiftCartImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, isRefresh, shopId, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchGiftCartImplCopyWith<_$FetchGiftCartImpl> get copyWith =>
      __$$FetchGiftCartImplCopyWithImpl<_$FetchGiftCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return fetchGiftCart(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return fetchGiftCart?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchGiftCart != null) {
      return fetchGiftCart(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return fetchGiftCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return fetchGiftCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchGiftCart != null) {
      return fetchGiftCart(this);
    }
    return orElse();
  }
}

abstract class FetchGiftCart implements GiftCartEvent {
  const factory FetchGiftCart(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchGiftCartImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchGiftCartImplCopyWith<_$FetchGiftCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPaymentIdImplCopyWith<$Res> {
  factory _$$SelectPaymentIdImplCopyWith(_$SelectPaymentIdImpl value,
          $Res Function(_$SelectPaymentIdImpl) then) =
      __$$SelectPaymentIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SelectPaymentIdImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$SelectPaymentIdImpl>
    implements _$$SelectPaymentIdImplCopyWith<$Res> {
  __$$SelectPaymentIdImplCopyWithImpl(
      _$SelectPaymentIdImpl _value, $Res Function(_$SelectPaymentIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SelectPaymentIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectPaymentIdImpl implements SelectPaymentId {
  const _$SelectPaymentIdImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'GiftCartEvent.selectPaymentId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPaymentIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPaymentIdImplCopyWith<_$SelectPaymentIdImpl> get copyWith =>
      __$$SelectPaymentIdImplCopyWithImpl<_$SelectPaymentIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return selectPaymentId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return selectPaymentId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (selectPaymentId != null) {
      return selectPaymentId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return selectPaymentId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return selectPaymentId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (selectPaymentId != null) {
      return selectPaymentId(this);
    }
    return orElse();
  }
}

abstract class SelectPaymentId implements GiftCartEvent {
  const factory SelectPaymentId({required final int id}) =
      _$SelectPaymentIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$SelectPaymentIdImplCopyWith<_$SelectPaymentIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPaymentsImplCopyWith<$Res> {
  factory _$$FetchPaymentsImplCopyWith(
          _$FetchPaymentsImpl value, $Res Function(_$FetchPaymentsImpl) then) =
      __$$FetchPaymentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$FetchPaymentsImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$FetchPaymentsImpl>
    implements _$$FetchPaymentsImplCopyWith<$Res> {
  __$$FetchPaymentsImplCopyWithImpl(
      _$FetchPaymentsImpl _value, $Res Function(_$FetchPaymentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$FetchPaymentsImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$FetchPaymentsImpl implements FetchPayments {
  const _$FetchPaymentsImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'GiftCartEvent.fetchPayments(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPaymentsImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPaymentsImplCopyWith<_$FetchPaymentsImpl> get copyWith =>
      __$$FetchPaymentsImplCopyWithImpl<_$FetchPaymentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return fetchPayments(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return fetchPayments?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchPayments != null) {
      return fetchPayments(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return fetchPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return fetchPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchPayments != null) {
      return fetchPayments(this);
    }
    return orElse();
  }
}

abstract class FetchPayments implements GiftCartEvent {
  const factory FetchPayments({required final BuildContext context}) =
      _$FetchPaymentsImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$FetchPaymentsImplCopyWith<_$FetchPaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchWebViewImplCopyWith<$Res> {
  factory _$$FetchWebViewImplCopyWith(
          _$FetchWebViewImpl value, $Res Function(_$FetchWebViewImpl) then) =
      __$$FetchWebViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int giftCartId, VoidCallback? onSuccess});
}

/// @nodoc
class __$$FetchWebViewImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$FetchWebViewImpl>
    implements _$$FetchWebViewImplCopyWith<$Res> {
  __$$FetchWebViewImplCopyWithImpl(
      _$FetchWebViewImpl _value, $Res Function(_$FetchWebViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? giftCartId = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$FetchWebViewImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      giftCartId: null == giftCartId
          ? _value.giftCartId
          : giftCartId // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$FetchWebViewImpl implements FetchWebView {
  const _$FetchWebViewImpl(
      {required this.context,
      required this.giftCartId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int giftCartId;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'GiftCartEvent.fetchWebView(context: $context, giftCartId: $giftCartId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchWebViewImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.giftCartId, giftCartId) ||
                other.giftCartId == giftCartId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, giftCartId, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchWebViewImplCopyWith<_$FetchWebViewImpl> get copyWith =>
      __$$FetchWebViewImplCopyWithImpl<_$FetchWebViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return fetchWebView(context, giftCartId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return fetchWebView?.call(context, giftCartId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchWebView != null) {
      return fetchWebView(context, giftCartId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return fetchWebView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return fetchWebView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (fetchWebView != null) {
      return fetchWebView(this);
    }
    return orElse();
  }
}

abstract class FetchWebView implements GiftCartEvent {
  const factory FetchWebView(
      {required final BuildContext context,
      required final int giftCartId,
      required final VoidCallback? onSuccess}) = _$FetchWebViewImpl;

  BuildContext get context;
  int get giftCartId;
  VoidCallback? get onSuccess;
  @JsonKey(ignore: true)
  _$$FetchWebViewImplCopyWith<_$FetchWebViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTransactionImplCopyWith<$Res> {
  factory _$$CreateTransactionImplCopyWith(_$CreateTransactionImpl value,
          $Res Function(_$CreateTransactionImpl) then) =
      __$$CreateTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int giftCartId, VoidCallback? onSuccess});
}

/// @nodoc
class __$$CreateTransactionImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$CreateTransactionImpl>
    implements _$$CreateTransactionImplCopyWith<$Res> {
  __$$CreateTransactionImplCopyWithImpl(_$CreateTransactionImpl _value,
      $Res Function(_$CreateTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? giftCartId = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$CreateTransactionImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      giftCartId: null == giftCartId
          ? _value.giftCartId
          : giftCartId // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: freezed == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$CreateTransactionImpl implements CreateTransaction {
  const _$CreateTransactionImpl(
      {required this.context,
      required this.giftCartId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int giftCartId;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'GiftCartEvent.createTransaction(context: $context, giftCartId: $giftCartId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.giftCartId, giftCartId) ||
                other.giftCartId == giftCartId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, giftCartId, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      __$$CreateTransactionImplCopyWithImpl<_$CreateTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return createTransaction(context, giftCartId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return createTransaction?.call(context, giftCartId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(context, giftCartId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return createTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return createTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(this);
    }
    return orElse();
  }
}

abstract class CreateTransaction implements GiftCartEvent {
  const factory CreateTransaction(
      {required final BuildContext context,
      required final int giftCartId,
      required final VoidCallback? onSuccess}) = _$CreateTransactionImpl;

  BuildContext get context;
  int get giftCartId;
  VoidCallback? get onSuccess;
  @JsonKey(ignore: true)
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyGiftCartImplCopyWith<$Res> {
  factory _$$MyGiftCartImplCopyWith(
          _$MyGiftCartImpl value, $Res Function(_$MyGiftCartImpl) then) =
      __$$MyGiftCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? serviceId,
      int? shopId,
      bool? valid,
      RefreshController? controller});
}

/// @nodoc
class __$$MyGiftCartImplCopyWithImpl<$Res>
    extends _$GiftCartEventCopyWithImpl<$Res, _$MyGiftCartImpl>
    implements _$$MyGiftCartImplCopyWith<$Res> {
  __$$MyGiftCartImplCopyWithImpl(
      _$MyGiftCartImpl _value, $Res Function(_$MyGiftCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? serviceId = freezed,
    Object? shopId = freezed,
    Object? valid = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$MyGiftCartImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      valid: freezed == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$MyGiftCartImpl implements MyGiftCart {
  const _$MyGiftCartImpl(
      {required this.context,
      this.isRefresh,
      this.serviceId,
      this.shopId,
      this.valid,
      this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final int? serviceId;
  @override
  final int? shopId;
  @override
  final bool? valid;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'GiftCartEvent.myGiftCart(context: $context, isRefresh: $isRefresh, serviceId: $serviceId, shopId: $shopId, valid: $valid, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyGiftCartImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, context, isRefresh, serviceId, shopId, valid, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyGiftCartImplCopyWith<_$MyGiftCartImpl> get copyWith =>
      __$$MyGiftCartImplCopyWithImpl<_$MyGiftCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchGiftCart,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? serviceId,
            int? shopId,
            bool? valid,
            RefreshController? controller)
        myGiftCart,
  }) {
    return myGiftCart(context, isRefresh, serviceId, shopId, valid, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
  }) {
    return myGiftCart?.call(
        context, isRefresh, serviceId, shopId, valid, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchGiftCart,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int giftCartId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, bool? valid, RefreshController? controller)?
        myGiftCart,
    required TResult orElse(),
  }) {
    if (myGiftCart != null) {
      return myGiftCart(
          context, isRefresh, serviceId, shopId, valid, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGiftCart value) fetchGiftCart,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyGiftCart value) myGiftCart,
  }) {
    return myGiftCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGiftCart value)? fetchGiftCart,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyGiftCart value)? myGiftCart,
  }) {
    return myGiftCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGiftCart value)? fetchGiftCart,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyGiftCart value)? myGiftCart,
    required TResult orElse(),
  }) {
    if (myGiftCart != null) {
      return myGiftCart(this);
    }
    return orElse();
  }
}

abstract class MyGiftCart implements GiftCartEvent {
  const factory MyGiftCart(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? serviceId,
      final int? shopId,
      final bool? valid,
      final RefreshController? controller}) = _$MyGiftCartImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get serviceId;
  int? get shopId;
  bool? get valid;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$MyGiftCartImplCopyWith<_$MyGiftCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftCartState {
  List<GiftCartModel> get giftCarts => throw _privateConstructorUsedError;
  List<MyGiftCartModel> get myGiftCarts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  bool get isPaymentLoading => throw _privateConstructorUsedError;
  int get selectPayment => throw _privateConstructorUsedError;
  List<PaymentData>? get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftCartStateCopyWith<GiftCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCartStateCopyWith<$Res> {
  factory $GiftCartStateCopyWith(
          GiftCartState value, $Res Function(GiftCartState) then) =
      _$GiftCartStateCopyWithImpl<$Res, GiftCartState>;
  @useResult
  $Res call(
      {List<GiftCartModel> giftCarts,
      List<MyGiftCartModel> myGiftCarts,
      bool isLoading,
      bool isButtonLoading,
      bool isPaymentLoading,
      int selectPayment,
      List<PaymentData>? list});
}

/// @nodoc
class _$GiftCartStateCopyWithImpl<$Res, $Val extends GiftCartState>
    implements $GiftCartStateCopyWith<$Res> {
  _$GiftCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCarts = null,
    Object? myGiftCarts = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      giftCarts: null == giftCarts
          ? _value.giftCarts
          : giftCarts // ignore: cast_nullable_to_non_nullable
              as List<GiftCartModel>,
      myGiftCarts: null == myGiftCarts
          ? _value.myGiftCarts
          : myGiftCarts // ignore: cast_nullable_to_non_nullable
              as List<MyGiftCartModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentLoading: null == isPaymentLoading
          ? _value.isPaymentLoading
          : isPaymentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftCartStateImplCopyWith<$Res>
    implements $GiftCartStateCopyWith<$Res> {
  factory _$$GiftCartStateImplCopyWith(
          _$GiftCartStateImpl value, $Res Function(_$GiftCartStateImpl) then) =
      __$$GiftCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GiftCartModel> giftCarts,
      List<MyGiftCartModel> myGiftCarts,
      bool isLoading,
      bool isButtonLoading,
      bool isPaymentLoading,
      int selectPayment,
      List<PaymentData>? list});
}

/// @nodoc
class __$$GiftCartStateImplCopyWithImpl<$Res>
    extends _$GiftCartStateCopyWithImpl<$Res, _$GiftCartStateImpl>
    implements _$$GiftCartStateImplCopyWith<$Res> {
  __$$GiftCartStateImplCopyWithImpl(
      _$GiftCartStateImpl _value, $Res Function(_$GiftCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCarts = null,
    Object? myGiftCarts = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? list = freezed,
  }) {
    return _then(_$GiftCartStateImpl(
      giftCarts: null == giftCarts
          ? _value._giftCarts
          : giftCarts // ignore: cast_nullable_to_non_nullable
              as List<GiftCartModel>,
      myGiftCarts: null == myGiftCarts
          ? _value._myGiftCarts
          : myGiftCarts // ignore: cast_nullable_to_non_nullable
              as List<MyGiftCartModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentLoading: null == isPaymentLoading
          ? _value.isPaymentLoading
          : isPaymentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
    ));
  }
}

/// @nodoc

class _$GiftCartStateImpl implements _GiftCartState {
  const _$GiftCartStateImpl(
      {final List<GiftCartModel> giftCarts = const [],
      final List<MyGiftCartModel> myGiftCarts = const [],
      this.isLoading = true,
      this.isButtonLoading = false,
      this.isPaymentLoading = true,
      this.selectPayment = -1,
      final List<PaymentData>? list = const []})
      : _giftCarts = giftCarts,
        _myGiftCarts = myGiftCarts,
        _list = list;

  final List<GiftCartModel> _giftCarts;
  @override
  @JsonKey()
  List<GiftCartModel> get giftCarts {
    if (_giftCarts is EqualUnmodifiableListView) return _giftCarts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_giftCarts);
  }

  final List<MyGiftCartModel> _myGiftCarts;
  @override
  @JsonKey()
  List<MyGiftCartModel> get myGiftCarts {
    if (_myGiftCarts is EqualUnmodifiableListView) return _myGiftCarts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myGiftCarts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isButtonLoading;
  @override
  @JsonKey()
  final bool isPaymentLoading;
  @override
  @JsonKey()
  final int selectPayment;
  final List<PaymentData>? _list;
  @override
  @JsonKey()
  List<PaymentData>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GiftCartState(giftCarts: $giftCarts, myGiftCarts: $myGiftCarts, isLoading: $isLoading, isButtonLoading: $isButtonLoading, isPaymentLoading: $isPaymentLoading, selectPayment: $selectPayment, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._giftCarts, _giftCarts) &&
            const DeepCollectionEquality()
                .equals(other._myGiftCarts, _myGiftCarts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading) &&
            (identical(other.isPaymentLoading, isPaymentLoading) ||
                other.isPaymentLoading == isPaymentLoading) &&
            (identical(other.selectPayment, selectPayment) ||
                other.selectPayment == selectPayment) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_giftCarts),
      const DeepCollectionEquality().hash(_myGiftCarts),
      isLoading,
      isButtonLoading,
      isPaymentLoading,
      selectPayment,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCartStateImplCopyWith<_$GiftCartStateImpl> get copyWith =>
      __$$GiftCartStateImplCopyWithImpl<_$GiftCartStateImpl>(this, _$identity);
}

abstract class _GiftCartState implements GiftCartState {
  const factory _GiftCartState(
      {final List<GiftCartModel> giftCarts,
      final List<MyGiftCartModel> myGiftCarts,
      final bool isLoading,
      final bool isButtonLoading,
      final bool isPaymentLoading,
      final int selectPayment,
      final List<PaymentData>? list}) = _$GiftCartStateImpl;

  @override
  List<GiftCartModel> get giftCarts;
  @override
  List<MyGiftCartModel> get myGiftCarts;
  @override
  bool get isLoading;
  @override
  bool get isButtonLoading;
  @override
  bool get isPaymentLoading;
  @override
  int get selectPayment;
  @override
  List<PaymentData>? get list;
  @override
  @JsonKey(ignore: true)
  _$$GiftCartStateImplCopyWith<_$GiftCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
