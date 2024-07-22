// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'become_seller_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BecomeSellerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? imagePath) updateLogoPath,
    required TResult Function(String? imagePath) updateBgPath,
    required TResult Function(String? type) setDeliveryType,
    required TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)
        createShop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? imagePath)? updateLogoPath,
    TResult? Function(String? imagePath)? updateBgPath,
    TResult? Function(String? type)? setDeliveryType,
    TResult? Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? imagePath)? updateLogoPath,
    TResult Function(String? imagePath)? updateBgPath,
    TResult Function(String? type)? setDeliveryType,
    TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateLogoPath value) updateLogoPath,
    required TResult Function(UpdateBgPath value) updateBgPath,
    required TResult Function(SetDeliveryType value) setDeliveryType,
    required TResult Function(CreateShop value) createShop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateLogoPath value)? updateLogoPath,
    TResult? Function(UpdateBgPath value)? updateBgPath,
    TResult? Function(SetDeliveryType value)? setDeliveryType,
    TResult? Function(CreateShop value)? createShop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateLogoPath value)? updateLogoPath,
    TResult Function(UpdateBgPath value)? updateBgPath,
    TResult Function(SetDeliveryType value)? setDeliveryType,
    TResult Function(CreateShop value)? createShop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BecomeSellerEventCopyWith<$Res> {
  factory $BecomeSellerEventCopyWith(
          BecomeSellerEvent value, $Res Function(BecomeSellerEvent) then) =
      _$BecomeSellerEventCopyWithImpl<$Res, BecomeSellerEvent>;
}

/// @nodoc
class _$BecomeSellerEventCopyWithImpl<$Res, $Val extends BecomeSellerEvent>
    implements $BecomeSellerEventCopyWith<$Res> {
  _$BecomeSellerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateLogoPathImplCopyWith<$Res> {
  factory _$$UpdateLogoPathImplCopyWith(_$UpdateLogoPathImpl value,
          $Res Function(_$UpdateLogoPathImpl) then) =
      __$$UpdateLogoPathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? imagePath});
}

/// @nodoc
class __$$UpdateLogoPathImplCopyWithImpl<$Res>
    extends _$BecomeSellerEventCopyWithImpl<$Res, _$UpdateLogoPathImpl>
    implements _$$UpdateLogoPathImplCopyWith<$Res> {
  __$$UpdateLogoPathImplCopyWithImpl(
      _$UpdateLogoPathImpl _value, $Res Function(_$UpdateLogoPathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(_$UpdateLogoPathImpl(
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateLogoPathImpl implements UpdateLogoPath {
  const _$UpdateLogoPathImpl({required this.imagePath});

  @override
  final String? imagePath;

  @override
  String toString() {
    return 'BecomeSellerEvent.updateLogoPath(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLogoPathImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLogoPathImplCopyWith<_$UpdateLogoPathImpl> get copyWith =>
      __$$UpdateLogoPathImplCopyWithImpl<_$UpdateLogoPathImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? imagePath) updateLogoPath,
    required TResult Function(String? imagePath) updateBgPath,
    required TResult Function(String? type) setDeliveryType,
    required TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)
        createShop,
  }) {
    return updateLogoPath(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? imagePath)? updateLogoPath,
    TResult? Function(String? imagePath)? updateBgPath,
    TResult? Function(String? type)? setDeliveryType,
    TResult? Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
  }) {
    return updateLogoPath?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? imagePath)? updateLogoPath,
    TResult Function(String? imagePath)? updateBgPath,
    TResult Function(String? type)? setDeliveryType,
    TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
    required TResult orElse(),
  }) {
    if (updateLogoPath != null) {
      return updateLogoPath(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateLogoPath value) updateLogoPath,
    required TResult Function(UpdateBgPath value) updateBgPath,
    required TResult Function(SetDeliveryType value) setDeliveryType,
    required TResult Function(CreateShop value) createShop,
  }) {
    return updateLogoPath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateLogoPath value)? updateLogoPath,
    TResult? Function(UpdateBgPath value)? updateBgPath,
    TResult? Function(SetDeliveryType value)? setDeliveryType,
    TResult? Function(CreateShop value)? createShop,
  }) {
    return updateLogoPath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateLogoPath value)? updateLogoPath,
    TResult Function(UpdateBgPath value)? updateBgPath,
    TResult Function(SetDeliveryType value)? setDeliveryType,
    TResult Function(CreateShop value)? createShop,
    required TResult orElse(),
  }) {
    if (updateLogoPath != null) {
      return updateLogoPath(this);
    }
    return orElse();
  }
}

