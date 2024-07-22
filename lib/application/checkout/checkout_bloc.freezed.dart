// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeleteAddressImplCopyWith<$Res> {
  factory _$$DeleteAddressImplCopyWith(
          _$DeleteAddressImpl value, $Res Function(_$DeleteAddressImpl) then) =
      __$$DeleteAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int addressId, int index});
}

/// @nodoc
class __$$DeleteAddressImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$DeleteAddressImpl>
    implements _$$DeleteAddressImplCopyWith<$Res> {
  __$$DeleteAddressImplCopyWithImpl(
      _$DeleteAddressImpl _value, $Res Function(_$DeleteAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? addressId = null,
    Object? index = null,
  }) {
    return _then(_$DeleteAddressImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteAddressImpl implements DeleteAddress {
  const _$DeleteAddressImpl(
      {required this.context, required this.addressId, required this.index});

  @override
  final BuildContext context;
  @override
  final int addressId;
  @override
  final int index;

  @override
  String toString() {
    return 'CheckoutEvent.deleteAddress(context: $context, addressId: $addressId, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAddressImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, addressId, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      __$$DeleteAddressImplCopyWithImpl<_$DeleteAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return deleteAddress(context, addressId, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return deleteAddress?.call(context, addressId, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(context, addressId, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return deleteAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return deleteAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(this);
    }
    return orElse();
  }
}

abstract class DeleteAddress implements CheckoutEvent {
  const factory DeleteAddress(
      {required final BuildContext context,
      required final int addressId,
      required final int index}) = _$DeleteAddressImpl;

  BuildContext get context;
  int get addressId;
  int get index;
  @JsonKey(ignore: true)
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAddressImplCopyWith<$Res> {
  factory _$$SelectAddressImplCopyWith(
          _$SelectAddressImpl value, $Res Function(_$SelectAddressImpl) then) =
      __$$SelectAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectAddressImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectAddressImpl>
    implements _$$SelectAddressImplCopyWith<$Res> {
  __$$SelectAddressImplCopyWithImpl(
      _$SelectAddressImpl _value, $Res Function(_$SelectAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectAddressImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectAddressImpl implements SelectAddress {
  const _$SelectAddressImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'CheckoutEvent.selectAddress(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAddressImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      __$$SelectAddressImplCopyWithImpl<_$SelectAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return selectAddress(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return selectAddress?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return selectAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return selectAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (selectAddress != null) {
      return selectAddress(this);
    }
    return orElse();
  }
}

abstract class SelectAddress implements CheckoutEvent {
  const factory SelectAddress({required final int index}) = _$SelectAddressImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SelectAddressImplCopyWith<_$SelectAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchUserAddressImplCopyWith<$Res> {
  factory _$$FetchUserAddressImplCopyWith(_$FetchUserAddressImpl value,
          $Res Function(_$FetchUserAddressImpl) then) =
      __$$FetchUserAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchUserAddressImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$FetchUserAddressImpl>
    implements _$$FetchUserAddressImplCopyWith<$Res> {
  __$$FetchUserAddressImplCopyWithImpl(_$FetchUserAddressImpl _value,
      $Res Function(_$FetchUserAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchUserAddressImpl(
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

class _$FetchUserAddressImpl implements FetchUserAddress {
  const _$FetchUserAddressImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'CheckoutEvent.fetchUserAddress(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserAddressImpl &&
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
  _$$FetchUserAddressImplCopyWith<_$FetchUserAddressImpl> get copyWith =>
      __$$FetchUserAddressImplCopyWithImpl<_$FetchUserAddressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return fetchUserAddress(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return fetchUserAddress?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchUserAddress != null) {
      return fetchUserAddress(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return fetchUserAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return fetchUserAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchUserAddress != null) {
      return fetchUserAddress(this);
    }
    return orElse();
  }
}

abstract class FetchUserAddress implements CheckoutEvent {
  const factory FetchUserAddress(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchUserAddressImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchUserAddressImplCopyWith<_$FetchUserAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStepImplCopyWith<$Res> {
  factory _$$ChangeStepImplCopyWith(
          _$ChangeStepImpl value, $Res Function(_$ChangeStepImpl) then) =
      __$$ChangeStepImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int? step});
}

/// @nodoc
class __$$ChangeStepImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ChangeStepImpl>
    implements _$$ChangeStepImplCopyWith<$Res> {
  __$$ChangeStepImplCopyWithImpl(
      _$ChangeStepImpl _value, $Res Function(_$ChangeStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? step = freezed,
  }) {
    return _then(_$ChangeStepImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ChangeStepImpl implements ChangeStep {
  const _$ChangeStepImpl({required this.context, this.step});

  @override
  final BuildContext context;
  @override
  final int? step;

  @override
  String toString() {
    return 'CheckoutEvent.changeStep(context: $context, step: $step)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStepImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStepImplCopyWith<_$ChangeStepImpl> get copyWith =>
      __$$ChangeStepImplCopyWithImpl<_$ChangeStepImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return changeStep(context, step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return changeStep?.call(context, step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (changeStep != null) {
      return changeStep(context, step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return changeStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return changeStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (changeStep != null) {
      return changeStep(this);
    }
    return orElse();
  }
}

abstract class ChangeStep implements CheckoutEvent {
  const factory ChangeStep(
      {required final BuildContext context,
      final int? step}) = _$ChangeStepImpl;

  BuildContext get context;
  int? get step;
  @JsonKey(ignore: true)
  _$$ChangeStepImplCopyWith<_$ChangeStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeActiveImplCopyWith<$Res> {
  factory _$$ChangeActiveImplCopyWith(
          _$ChangeActiveImpl value, $Res Function(_$ChangeActiveImpl) then) =
      __$$ChangeActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool active});
}

/// @nodoc
class __$$ChangeActiveImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ChangeActiveImpl>
    implements _$$ChangeActiveImplCopyWith<$Res> {
  __$$ChangeActiveImplCopyWithImpl(
      _$ChangeActiveImpl _value, $Res Function(_$ChangeActiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
  }) {
    return _then(_$ChangeActiveImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeActiveImpl implements ChangeActive {
  const _$ChangeActiveImpl({required this.active});

  @override
  final bool active;

  @override
  String toString() {
    return 'CheckoutEvent.changeActive(active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeActiveImpl &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(runtimeType, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeActiveImplCopyWith<_$ChangeActiveImpl> get copyWith =>
      __$$ChangeActiveImplCopyWithImpl<_$ChangeActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return changeActive(active);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return changeActive?.call(active);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (changeActive != null) {
      return changeActive(active);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return changeActive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return changeActive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (changeActive != null) {
      return changeActive(this);
    }
    return orElse();
  }
}

abstract class ChangeActive implements CheckoutEvent {
  const factory ChangeActive({required final bool active}) = _$ChangeActiveImpl;

  bool get active;
  @JsonKey(ignore: true)
  _$$ChangeActiveImplCopyWith<_$ChangeActiveImpl> get copyWith =>
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
    extends _$CheckoutEventCopyWithImpl<$Res, _$FetchPaymentsImpl>
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
    return 'CheckoutEvent.fetchPayments(context: $context)';
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
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return fetchPayments(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return fetchPayments?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
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
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return fetchPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return fetchPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchPayments != null) {
      return fetchPayments(this);
    }
    return orElse();
  }
}

abstract class FetchPayments implements CheckoutEvent {
  const factory FetchPayments({required final BuildContext context}) =
      _$FetchPaymentsImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$FetchPaymentsImplCopyWith<_$FetchPaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePaymentImplCopyWith<$Res> {
  factory _$$ChangePaymentImplCopyWith(
          _$ChangePaymentImpl value, $Res Function(_$ChangePaymentImpl) then) =
      __$$ChangePaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ChangePaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ChangePaymentImpl>
    implements _$$ChangePaymentImplCopyWith<$Res> {
  __$$ChangePaymentImplCopyWithImpl(
      _$ChangePaymentImpl _value, $Res Function(_$ChangePaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChangePaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangePaymentImpl implements ChangePayment {
  const _$ChangePaymentImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'CheckoutEvent.changePayment(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePaymentImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePaymentImplCopyWith<_$ChangePaymentImpl> get copyWith =>
      __$$ChangePaymentImplCopyWithImpl<_$ChangePaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return changePayment(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return changePayment?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (changePayment != null) {
      return changePayment(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return changePayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return changePayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (changePayment != null) {
      return changePayment(this);
    }
    return orElse();
  }
}

abstract class ChangePayment implements CheckoutEvent {
  const factory ChangePayment({required final int id}) = _$ChangePaymentImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ChangePaymentImplCopyWith<_$ChangePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeDateImplCopyWith<$Res> {
  factory _$$ChangeDateImplCopyWith(
          _$ChangeDateImpl value, $Res Function(_$ChangeDateImpl) then) =
      __$$ChangeDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$ChangeDateImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ChangeDateImpl>
    implements _$$ChangeDateImplCopyWith<$Res> {
  __$$ChangeDateImplCopyWithImpl(
      _$ChangeDateImpl _value, $Res Function(_$ChangeDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$ChangeDateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeDateImpl implements ChangeDate {
  const _$ChangeDateImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'CheckoutEvent.changeDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeDateImplCopyWith<_$ChangeDateImpl> get copyWith =>
      __$$ChangeDateImplCopyWithImpl<_$ChangeDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return changeDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return changeDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class ChangeDate implements CheckoutEvent {
  const factory ChangeDate({required final DateTime date}) = _$ChangeDateImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$ChangeDateImplCopyWith<_$ChangeDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchDeliveryPointImplCopyWith<$Res> {
  factory _$$FetchDeliveryPointImplCopyWith(_$FetchDeliveryPointImpl value,
          $Res Function(_$FetchDeliveryPointImpl) then) =
      __$$FetchDeliveryPointImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchDeliveryPointImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$FetchDeliveryPointImpl>
    implements _$$FetchDeliveryPointImplCopyWith<$Res> {
  __$$FetchDeliveryPointImplCopyWithImpl(_$FetchDeliveryPointImpl _value,
      $Res Function(_$FetchDeliveryPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchDeliveryPointImpl(
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

class _$FetchDeliveryPointImpl implements FetchDeliveryPoint {
  const _$FetchDeliveryPointImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'CheckoutEvent.fetchDeliveryPoint(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDeliveryPointImpl &&
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
  _$$FetchDeliveryPointImplCopyWith<_$FetchDeliveryPointImpl> get copyWith =>
      __$$FetchDeliveryPointImplCopyWithImpl<_$FetchDeliveryPointImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return fetchDeliveryPoint(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return fetchDeliveryPoint?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchDeliveryPoint != null) {
      return fetchDeliveryPoint(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return fetchDeliveryPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return fetchDeliveryPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchDeliveryPoint != null) {
      return fetchDeliveryPoint(this);
    }
    return orElse();
  }
}

abstract class FetchDeliveryPoint implements CheckoutEvent {
  const factory FetchDeliveryPoint(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchDeliveryPointImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchDeliveryPointImplCopyWith<_$FetchDeliveryPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchDeliveryPriceImplCopyWith<$Res> {
  factory _$$FetchDeliveryPriceImplCopyWith(_$FetchDeliveryPriceImpl value,
          $Res Function(_$FetchDeliveryPriceImpl) then) =
      __$$FetchDeliveryPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$FetchDeliveryPriceImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$FetchDeliveryPriceImpl>
    implements _$$FetchDeliveryPriceImplCopyWith<$Res> {
  __$$FetchDeliveryPriceImplCopyWithImpl(_$FetchDeliveryPriceImpl _value,
      $Res Function(_$FetchDeliveryPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$FetchDeliveryPriceImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$FetchDeliveryPriceImpl implements FetchDeliveryPrice {
  const _$FetchDeliveryPriceImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'CheckoutEvent.fetchDeliveryPrice(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDeliveryPriceImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDeliveryPriceImplCopyWith<_$FetchDeliveryPriceImpl> get copyWith =>
      __$$FetchDeliveryPriceImplCopyWithImpl<_$FetchDeliveryPriceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return fetchDeliveryPrice(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return fetchDeliveryPrice?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchDeliveryPrice != null) {
      return fetchDeliveryPrice(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return fetchDeliveryPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return fetchDeliveryPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (fetchDeliveryPrice != null) {
      return fetchDeliveryPrice(this);
    }
    return orElse();
  }
}

abstract class FetchDeliveryPrice implements CheckoutEvent {
  const factory FetchDeliveryPrice({required final BuildContext context}) =
      _$FetchDeliveryPriceImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$FetchDeliveryPriceImplCopyWith<_$FetchDeliveryPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPointImplCopyWith<$Res> {
  factory _$$SelectPointImplCopyWith(
          _$SelectPointImpl value, $Res Function(_$SelectPointImpl) then) =
      __$$SelectPointImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeliveryPoint? point});
}

/// @nodoc
class __$$SelectPointImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SelectPointImpl>
    implements _$$SelectPointImplCopyWith<$Res> {
  __$$SelectPointImplCopyWithImpl(
      _$SelectPointImpl _value, $Res Function(_$SelectPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = freezed,
  }) {
    return _then(_$SelectPointImpl(
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as DeliveryPoint?,
    ));
  }
}

/// @nodoc

class _$SelectPointImpl implements SelectPoint {
  const _$SelectPointImpl({required this.point});

  @override
  final DeliveryPoint? point;

  @override
  String toString() {
    return 'CheckoutEvent.selectPoint(point: $point)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPointImpl &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPointImplCopyWith<_$SelectPointImpl> get copyWith =>
      __$$SelectPointImplCopyWithImpl<_$SelectPointImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return selectPoint(point);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return selectPoint?.call(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (selectPoint != null) {
      return selectPoint(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return selectPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return selectPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (selectPoint != null) {
      return selectPoint(this);
    }
    return orElse();
  }
}

abstract class SelectPoint implements CheckoutEvent {
  const factory SelectPoint({required final DeliveryPoint? point}) =
      _$SelectPointImpl;

  DeliveryPoint? get point;
  @JsonKey(ignore: true)
  _$$SelectPointImplCopyWith<_$SelectPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMapControllerImplCopyWith<$Res> {
  factory _$$SetMapControllerImplCopyWith(_$SetMapControllerImpl value,
          $Res Function(_$SetMapControllerImpl) then) =
      __$$SetMapControllerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GoogleMapController controller});
}

/// @nodoc
class __$$SetMapControllerImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$SetMapControllerImpl>
    implements _$$SetMapControllerImplCopyWith<$Res> {
  __$$SetMapControllerImplCopyWithImpl(_$SetMapControllerImpl _value,
      $Res Function(_$SetMapControllerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$SetMapControllerImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
    ));
  }
}

/// @nodoc

class _$SetMapControllerImpl implements SetMapController {
  const _$SetMapControllerImpl({required this.controller});

  @override
  final GoogleMapController controller;

  @override
  String toString() {
    return 'CheckoutEvent.setMapController(controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMapControllerImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMapControllerImplCopyWith<_$SetMapControllerImpl> get copyWith =>
      __$$SetMapControllerImplCopyWithImpl<_$SetMapControllerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, int addressId, int index)
        deleteAddress,
    required TResult Function(int index) selectAddress,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchUserAddress,
    required TResult Function(BuildContext context, int? step) changeStep,
    required TResult Function(bool active) changeActive,
    required TResult Function(BuildContext context) fetchPayments,
    required TResult Function(int id) changePayment,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchDeliveryPoint,
    required TResult Function(BuildContext context) fetchDeliveryPrice,
    required TResult Function(DeliveryPoint? point) selectPoint,
    required TResult Function(GoogleMapController controller) setMapController,
  }) {
    return setMapController(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult? Function(int index)? selectAddress,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult? Function(BuildContext context, int? step)? changeStep,
    TResult? Function(bool active)? changeActive,
    TResult? Function(BuildContext context)? fetchPayments,
    TResult? Function(int id)? changePayment,
    TResult? Function(DateTime date)? changeDate,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult? Function(BuildContext context)? fetchDeliveryPrice,
    TResult? Function(DeliveryPoint? point)? selectPoint,
    TResult? Function(GoogleMapController controller)? setMapController,
  }) {
    return setMapController?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, int addressId, int index)?
        deleteAddress,
    TResult Function(int index)? selectAddress,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchUserAddress,
    TResult Function(BuildContext context, int? step)? changeStep,
    TResult Function(bool active)? changeActive,
    TResult Function(BuildContext context)? fetchPayments,
    TResult Function(int id)? changePayment,
    TResult Function(DateTime date)? changeDate,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchDeliveryPoint,
    TResult Function(BuildContext context)? fetchDeliveryPrice,
    TResult Function(DeliveryPoint? point)? selectPoint,
    TResult Function(GoogleMapController controller)? setMapController,
    required TResult orElse(),
  }) {
    if (setMapController != null) {
      return setMapController(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeleteAddress value) deleteAddress,
    required TResult Function(SelectAddress value) selectAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(ChangeStep value) changeStep,
    required TResult Function(ChangeActive value) changeActive,
    required TResult Function(FetchPayments value) fetchPayments,
    required TResult Function(ChangePayment value) changePayment,
    required TResult Function(ChangeDate value) changeDate,
    required TResult Function(FetchDeliveryPoint value) fetchDeliveryPoint,
    required TResult Function(FetchDeliveryPrice value) fetchDeliveryPrice,
    required TResult Function(SelectPoint value) selectPoint,
    required TResult Function(SetMapController value) setMapController,
  }) {
    return setMapController(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeleteAddress value)? deleteAddress,
    TResult? Function(SelectAddress value)? selectAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(ChangeStep value)? changeStep,
    TResult? Function(ChangeActive value)? changeActive,
    TResult? Function(FetchPayments value)? fetchPayments,
    TResult? Function(ChangePayment value)? changePayment,
    TResult? Function(ChangeDate value)? changeDate,
    TResult? Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult? Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult? Function(SelectPoint value)? selectPoint,
    TResult? Function(SetMapController value)? setMapController,
  }) {
    return setMapController?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeleteAddress value)? deleteAddress,
    TResult Function(SelectAddress value)? selectAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(ChangeStep value)? changeStep,
    TResult Function(ChangeActive value)? changeActive,
    TResult Function(FetchPayments value)? fetchPayments,
    TResult Function(ChangePayment value)? changePayment,
    TResult Function(ChangeDate value)? changeDate,
    TResult Function(FetchDeliveryPoint value)? fetchDeliveryPoint,
    TResult Function(FetchDeliveryPrice value)? fetchDeliveryPrice,
    TResult Function(SelectPoint value)? selectPoint,
    TResult Function(SetMapController value)? setMapController,
    required TResult orElse(),
  }) {
    if (setMapController != null) {
      return setMapController(this);
    }
    return orElse();
  }
}

abstract class SetMapController implements CheckoutEvent {
  const factory SetMapController(
      {required final GoogleMapController controller}) = _$SetMapControllerImpl;

  GoogleMapController get controller;
  @JsonKey(ignore: true)
  _$$SetMapControllerImplCopyWith<_$SetMapControllerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  bool get isLoadingPoint => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get selectAddress => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int get selectId => throw _privateConstructorUsedError;
  int get selectPointId => throw _privateConstructorUsedError;
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  List<PaymentData>? get list => throw _privateConstructorUsedError;
  List<DeliveryPoint>? get deliveryPoints => throw _privateConstructorUsedError;
  List<DeliveryPoint>? get deliveryPrice => throw _privateConstructorUsedError;
  List<UserAddress> get address => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  Set<Marker>? get markers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {bool isLoadingPoint,
      bool isLoading,
      bool isActive,
      int selectAddress,
      int step,
      int selectId,
      int selectPointId,
      DateTime? deliveryDate,
      List<PaymentData>? list,
      List<DeliveryPoint>? deliveryPoints,
      List<DeliveryPoint>? deliveryPrice,
      List<UserAddress> address,
      GoogleMapController? mapController,
      Set<Marker>? markers});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingPoint = null,
    Object? isLoading = null,
    Object? isActive = null,
    Object? selectAddress = null,
    Object? step = null,
    Object? selectId = null,
    Object? selectPointId = null,
    Object? deliveryDate = freezed,
    Object? list = freezed,
    Object? deliveryPoints = freezed,
    Object? deliveryPrice = freezed,
    Object? address = null,
    Object? mapController = freezed,
    Object? markers = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingPoint: null == isLoadingPoint
          ? _value.isLoadingPoint
          : isLoadingPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      selectAddress: null == selectAddress
          ? _value.selectAddress
          : selectAddress // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectId: null == selectId
          ? _value.selectId
          : selectId // ignore: cast_nullable_to_non_nullable
              as int,
      selectPointId: null == selectPointId
          ? _value.selectPointId
          : selectPointId // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
      deliveryPoints: freezed == deliveryPoints
          ? _value.deliveryPoints
          : deliveryPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPoint>?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPoint>?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<UserAddress>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      markers: freezed == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
          _$CheckoutStateImpl value, $Res Function(_$CheckoutStateImpl) then) =
      __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingPoint,
      bool isLoading,
      bool isActive,
      int selectAddress,
      int step,
      int selectId,
      int selectPointId,
      DateTime? deliveryDate,
      List<PaymentData>? list,
      List<DeliveryPoint>? deliveryPoints,
      List<DeliveryPoint>? deliveryPrice,
      List<UserAddress> address,
      GoogleMapController? mapController,
      Set<Marker>? markers});
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
      _$CheckoutStateImpl _value, $Res Function(_$CheckoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingPoint = null,
    Object? isLoading = null,
    Object? isActive = null,
    Object? selectAddress = null,
    Object? step = null,
    Object? selectId = null,
    Object? selectPointId = null,
    Object? deliveryDate = freezed,
    Object? list = freezed,
    Object? deliveryPoints = freezed,
    Object? deliveryPrice = freezed,
    Object? address = null,
    Object? mapController = freezed,
    Object? markers = freezed,
  }) {
    return _then(_$CheckoutStateImpl(
      isLoadingPoint: null == isLoadingPoint
          ? _value.isLoadingPoint
          : isLoadingPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      selectAddress: null == selectAddress
          ? _value.selectAddress
          : selectAddress // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      selectId: null == selectId
          ? _value.selectId
          : selectId // ignore: cast_nullable_to_non_nullable
              as int,
      selectPointId: null == selectPointId
          ? _value.selectPointId
          : selectPointId // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>?,
      deliveryPoints: freezed == deliveryPoints
          ? _value._deliveryPoints
          : deliveryPoints // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPoint>?,
      deliveryPrice: freezed == deliveryPrice
          ? _value._deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPoint>?,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<UserAddress>,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      markers: freezed == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
    ));
  }
}

/// @nodoc

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl(
      {this.isLoadingPoint = true,
      this.isLoading = true,
      this.isActive = false,
      this.selectAddress = 0,
      this.step = 1,
      this.selectId = -1,
      this.selectPointId = -1,
      this.deliveryDate = null,
      final List<PaymentData>? list = const [],
      final List<DeliveryPoint>? deliveryPoints = const [],
      final List<DeliveryPoint>? deliveryPrice = const [],
      final List<UserAddress> address = const [],
      this.mapController,
      final Set<Marker>? markers})
      : _list = list,
        _deliveryPoints = deliveryPoints,
        _deliveryPrice = deliveryPrice,
        _address = address,
        _markers = markers;

  @override
  @JsonKey()
  final bool isLoadingPoint;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final int selectAddress;
  @override
  @JsonKey()
  final int step;
  @override
  @JsonKey()
  final int selectId;
  @override
  @JsonKey()
  final int selectPointId;
  @override
  @JsonKey()
  final DateTime? deliveryDate;
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

  final List<DeliveryPoint>? _deliveryPoints;
  @override
  @JsonKey()
  List<DeliveryPoint>? get deliveryPoints {
    final value = _deliveryPoints;
    if (value == null) return null;
    if (_deliveryPoints is EqualUnmodifiableListView) return _deliveryPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DeliveryPoint>? _deliveryPrice;
  @override
  @JsonKey()
  List<DeliveryPoint>? get deliveryPrice {
    final value = _deliveryPrice;
    if (value == null) return null;
    if (_deliveryPrice is EqualUnmodifiableListView) return _deliveryPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserAddress> _address;
  @override
  @JsonKey()
  List<UserAddress> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  final GoogleMapController? mapController;
  final Set<Marker>? _markers;
  @override
  Set<Marker>? get markers {
    final value = _markers;
    if (value == null) return null;
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'CheckoutState(isLoadingPoint: $isLoadingPoint, isLoading: $isLoading, isActive: $isActive, selectAddress: $selectAddress, step: $step, selectId: $selectId, selectPointId: $selectPointId, deliveryDate: $deliveryDate, list: $list, deliveryPoints: $deliveryPoints, deliveryPrice: $deliveryPrice, address: $address, mapController: $mapController, markers: $markers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.isLoadingPoint, isLoadingPoint) ||
                other.isLoadingPoint == isLoadingPoint) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.selectAddress, selectAddress) ||
                other.selectAddress == selectAddress) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.selectId, selectId) ||
                other.selectId == selectId) &&
            (identical(other.selectPointId, selectPointId) ||
                other.selectPointId == selectPointId) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._deliveryPoints, _deliveryPoints) &&
            const DeepCollectionEquality()
                .equals(other._deliveryPrice, _deliveryPrice) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingPoint,
      isLoading,
      isActive,
      selectAddress,
      step,
      selectId,
      selectPointId,
      deliveryDate,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_deliveryPoints),
      const DeepCollectionEquality().hash(_deliveryPrice),
      const DeepCollectionEquality().hash(_address),
      mapController,
      const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState(
      {final bool isLoadingPoint,
      final bool isLoading,
      final bool isActive,
      final int selectAddress,
      final int step,
      final int selectId,
      final int selectPointId,
      final DateTime? deliveryDate,
      final List<PaymentData>? list,
      final List<DeliveryPoint>? deliveryPoints,
      final List<DeliveryPoint>? deliveryPrice,
      final List<UserAddress> address,
      final GoogleMapController? mapController,
      final Set<Marker>? markers}) = _$CheckoutStateImpl;

  @override
  bool get isLoadingPoint;
  @override
  bool get isLoading;
  @override
  bool get isActive;
  @override
  int get selectAddress;
  @override
  int get step;
  @override
  int get selectId;
  @override
  int get selectPointId;
  @override
  DateTime? get deliveryDate;
  @override
  List<PaymentData>? get list;
  @override
  List<DeliveryPoint>? get deliveryPoints;
  @override
  List<DeliveryPoint>? get deliveryPrice;
  @override
  List<UserAddress> get address;
  @override
  GoogleMapController? get mapController;
  @override
  Set<Marker>? get markers;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
