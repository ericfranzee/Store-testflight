// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MembershipEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipEventCopyWith<$Res> {
  factory $MembershipEventCopyWith(
          MembershipEvent value, $Res Function(MembershipEvent) then) =
      _$MembershipEventCopyWithImpl<$Res, MembershipEvent>;
}

/// @nodoc
class _$MembershipEventCopyWithImpl<$Res, $Val extends MembershipEvent>
    implements $MembershipEventCopyWith<$Res> {
  _$MembershipEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchMembershipImplCopyWith<$Res> {
  factory _$$FetchMembershipImplCopyWith(_$FetchMembershipImpl value,
          $Res Function(_$FetchMembershipImpl) then) =
      __$$FetchMembershipImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchMembershipImplCopyWithImpl<$Res>
    extends _$MembershipEventCopyWithImpl<$Res, _$FetchMembershipImpl>
    implements _$$FetchMembershipImplCopyWith<$Res> {
  __$$FetchMembershipImplCopyWithImpl(
      _$FetchMembershipImpl _value, $Res Function(_$FetchMembershipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchMembershipImpl(
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

class _$FetchMembershipImpl implements FetchMembership {
  const _$FetchMembershipImpl(
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
    return 'MembershipEvent.fetchMembership(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMembershipImpl &&
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
  _$$FetchMembershipImplCopyWith<_$FetchMembershipImpl> get copyWith =>
      __$$FetchMembershipImplCopyWithImpl<_$FetchMembershipImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return fetchMembership(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return fetchMembership?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
    required TResult orElse(),
  }) {
    if (fetchMembership != null) {
      return fetchMembership(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return fetchMembership(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return fetchMembership?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (fetchMembership != null) {
      return fetchMembership(this);
    }
    return orElse();
  }
}

abstract class FetchMembership implements MembershipEvent {
  const factory FetchMembership(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchMembershipImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchMembershipImplCopyWith<_$FetchMembershipImpl> get copyWith =>
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
    extends _$MembershipEventCopyWithImpl<$Res, _$SelectPaymentIdImpl>
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
    return 'MembershipEvent.selectPaymentId(id: $id)';
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
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return selectPaymentId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return selectPaymentId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
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
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return selectPaymentId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return selectPaymentId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (selectPaymentId != null) {
      return selectPaymentId(this);
    }
    return orElse();
  }
}

abstract class SelectPaymentId implements MembershipEvent {
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
    extends _$MembershipEventCopyWithImpl<$Res, _$FetchPaymentsImpl>
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
    return 'MembershipEvent.fetchPayments(context: $context)';
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
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return fetchPayments(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return fetchPayments?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
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
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return fetchPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return fetchPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (fetchPayments != null) {
      return fetchPayments(this);
    }
    return orElse();
  }
}

abstract class FetchPayments implements MembershipEvent {
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
  $Res call({BuildContext context, int membershipId, VoidCallback? onSuccess});
}

/// @nodoc
class __$$FetchWebViewImplCopyWithImpl<$Res>
    extends _$MembershipEventCopyWithImpl<$Res, _$FetchWebViewImpl>
    implements _$$FetchWebViewImplCopyWith<$Res> {
  __$$FetchWebViewImplCopyWithImpl(
      _$FetchWebViewImpl _value, $Res Function(_$FetchWebViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? membershipId = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$FetchWebViewImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
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
      required this.membershipId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int membershipId;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'MembershipEvent.fetchWebView(context: $context, membershipId: $membershipId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchWebViewImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, membershipId, onSuccess);

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
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return fetchWebView(context, membershipId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return fetchWebView?.call(context, membershipId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
    required TResult orElse(),
  }) {
    if (fetchWebView != null) {
      return fetchWebView(context, membershipId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return fetchWebView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return fetchWebView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (fetchWebView != null) {
      return fetchWebView(this);
    }
    return orElse();
  }
}

abstract class FetchWebView implements MembershipEvent {
  const factory FetchWebView(
      {required final BuildContext context,
      required final int membershipId,
      required final VoidCallback? onSuccess}) = _$FetchWebViewImpl;

  BuildContext get context;
  int get membershipId;
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
  $Res call({BuildContext context, int membershipId, VoidCallback? onSuccess});
}

/// @nodoc
class __$$CreateTransactionImplCopyWithImpl<$Res>
    extends _$MembershipEventCopyWithImpl<$Res, _$CreateTransactionImpl>
    implements _$$CreateTransactionImplCopyWith<$Res> {
  __$$CreateTransactionImplCopyWithImpl(_$CreateTransactionImpl _value,
      $Res Function(_$CreateTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? membershipId = null,
    Object? onSuccess = freezed,
  }) {
    return _then(_$CreateTransactionImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
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
      required this.membershipId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final int membershipId;
  @override
  final VoidCallback? onSuccess;

  @override
  String toString() {
    return 'MembershipEvent.createTransaction(context: $context, membershipId: $membershipId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, membershipId, onSuccess);

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
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return createTransaction(context, membershipId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return createTransaction?.call(context, membershipId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(context, membershipId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return createTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return createTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(this);
    }
    return orElse();
  }
}

abstract class CreateTransaction implements MembershipEvent {
  const factory CreateTransaction(
      {required final BuildContext context,
      required final int membershipId,
      required final VoidCallback? onSuccess}) = _$CreateTransactionImpl;

  BuildContext get context;
  int get membershipId;
  VoidCallback? get onSuccess;
  @JsonKey(ignore: true)
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyMembershipsImplCopyWith<$Res> {
  factory _$$MyMembershipsImplCopyWith(
          _$MyMembershipsImpl value, $Res Function(_$MyMembershipsImpl) then) =
      __$$MyMembershipsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? serviceId,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$MyMembershipsImplCopyWithImpl<$Res>
    extends _$MembershipEventCopyWithImpl<$Res, _$MyMembershipsImpl>
    implements _$$MyMembershipsImplCopyWith<$Res> {
  __$$MyMembershipsImplCopyWithImpl(
      _$MyMembershipsImpl _value, $Res Function(_$MyMembershipsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? serviceId = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$MyMembershipsImpl(
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
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$MyMembershipsImpl implements MyMemberships {
  const _$MyMembershipsImpl(
      {required this.context,
      this.isRefresh,
      this.serviceId,
      this.shopId,
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
  final RefreshController? controller;

  @override
  String toString() {
    return 'MembershipEvent.myMemberships(context: $context, isRefresh: $isRefresh, serviceId: $serviceId, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyMembershipsImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, context, isRefresh, serviceId, shopId, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyMembershipsImplCopyWith<_$MyMembershipsImpl> get copyWith =>
      __$$MyMembershipsImplCopyWithImpl<_$MyMembershipsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchMembership,
    required TResult Function(int id) selectPaymentId,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        fetchWebView,
    required TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)
        createTransaction,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? serviceId, int? shopId, RefreshController? controller)
        myMemberships,
  }) {
    return myMemberships(context, isRefresh, serviceId, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult? Function(int id)? selectPaymentId,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult? Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult? Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
  }) {
    return myMemberships?.call(
        context, isRefresh, serviceId, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchMembership,
    TResult Function(int id)? selectPaymentId,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        fetchWebView,
    TResult Function(
            BuildContext context, int membershipId, VoidCallback? onSuccess)?
        createTransaction,
    TResult Function(BuildContext context, bool? isRefresh, int? serviceId,
            int? shopId, RefreshController? controller)?
        myMemberships,
    required TResult orElse(),
  }) {
    if (myMemberships != null) {
      return myMemberships(context, isRefresh, serviceId, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMembership value) fetchMembership,
    required TResult Function(SelectPaymentId value) selectPaymentId,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(FetchWebView value) fetchWebView,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(MyMemberships value) myMemberships,
  }) {
    return myMemberships(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMembership value)? fetchMembership,
    TResult? Function(SelectPaymentId value)? selectPaymentId,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(FetchWebView value)? fetchWebView,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(MyMemberships value)? myMemberships,
  }) {
    return myMemberships?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMembership value)? fetchMembership,
    TResult Function(SelectPaymentId value)? selectPaymentId,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(FetchWebView value)? fetchWebView,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(MyMemberships value)? myMemberships,
    required TResult orElse(),
  }) {
    if (myMemberships != null) {
      return myMemberships(this);
    }
    return orElse();
  }
}

abstract class MyMemberships implements MembershipEvent {
  const factory MyMemberships(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? serviceId,
      final int? shopId,
      final RefreshController? controller}) = _$MyMembershipsImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get serviceId;
  int? get shopId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$MyMembershipsImplCopyWith<_$MyMembershipsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MembershipState {
  List<MembershipModel> get memberships => throw _privateConstructorUsedError;
  List<MyMembershipModel> get myMemberships =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  bool get isPaymentLoading => throw _privateConstructorUsedError;
  int get selectPayment => throw _privateConstructorUsedError;
  List<PaymentData>? get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MembershipStateCopyWith<MembershipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipStateCopyWith<$Res> {
  factory $MembershipStateCopyWith(
          MembershipState value, $Res Function(MembershipState) then) =
      _$MembershipStateCopyWithImpl<$Res, MembershipState>;
  @useResult
  $Res call(
      {List<MembershipModel> memberships,
      List<MyMembershipModel> myMemberships,
      bool isLoading,
      bool isButtonLoading,
      bool isPaymentLoading,
      int selectPayment,
      List<PaymentData>? list});
}

/// @nodoc
class _$MembershipStateCopyWithImpl<$Res, $Val extends MembershipState>
    implements $MembershipStateCopyWith<$Res> {
  _$MembershipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberships = null,
    Object? myMemberships = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      memberships: null == memberships
          ? _value.memberships
          : memberships // ignore: cast_nullable_to_non_nullable
              as List<MembershipModel>,
      myMemberships: null == myMemberships
          ? _value.myMemberships
          : myMemberships // ignore: cast_nullable_to_non_nullable
              as List<MyMembershipModel>,
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
abstract class _$$MembershipStateImplCopyWith<$Res>
    implements $MembershipStateCopyWith<$Res> {
  factory _$$MembershipStateImplCopyWith(_$MembershipStateImpl value,
          $Res Function(_$MembershipStateImpl) then) =
      __$$MembershipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MembershipModel> memberships,
      List<MyMembershipModel> myMemberships,
      bool isLoading,
      bool isButtonLoading,
      bool isPaymentLoading,
      int selectPayment,
      List<PaymentData>? list});
}

/// @nodoc
class __$$MembershipStateImplCopyWithImpl<$Res>
    extends _$MembershipStateCopyWithImpl<$Res, _$MembershipStateImpl>
    implements _$$MembershipStateImplCopyWith<$Res> {
  __$$MembershipStateImplCopyWithImpl(
      _$MembershipStateImpl _value, $Res Function(_$MembershipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberships = null,
    Object? myMemberships = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? isPaymentLoading = null,
    Object? selectPayment = null,
    Object? list = freezed,
  }) {
    return _then(_$MembershipStateImpl(
      memberships: null == memberships
          ? _value._memberships
          : memberships // ignore: cast_nullable_to_non_nullable
              as List<MembershipModel>,
      myMemberships: null == myMemberships
          ? _value._myMemberships
          : myMemberships // ignore: cast_nullable_to_non_nullable
              as List<MyMembershipModel>,
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

class _$MembershipStateImpl implements _MembershipState {
  const _$MembershipStateImpl(
      {final List<MembershipModel> memberships = const [],
      final List<MyMembershipModel> myMemberships = const [],
      this.isLoading = true,
      this.isButtonLoading = false,
      this.isPaymentLoading = true,
      this.selectPayment = -1,
      final List<PaymentData>? list = const []})
      : _memberships = memberships,
        _myMemberships = myMemberships,
        _list = list;

  final List<MembershipModel> _memberships;
  @override
  @JsonKey()
  List<MembershipModel> get memberships {
    if (_memberships is EqualUnmodifiableListView) return _memberships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberships);
  }

  final List<MyMembershipModel> _myMemberships;
  @override
  @JsonKey()
  List<MyMembershipModel> get myMemberships {
    if (_myMemberships is EqualUnmodifiableListView) return _myMemberships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myMemberships);
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
    return 'MembershipState(memberships: $memberships, myMemberships: $myMemberships, isLoading: $isLoading, isButtonLoading: $isButtonLoading, isPaymentLoading: $isPaymentLoading, selectPayment: $selectPayment, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipStateImpl &&
            const DeepCollectionEquality()
                .equals(other._memberships, _memberships) &&
            const DeepCollectionEquality()
                .equals(other._myMemberships, _myMemberships) &&
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
      const DeepCollectionEquality().hash(_memberships),
      const DeepCollectionEquality().hash(_myMemberships),
      isLoading,
      isButtonLoading,
      isPaymentLoading,
      selectPayment,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipStateImplCopyWith<_$MembershipStateImpl> get copyWith =>
      __$$MembershipStateImplCopyWithImpl<_$MembershipStateImpl>(
          this, _$identity);
}

abstract class _MembershipState implements MembershipState {
  const factory _MembershipState(
      {final List<MembershipModel> memberships,
      final List<MyMembershipModel> myMemberships,
      final bool isLoading,
      final bool isButtonLoading,
      final bool isPaymentLoading,
      final int selectPayment,
      final List<PaymentData>? list}) = _$MembershipStateImpl;

  @override
  List<MembershipModel> get memberships;
  @override
  List<MyMembershipModel> get myMemberships;
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
  _$$MembershipStateImplCopyWith<_$MembershipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