abstract class UpdateLogoPath implements BecomeSellerEvent {
  const factory UpdateLogoPath({required final String? imagePath}) =
      _$UpdateLogoPathImpl;

  String? get imagePath;
  @JsonKey(ignore: true)
  _$$UpdateLogoPathImplCopyWith<_$UpdateLogoPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBgPathImplCopyWith<$Res> {
  factory _$$UpdateBgPathImplCopyWith(
          _$UpdateBgPathImpl value, $Res Function(_$UpdateBgPathImpl) then) =
      __$$UpdateBgPathImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? imagePath});
}

/// @nodoc
class __$$UpdateBgPathImplCopyWithImpl<$Res>
    extends _$BecomeSellerEventCopyWithImpl<$Res, _$UpdateBgPathImpl>
    implements _$$UpdateBgPathImplCopyWith<$Res> {
  __$$UpdateBgPathImplCopyWithImpl(
      _$UpdateBgPathImpl _value, $Res Function(_$UpdateBgPathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(_$UpdateBgPathImpl(
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateBgPathImpl implements UpdateBgPath {
  const _$UpdateBgPathImpl({required this.imagePath});

  @override
  final String? imagePath;

  @override
  String toString() {
    return 'BecomeSellerEvent.updateBgPath(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBgPathImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBgPathImplCopyWith<_$UpdateBgPathImpl> get copyWith =>
      __$$UpdateBgPathImplCopyWithImpl<_$UpdateBgPathImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? imagePath) updateLogoPath,
    required TResult Function(String? imagePath) updateBgPath,
    required TResult Function(String? type) setDeliveryType,
    required TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)
        createShop,
  }) {
    return updateBgPath(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? imagePath)? updateLogoPath,
    TResult? Function(String? imagePath)? updateBgPath,
    TResult? Function(String? type)? setDeliveryType,
    TResult? Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
  }) {
    return updateBgPath?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? imagePath)? updateLogoPath,
    TResult Function(String? imagePath)? updateBgPath,
    TResult Function(String? type)? setDeliveryType,
    TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
    required TResult orElse(),
  }) {
    if (updateBgPath != null) {
      return updateBgPath(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateLogoPath value) updateLogoPath,
    required TResult Function(UpdateBgPath value) updateBgPath,
    required TResult Function(SetDeliveryType value) setDeliveryType,
    required TResult Function(CreateShop value) createShop,
  }) {
    return updateBgPath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateLogoPath value)? updateLogoPath,
    TResult? Function(UpdateBgPath value)? updateBgPath,
    TResult? Function(SetDeliveryType value)? setDeliveryType,
    TResult? Function(CreateShop value)? createShop,
  }) {
    return updateBgPath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateLogoPath value)? updateLogoPath,
    TResult Function(UpdateBgPath value)? updateBgPath,
    TResult Function(SetDeliveryType value)? setDeliveryType,
    TResult Function(CreateShop value)? createShop,
    required TResult orElse(),
  }) {
    if (updateBgPath != null) {
      return updateBgPath(this);
    }
    return orElse();
  }
}

abstract class UpdateBgPath implements BecomeSellerEvent {
  const factory UpdateBgPath({required final String? imagePath}) =
      _$UpdateBgPathImpl;

