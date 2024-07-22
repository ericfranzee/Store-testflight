// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(
          WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent>
    implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchTransactionsImplCopyWith<$Res> {
  factory _$$FetchTransactionsImplCopyWith(_$FetchTransactionsImpl value,
          $Res Function(_$FetchTransactionsImpl) then) =
      __$$FetchTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchTransactionsImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$FetchTransactionsImpl>
    implements _$$FetchTransactionsImplCopyWith<$Res> {
  __$$FetchTransactionsImplCopyWithImpl(_$FetchTransactionsImpl _value,
      $Res Function(_$FetchTransactionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchTransactionsImpl(
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

class _$FetchTransactionsImpl implements FetchTransactions {
  const _$FetchTransactionsImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'WalletEvent.fetchTransactions(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTransactionsImpl &&
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
  _$$FetchTransactionsImplCopyWith<_$FetchTransactionsImpl> get copyWith =>
      __$$FetchTransactionsImplCopyWithImpl<_$FetchTransactionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return fetchTransactions(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return fetchTransactions?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) {
    if (fetchTransactions != null) {
      return fetchTransactions(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return fetchTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return fetchTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (fetchTransactions != null) {
      return fetchTransactions(this);
    }
    return orElse();
  }
}

abstract class FetchTransactions implements WalletEvent {
  const factory FetchTransactions(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchTransactionsImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchTransactionsImplCopyWith<_$FetchTransactionsImpl> get copyWith =>
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
    extends _$WalletEventCopyWithImpl<$Res, _$FetchPaymentsImpl>
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
    return 'WalletEvent.fetchPayments(context: $context)';
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
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return fetchPayments(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return fetchPayments?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
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
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return fetchPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return fetchPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (fetchPayments != null) {
      return fetchPayments(this);
    }
    return orElse();
  }
}

abstract class FetchPayments implements WalletEvent {
  const factory FetchPayments({required final BuildContext context}) =
      _$FetchPaymentsImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$FetchPaymentsImplCopyWith<_$FetchPaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPaymentImplCopyWith<$Res> {
  factory _$$SelectPaymentImplCopyWith(
          _$SelectPaymentImpl value, $Res Function(_$SelectPaymentImpl) then) =
      __$$SelectPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectPaymentImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$SelectPaymentImpl>
    implements _$$SelectPaymentImplCopyWith<$Res> {
  __$$SelectPaymentImplCopyWithImpl(
      _$SelectPaymentImpl _value, $Res Function(_$SelectPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectPaymentImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectPaymentImpl implements SelectPayment {
  const _$SelectPaymentImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'WalletEvent.selectPayment(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPaymentImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPaymentImplCopyWith<_$SelectPaymentImpl> get copyWith =>
      __$$SelectPaymentImplCopyWithImpl<_$SelectPaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return selectPayment(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return selectPayment?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) {
    if (selectPayment != null) {
      return selectPayment(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return selectPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return selectPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (selectPayment != null) {
      return selectPayment(this);
    }
    return orElse();
  }
}

abstract class SelectPayment implements WalletEvent {
  const factory SelectPayment({required final int index}) = _$SelectPaymentImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SelectPaymentImplCopyWith<_$SelectPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchUserImplCopyWith<$Res> {
  factory _$$SearchUserImplCopyWith(
          _$SearchUserImpl value, $Res Function(_$SearchUserImpl) then) =
      __$$SearchUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      RefreshController? controller,
      String search});
}

/// @nodoc
class __$$SearchUserImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$SearchUserImpl>
    implements _$$SearchUserImplCopyWith<$Res> {
  __$$SearchUserImplCopyWithImpl(
      _$SearchUserImpl _value, $Res Function(_$SearchUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
    Object? search = null,
  }) {
    return _then(_$SearchUserImpl(
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
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchUserImpl implements SearchUser {
  const _$SearchUserImpl(
      {required this.context,
      this.isRefresh,
      this.controller,
      required this.search});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;
  @override
  final String search;

  @override
  String toString() {
    return 'WalletEvent.searchUser(context: $context, isRefresh: $isRefresh, controller: $controller, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, isRefresh, controller, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      __$$SearchUserImplCopyWithImpl<_$SearchUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return searchUser(context, isRefresh, controller, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return searchUser?.call(context, isRefresh, controller, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(context, isRefresh, controller, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return searchUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return searchUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(this);
    }
    return orElse();
  }
}

abstract class SearchUser implements WalletEvent {
  const factory SearchUser(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller,
      required final String search}) = _$SearchUserImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  String get search;
  @JsonKey(ignore: true)
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FillWalletImplCopyWith<$Res> {
  factory _$$FillWalletImplCopyWith(
          _$FillWalletImpl value, $Res Function(_$FillWalletImpl) then) =
      __$$FillWalletImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      int walletId,
      VoidCallback onSuccess,
      String price});
}

/// @nodoc
class __$$FillWalletImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$FillWalletImpl>
    implements _$$FillWalletImplCopyWith<$Res> {
  __$$FillWalletImplCopyWithImpl(
      _$FillWalletImpl _value, $Res Function(_$FillWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? walletId = null,
    Object? onSuccess = null,
    Object? price = null,
  }) {
    return _then(_$FillWalletImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FillWalletImpl implements FillWallet {
  const _$FillWalletImpl(
      {required this.context,
      required this.walletId,
      required this.onSuccess,
      required this.price});

  @override
  final BuildContext context;
  @override
  final int walletId;
  @override
  final VoidCallback onSuccess;
  @override
  final String price;

  @override
  String toString() {
    return 'WalletEvent.fillWallet(context: $context, walletId: $walletId, onSuccess: $onSuccess, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillWalletImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, walletId, onSuccess, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FillWalletImplCopyWith<_$FillWalletImpl> get copyWith =>
      __$$FillWalletImplCopyWithImpl<_$FillWalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return fillWallet(context, walletId, onSuccess, price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return fillWallet?.call(context, walletId, onSuccess, price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) {
    if (fillWallet != null) {
      return fillWallet(context, walletId, onSuccess, price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return fillWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return fillWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (fillWallet != null) {
      return fillWallet(this);
    }
    return orElse();
  }
}

abstract class FillWallet implements WalletEvent {
  const factory FillWallet(
      {required final BuildContext context,
      required final int walletId,
      required final VoidCallback onSuccess,
      required final String price}) = _$FillWalletImpl;

  BuildContext get context;
  int get walletId;
  VoidCallback get onSuccess;
  String get price;
  @JsonKey(ignore: true)
  _$$FillWalletImplCopyWith<_$FillWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendWalletImplCopyWith<$Res> {
  factory _$$SendWalletImplCopyWith(
          _$SendWalletImpl value, $Res Function(_$SendWalletImpl) then) =
      __$$SendWalletImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      String price,
      VoidCallback onSuccess,
      String uuid});
}

/// @nodoc
class __$$SendWalletImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$SendWalletImpl>
    implements _$$SendWalletImplCopyWith<$Res> {
  __$$SendWalletImplCopyWithImpl(
      _$SendWalletImpl _value, $Res Function(_$SendWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? price = null,
    Object? onSuccess = null,
    Object? uuid = null,
  }) {
    return _then(_$SendWalletImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendWalletImpl implements SendWallet {
  const _$SendWalletImpl(
      {required this.context,
      required this.price,
      required this.onSuccess,
      required this.uuid});

  @override
  final BuildContext context;
  @override
  final String price;
  @override
  final VoidCallback onSuccess;
  @override
  final String uuid;

  @override
  String toString() {
    return 'WalletEvent.sendWallet(context: $context, price: $price, onSuccess: $onSuccess, uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendWalletImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, price, onSuccess, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendWalletImplCopyWith<_$SendWalletImpl> get copyWith =>
      __$$SendWalletImplCopyWithImpl<_$SendWalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchTransactions,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int index) selectPayment,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)
        searchUser,
    required TResult Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)
        fillWallet,
    required TResult Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)
        sendWallet,
  }) {
    return sendWallet(context, price, onSuccess, uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int index)? selectPayment,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult? Function(BuildContext context, int walletId,
            VoidCallback onSuccess, String price)?
        fillWallet,
    TResult? Function(BuildContext context, String price,
            VoidCallback onSuccess, String uuid)?
        sendWallet,
  }) {
    return sendWallet?.call(context, price, onSuccess, uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchTransactions,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int index)? selectPayment,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller, String search)?
        searchUser,
    TResult Function(BuildContext context, int walletId, VoidCallback onSuccess,
            String price)?
        fillWallet,
    TResult Function(BuildContext context, String price, VoidCallback onSuccess,
            String uuid)?
        sendWallet,
    required TResult orElse(),
  }) {
    if (sendWallet != null) {
      return sendWallet(context, price, onSuccess, uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTransactions value) fetchTransactions,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(SelectPayment value) selectPayment,
    required TResult Function(SearchUser value) searchUser,
    required TResult Function(FillWallet value) fillWallet,
    required TResult Function(SendWallet value) sendWallet,
  }) {
    return sendWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTransactions value)? fetchTransactions,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(SelectPayment value)? selectPayment,
    TResult? Function(SearchUser value)? searchUser,
    TResult? Function(FillWallet value)? fillWallet,
    TResult? Function(SendWallet value)? sendWallet,
  }) {
    return sendWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTransactions value)? fetchTransactions,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(SelectPayment value)? selectPayment,
    TResult Function(SearchUser value)? searchUser,
    TResult Function(FillWallet value)? fillWallet,
    TResult Function(SendWallet value)? sendWallet,
    required TResult orElse(),
  }) {
    if (sendWallet != null) {
      return sendWallet(this);
    }
    return orElse();
  }
}

abstract class SendWallet implements WalletEvent {
  const factory SendWallet(
      {required final BuildContext context,
      required final String price,
      required final VoidCallback onSuccess,
      required final String uuid}) = _$SendWalletImpl;

  BuildContext get context;
  String get price;
  VoidCallback get onSuccess;
  String get uuid;
  @JsonKey(ignore: true)
  _$$SendWalletImplCopyWith<_$SendWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletState {
  bool get isTransactionLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  bool get isSearchingLoading => throw _privateConstructorUsedError;
  int get selectPayment => throw _privateConstructorUsedError;
  List<TransactionModel> get transactions => throw _privateConstructorUsedError;
  List<PaymentData>? get list => throw _privateConstructorUsedError;
  List<UserModel>? get listOfUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletStateCopyWith<WalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
  @useResult
  $Res call(
      {bool isTransactionLoading,
      bool isButtonLoading,
      bool isSearchingLoading,
      int selectPayment,
      List<TransactionModel> transactions,
      List<PaymentData>? list,
      List<UserModel>? listOfUser});
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTransactionLoading = null,
    Object? isButtonLoading = null,
    Object? isSearchingLoading = null,
    Object? selectPayment = null,
    Object? transactions = null,
    Object? list = freezed,
    Object? listOfUser = freezed,
  }) {
    return _then(_value.copyWith(
      isTransactionLoading: null == isTransactionLoading
          ? _value.isTransactionLoading
          : isTransactionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingLoading: null == isSearchingLoading
          ? _value.isSearchingLoading
          : isSearchingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
      listOfUser: freezed == listOfUser
          ? _value.listOfUser
          : listOfUser // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletStateImplCopyWith<$Res>
    implements $WalletStateCopyWith<$Res> {
  factory _$$WalletStateImplCopyWith(
          _$WalletStateImpl value, $Res Function(_$WalletStateImpl) then) =
      __$$WalletStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isTransactionLoading,
      bool isButtonLoading,
      bool isSearchingLoading,
      int selectPayment,
      List<TransactionModel> transactions,
      List<PaymentData>? list,
      List<UserModel>? listOfUser});
}

/// @nodoc
class __$$WalletStateImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateImpl>
    implements _$$WalletStateImplCopyWith<$Res> {
  __$$WalletStateImplCopyWithImpl(
      _$WalletStateImpl _value, $Res Function(_$WalletStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTransactionLoading = null,
    Object? isButtonLoading = null,
    Object? isSearchingLoading = null,
    Object? selectPayment = null,
    Object? transactions = null,
    Object? list = freezed,
    Object? listOfUser = freezed,
  }) {
    return _then(_$WalletStateImpl(
      isTransactionLoading: null == isTransactionLoading
          ? _value.isTransactionLoading
          : isTransactionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingLoading: null == isSearchingLoading
          ? _value.isSearchingLoading
          : isSearchingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectPayment: null == selectPayment
          ? _value.selectPayment
          : selectPayment // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
      listOfUser: freezed == listOfUser
          ? _value._listOfUser
          : listOfUser // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
    ));
  }
}

/// @nodoc

class _$WalletStateImpl implements _WalletState {
  const _$WalletStateImpl(
      {this.isTransactionLoading = false,
      this.isButtonLoading = false,
      this.isSearchingLoading = false,
      this.selectPayment = 1,
      final List<TransactionModel> transactions = const [],
      final List<PaymentData>? list = const [],
      final List<UserModel>? listOfUser = const []})
      : _transactions = transactions,
        _list = list,
        _listOfUser = listOfUser;

  @override
  @JsonKey()
  final bool isTransactionLoading;
  @override
  @JsonKey()
  final bool isButtonLoading;
  @override
  @JsonKey()
  final bool isSearchingLoading;
  @override
  @JsonKey()
  final int selectPayment;
  final List<TransactionModel> _transactions;
  @override
  @JsonKey()
  List<TransactionModel> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

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

  final List<UserModel>? _listOfUser;
  @override
  @JsonKey()
  List<UserModel>? get listOfUser {
    final value = _listOfUser;
    if (value == null) return null;
    if (_listOfUser is EqualUnmodifiableListView) return _listOfUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WalletState(isTransactionLoading: $isTransactionLoading, isButtonLoading: $isButtonLoading, isSearchingLoading: $isSearchingLoading, selectPayment: $selectPayment, transactions: $transactions, list: $list, listOfUser: $listOfUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateImpl &&
            (identical(other.isTransactionLoading, isTransactionLoading) ||
                other.isTransactionLoading == isTransactionLoading) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading) &&
            (identical(other.isSearchingLoading, isSearchingLoading) ||
                other.isSearchingLoading == isSearchingLoading) &&
            (identical(other.selectPayment, selectPayment) ||
                other.selectPayment == selectPayment) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._listOfUser, _listOfUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isTransactionLoading,
      isButtonLoading,
      isSearchingLoading,
      selectPayment,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_listOfUser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      __$$WalletStateImplCopyWithImpl<_$WalletStateImpl>(this, _$identity);
}

abstract class _WalletState implements WalletState {
  const factory _WalletState(
      {final bool isTransactionLoading,
      final bool isButtonLoading,
      final bool isSearchingLoading,
      final int selectPayment,
      final List<TransactionModel> transactions,
      final List<PaymentData>? list,
      final List<UserModel>? listOfUser}) = _$WalletStateImpl;

  @override
  bool get isTransactionLoading;
  @override
  bool get isButtonLoading;
  @override
  bool get isSearchingLoading;
  @override
  int get selectPayment;
  @override
  List<TransactionModel> get transactions;
  @override
  List<PaymentData>? get list;
  @override
  List<UserModel>? get listOfUser;
  @override
  @JsonKey(ignore: true)
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