  String? get imagePath;
  @JsonKey(ignore: true)
  _$$UpdateBgPathImplCopyWith<_$UpdateBgPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDeliveryTypeImplCopyWith<$Res> {
  factory _$$SetDeliveryTypeImplCopyWith(_$SetDeliveryTypeImpl value,
          $Res Function(_$SetDeliveryTypeImpl) then) =
      __$$SetDeliveryTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? type});
}

/// @nodoc
class __$$SetDeliveryTypeImplCopyWithImpl<$Res>
    extends _$BecomeSellerEventCopyWithImpl<$Res, _$SetDeliveryTypeImpl>
    implements _$$SetDeliveryTypeImplCopyWith<$Res> {
  __$$SetDeliveryTypeImplCopyWithImpl(
      _$SetDeliveryTypeImpl _value, $Res Function(_$SetDeliveryTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$SetDeliveryTypeImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SetDeliveryTypeImpl implements SetDeliveryType {
  const _$SetDeliveryTypeImpl({required this.type});

  @override
  final String? type;

  @override
  String toString() {
    return 'BecomeSellerEvent.setDeliveryType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDeliveryTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDeliveryTypeImplCopyWith<_$SetDeliveryTypeImpl> get copyWith =>
      __$$SetDeliveryTypeImplCopyWithImpl<_$SetDeliveryTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? imagePath) updateLogoPath,
    required TResult Function(String? imagePath) updateBgPath,
    required TResult Function(String? type) setDeliveryType,
    required TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)
        createShop,
  }) {
    return setDeliveryType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? imagePath)? updateLogoPath,
    TResult? Function(String? imagePath)? updateBgPath,
    TResult? Function(String? type)? setDeliveryType,
    TResult? Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
  }) {
    return setDeliveryType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? imagePath)? updateLogoPath,
    TResult Function(String? imagePath)? updateBgPath,
    TResult Function(String? type)? setDeliveryType,
    TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
    required TResult orElse(),
  }) {
    if (setDeliveryType != null) {
      return setDeliveryType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateLogoPath value) updateLogoPath,
    required TResult Function(UpdateBgPath value) updateBgPath,
    required TResult Function(SetDeliveryType value) setDeliveryType,
    required TResult Function(CreateShop value) createShop,
  }) {
    return setDeliveryType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateLogoPath value)? updateLogoPath,
    TResult? Function(UpdateBgPath value)? updateBgPath,
    TResult? Function(SetDeliveryType value)? setDeliveryType,
    TResult? Function(CreateShop value)? createShop,
  }) {
    return setDeliveryType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateLogoPath value)? updateLogoPath,
    TResult Function(UpdateBgPath value)? updateBgPath,
    TResult Function(SetDeliveryType value)? setDeliveryType,
    TResult Function(CreateShop value)? createShop,
    required TResult orElse(),
  }) {
    if (setDeliveryType != null) {
      return setDeliveryType(this);
    }
    return orElse();
  }
}

abstract class SetDeliveryType implements BecomeSellerEvent {
  const factory SetDeliveryType({required final String? type}) =
      _$SetDeliveryTypeImpl;

  String? get type;
  @JsonKey(ignore: true)
  _$$SetDeliveryTypeImplCopyWith<_$SetDeliveryTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateShopImplCopyWith<$Res> {
  factory _$$CreateShopImplCopyWith(
          _$CreateShopImpl value, $Res Function(_$CreateShopImpl) then) =
      __$$CreateShopImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      String shopName,
      String description,
      String phone,
      String deliveryTo,
      String deliveryFrom,
      String minAmount,
      String tax,
      LocationModel? location});
}

/// @nodoc
class __$$CreateShopImplCopyWithImpl<$Res>
    extends _$BecomeSellerEventCopyWithImpl<$Res, _$CreateShopImpl>
    implements _$$CreateShopImplCopyWith<$Res> {
  __$$CreateShopImplCopyWithImpl(
      _$CreateShopImpl _value, $Res Function(_$CreateShopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? shopName = null,
    Object? description = null,
    Object? phone = null,
    Object? deliveryTo = null,
    Object? deliveryFrom = null,
    Object? minAmount = null,
    Object? tax = null,
    Object? location = freezed,
  }) {
    return _then(_$CreateShopImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTo: null == deliveryTo
          ? _value.deliveryTo
          : deliveryTo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryFrom: null == deliveryFrom
          ? _value.deliveryFrom
          : deliveryFrom // ignore: cast_nullable_to_non_nullable
              as String,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
    ));
  }
}

/// @nodoc

class _$CreateShopImpl implements CreateShop {
  const _$CreateShopImpl(
      {required this.context,
      required this.shopName,
      required this.description,
      required this.phone,
      required this.deliveryTo,
      required this.deliveryFrom,
      required this.minAmount,
      required this.tax,
      required this.location});

  @override
  final BuildContext context;
  @override
  final String shopName;
  @override
  final String description;
  @override
  final String phone;
  @override
  final String deliveryTo;
  @override
  final String deliveryFrom;
  @override
  final String minAmount;
  @override
  final String tax;
  @override
  final LocationModel? location;

  @override
  String toString() {
    return 'BecomeSellerEvent.createShop(context: $context, shopName: $shopName, description: $description, phone: $phone, deliveryTo: $deliveryTo, deliveryFrom: $deliveryFrom, minAmount: $minAmount, tax: $tax, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShopImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.deliveryTo, deliveryTo) ||
                other.deliveryTo == deliveryTo) &&
            (identical(other.deliveryFrom, deliveryFrom) ||
                other.deliveryFrom == deliveryFrom) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, shopName, description,
      phone, deliveryTo, deliveryFrom, minAmount, tax, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShopImplCopyWith<_$CreateShopImpl> get copyWith =>
      __$$CreateShopImplCopyWithImpl<_$CreateShopImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? imagePath) updateLogoPath,
    required TResult Function(String? imagePath) updateBgPath,
    required TResult Function(String? type) setDeliveryType,
    required TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)
        createShop,
  }) {
    return createShop(context, shopName, description, phone, deliveryTo,
        deliveryFrom, minAmount, tax, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? imagePath)? updateLogoPath,
    TResult? Function(String? imagePath)? updateBgPath,
    TResult? Function(String? type)? setDeliveryType,
    TResult? Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
  }) {
    return createShop?.call(context, shopName, description, phone, deliveryTo,
        deliveryFrom, minAmount, tax, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? imagePath)? updateLogoPath,
    TResult Function(String? imagePath)? updateBgPath,
    TResult Function(String? type)? setDeliveryType,
    TResult Function(
            BuildContext context,
            String shopName,
            String description,
            String phone,
            String deliveryTo,
            String deliveryFrom,
            String minAmount,
            String tax,
            LocationModel? location)?
        createShop,
    required TResult orElse(),
  }) {
    if (createShop != null) {
      return createShop(context, shopName, description, phone, deliveryTo,
          deliveryFrom, minAmount, tax, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateLogoPath value) updateLogoPath,
    required TResult Function(UpdateBgPath value) updateBgPath,
    required TResult Function(SetDeliveryType value) setDeliveryType,
    required TResult Function(CreateShop value) createShop,
  }) {
    return createShop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateLogoPath value)? updateLogoPath,
    TResult? Function(UpdateBgPath value)? updateBgPath,
    TResult? Function(SetDeliveryType value)? setDeliveryType,
    TResult? Function(CreateShop value)? createShop,
  }) {
    return createShop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateLogoPath value)? updateLogoPath,
    TResult Function(UpdateBgPath value)? updateBgPath,
    TResult Function(SetDeliveryType value)? setDeliveryType,
    TResult Function(CreateShop value)? createShop,
    required TResult orElse(),
  }) {
    if (createShop != null) {
      return createShop(this);
    }
    return orElse();
  }
}

abstract class CreateShop implements BecomeSellerEvent {
  const factory CreateShop(
      {required final BuildContext context,
      required final String shopName,
      required final String description,
      required final String phone,
      required final String deliveryTo,
      required final String deliveryFrom,
      required final String minAmount,
      required final String tax,
      required final LocationModel? location}) = _$CreateShopImpl;

  BuildContext get context;
  String get shopName;
  String get description;
  String get phone;
  String get deliveryTo;
  String get deliveryFrom;
  String get minAmount;
  String get tax;
  LocationModel? get location;
  @JsonKey(ignore: true)
  _$$CreateShopImplCopyWith<_$CreateShopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BecomeSellerState {
  String? get logoPath => throw _privateConstructorUsedError;
  String? get bgPath => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BecomeSellerStateCopyWith<BecomeSellerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BecomeSellerStateCopyWith<$Res> {
  factory $BecomeSellerStateCopyWith(
          BecomeSellerState value, $Res Function(BecomeSellerState) then) =
      _$BecomeSellerStateCopyWithImpl<$Res, BecomeSellerState>;
  @useResult
  $Res call(
      {String? logoPath,
      String? bgPath,
      String type,
      bool isLoading,
      bool isSuccess});
}

/// @nodoc
class _$BecomeSellerStateCopyWithImpl<$Res, $Val extends BecomeSellerState>
    implements $BecomeSellerStateCopyWith<$Res> {
  _$BecomeSellerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logoPath = freezed,
    Object? bgPath = freezed,
    Object? type = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(_value.copyWith(
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      bgPath: freezed == bgPath
          ? _value.bgPath
          : bgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BecomeSellerStateImplCopyWith<$Res>
    implements $BecomeSellerStateCopyWith<$Res> {
  factory _$$BecomeSellerStateImplCopyWith(_$BecomeSellerStateImpl value,
          $Res Function(_$BecomeSellerStateImpl) then) =
      __$$BecomeSellerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? logoPath,
      String? bgPath,
      String type,
      bool isLoading,
      bool isSuccess});
}

/// @nodoc
class __$$BecomeSellerStateImplCopyWithImpl<$Res>
    extends _$BecomeSellerStateCopyWithImpl<$Res, _$BecomeSellerStateImpl>
    implements _$$BecomeSellerStateImplCopyWith<$Res> {
  __$$BecomeSellerStateImplCopyWithImpl(_$BecomeSellerStateImpl _value,
      $Res Function(_$BecomeSellerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logoPath = freezed,
    Object? bgPath = freezed,
    Object? type = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(_$BecomeSellerStateImpl(
      logoPath: freezed == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      bgPath: freezed == bgPath
          ? _value.bgPath
          : bgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BecomeSellerStateImpl implements _BecomeSellerState {
  const _$BecomeSellerStateImpl(
      {this.logoPath = null,
      this.bgPath = null,
      this.type = TrKeys.month,
      this.isLoading = false,
      this.isSuccess = false});

  @override
  @JsonKey()
  final String? logoPath;
  @override
  @JsonKey()
  final String? bgPath;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString() {
    return 'BecomeSellerState(logoPath: $logoPath, bgPath: $bgPath, type: $type, isLoading: $isLoading, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BecomeSellerStateImpl &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.bgPath, bgPath) || other.bgPath == bgPath) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, logoPath, bgPath, type, isLoading, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BecomeSellerStateImplCopyWith<_$BecomeSellerStateImpl> get copyWith =>
      __$$BecomeSellerStateImplCopyWithImpl<_$BecomeSellerStateImpl>(
          this, _$identity);
}

abstract class _BecomeSellerState implements BecomeSellerState {
  const factory _BecomeSellerState(
      {final String? logoPath,
      final String? bgPath,
      final String type,
      final bool isLoading,
      final bool isSuccess}) = _$BecomeSellerStateImpl;

  @override
  String? get logoPath;
  @override
  String? get bgPath;
  @override
  String get type;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$BecomeSellerStateImplCopyWith<_$BecomeSellerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
