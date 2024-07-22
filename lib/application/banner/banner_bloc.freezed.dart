// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEventCopyWith<$Res> {
  factory $BannerEventCopyWith(
          BannerEvent value, $Res Function(BannerEvent) then) =
      _$BannerEventCopyWithImpl<$Res, BannerEvent>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res, $Val extends BannerEvent>
    implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchBannerImplCopyWith<$Res> {
  factory _$$FetchBannerImplCopyWith(
          _$FetchBannerImpl value, $Res Function(_$FetchBannerImpl) then) =
      __$$FetchBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchBannerImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchBannerImpl>
    implements _$$FetchBannerImplCopyWith<$Res> {
  __$$FetchBannerImplCopyWithImpl(
      _$FetchBannerImpl _value, $Res Function(_$FetchBannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchBannerImpl(
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

class _$FetchBannerImpl implements FetchBanner {
  const _$FetchBannerImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'BannerEvent.fetchBanner(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBannerImpl &&
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
  _$$FetchBannerImplCopyWith<_$FetchBannerImpl> get copyWith =>
      __$$FetchBannerImplCopyWithImpl<_$FetchBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchBanner(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchBanner?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchBanner != null) {
      return fetchBanner(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchBanner != null) {
      return fetchBanner(this);
    }
    return orElse();
  }
}

abstract class FetchBanner implements BannerEvent {
  const factory FetchBanner(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchBannerImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchBannerImplCopyWith<_$FetchBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAdsBannerImplCopyWith<$Res> {
  factory _$$FetchAdsBannerImplCopyWith(_$FetchAdsBannerImpl value,
          $Res Function(_$FetchAdsBannerImpl) then) =
      __$$FetchAdsBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchAdsBannerImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchAdsBannerImpl>
    implements _$$FetchAdsBannerImplCopyWith<$Res> {
  __$$FetchAdsBannerImplCopyWithImpl(
      _$FetchAdsBannerImpl _value, $Res Function(_$FetchAdsBannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchAdsBannerImpl(
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

class _$FetchAdsBannerImpl implements FetchAdsBanner {
  const _$FetchAdsBannerImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'BannerEvent.fetchAdsBanner(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAdsBannerImpl &&
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
  _$$FetchAdsBannerImplCopyWith<_$FetchAdsBannerImpl> get copyWith =>
      __$$FetchAdsBannerImplCopyWithImpl<_$FetchAdsBannerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchAdsBanner(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchAdsBanner?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsBanner != null) {
      return fetchAdsBanner(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchAdsBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchAdsBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsBanner != null) {
      return fetchAdsBanner(this);
    }
    return orElse();
  }
}

abstract class FetchAdsBanner implements BannerEvent {
  const factory FetchAdsBanner(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchAdsBannerImpl;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchAdsBannerImplCopyWith<_$FetchAdsBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchLooksImplCopyWith<$Res> {
  factory _$$FetchLooksImplCopyWith(
          _$FetchLooksImpl value, $Res Function(_$FetchLooksImpl) then) =
      __$$FetchLooksImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchLooksImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchLooksImpl>
    implements _$$FetchLooksImplCopyWith<$Res> {
  __$$FetchLooksImplCopyWithImpl(
      _$FetchLooksImpl _value, $Res Function(_$FetchLooksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchLooksImpl(
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

class _$FetchLooksImpl implements FetchLooks {
  const _$FetchLooksImpl(
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
    return 'BannerEvent.fetchLooks(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchLooksImpl &&
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
  _$$FetchLooksImplCopyWith<_$FetchLooksImpl> get copyWith =>
      __$$FetchLooksImplCopyWithImpl<_$FetchLooksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchLooks(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchLooks?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchLooks != null) {
      return fetchLooks(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchLooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchLooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchLooks != null) {
      return fetchLooks(this);
    }
    return orElse();
  }
}

abstract class FetchLooks implements BannerEvent {
  const factory FetchLooks(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchLooksImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchLooksImplCopyWith<_$FetchLooksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchProductImplCopyWith<$Res> {
  factory _$$FetchProductImplCopyWith(
          _$FetchProductImpl value, $Res Function(_$FetchProductImpl) then) =
      __$$FetchProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int id});
}

/// @nodoc
class __$$FetchProductImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchProductImpl>
    implements _$$FetchProductImplCopyWith<$Res> {
  __$$FetchProductImplCopyWithImpl(
      _$FetchProductImpl _value, $Res Function(_$FetchProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
  }) {
    return _then(_$FetchProductImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchProductImpl implements FetchProduct {
  const _$FetchProductImpl({required this.context, required this.id});

  @override
  final BuildContext context;
  @override
  final int id;

  @override
  String toString() {
    return 'BannerEvent.fetchProduct(context: $context, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProductImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchProductImplCopyWith<_$FetchProductImpl> get copyWith =>
      __$$FetchProductImplCopyWithImpl<_$FetchProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchProduct(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchProduct?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchProduct != null) {
      return fetchProduct(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchProduct != null) {
      return fetchProduct(this);
    }
    return orElse();
  }
}

abstract class FetchProduct implements BannerEvent {
  const factory FetchProduct(
      {required final BuildContext context,
      required final int id}) = _$FetchProductImpl;

  BuildContext get context;
  int get id;
  @JsonKey(ignore: true)
  _$$FetchProductImplCopyWith<_$FetchProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProductImplCopyWith<$Res> {
  factory _$$UpdateProductImplCopyWith(
          _$UpdateProductImpl value, $Res Function(_$UpdateProductImpl) then) =
      __$$UpdateProductImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateProductImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$UpdateProductImpl>
    implements _$$UpdateProductImplCopyWith<$Res> {
  __$$UpdateProductImplCopyWithImpl(
      _$UpdateProductImpl _value, $Res Function(_$UpdateProductImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateProductImpl implements UpdateProduct {
  const _$UpdateProductImpl();

  @override
  String toString() {
    return 'BannerEvent.updateProduct()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateProductImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return updateProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return updateProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return updateProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return updateProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(this);
    }
    return orElse();
  }
}

abstract class UpdateProduct implements BannerEvent {
  const factory UpdateProduct() = _$UpdateProductImpl;
}

/// @nodoc
abstract class _$$FetchAdsProductImplCopyWith<$Res> {
  factory _$$FetchAdsProductImplCopyWith(_$FetchAdsProductImpl value,
          $Res Function(_$FetchAdsProductImpl) then) =
      __$$FetchAdsProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int id});
}

/// @nodoc
class __$$FetchAdsProductImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchAdsProductImpl>
    implements _$$FetchAdsProductImplCopyWith<$Res> {
  __$$FetchAdsProductImplCopyWithImpl(
      _$FetchAdsProductImpl _value, $Res Function(_$FetchAdsProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
  }) {
    return _then(_$FetchAdsProductImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchAdsProductImpl implements FetchAdsProduct {
  const _$FetchAdsProductImpl({required this.context, required this.id});

  @override
  final BuildContext context;
  @override
  final int id;

  @override
  String toString() {
    return 'BannerEvent.fetchAdsProduct(context: $context, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAdsProductImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAdsProductImplCopyWith<_$FetchAdsProductImpl> get copyWith =>
      __$$FetchAdsProductImplCopyWithImpl<_$FetchAdsProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchAdsProduct(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchAdsProduct?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsProduct != null) {
      return fetchAdsProduct(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchAdsProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchAdsProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsProduct != null) {
      return fetchAdsProduct(this);
    }
    return orElse();
  }
}

abstract class FetchAdsProduct implements BannerEvent {
  const factory FetchAdsProduct(
      {required final BuildContext context,
      required final int id}) = _$FetchAdsProductImpl;

  BuildContext get context;
  int get id;
  @JsonKey(ignore: true)
  _$$FetchAdsProductImplCopyWith<_$FetchAdsProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAdsListProductImplCopyWith<$Res> {
  factory _$$FetchAdsListProductImplCopyWith(_$FetchAdsListProductImpl value,
          $Res Function(_$FetchAdsListProductImpl) then) =
      __$$FetchAdsListProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchAdsListProductImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchAdsListProductImpl>
    implements _$$FetchAdsListProductImplCopyWith<$Res> {
  __$$FetchAdsListProductImplCopyWithImpl(_$FetchAdsListProductImpl _value,
      $Res Function(_$FetchAdsListProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchAdsListProductImpl(
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

class _$FetchAdsListProductImpl implements FetchAdsListProduct {
  const _$FetchAdsListProductImpl(
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
    return 'BannerEvent.fetchAdsListProduct(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAdsListProductImpl &&
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
  _$$FetchAdsListProductImplCopyWith<_$FetchAdsListProductImpl> get copyWith =>
      __$$FetchAdsListProductImplCopyWithImpl<_$FetchAdsListProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchAdsBanner,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchLooks,
    required TResult Function(BuildContext context, int id) fetchProduct,
    required TResult Function() updateProduct,
    required TResult Function(BuildContext context, int id) fetchAdsProduct,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchAdsListProduct,
  }) {
    return fetchAdsListProduct(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult? Function(BuildContext context, int id)? fetchProduct,
    TResult? Function()? updateProduct,
    TResult? Function(BuildContext context, int id)? fetchAdsProduct,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
  }) {
    return fetchAdsListProduct?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchBanner,
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchAdsBanner,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchLooks,
    TResult Function(BuildContext context, int id)? fetchProduct,
    TResult Function()? updateProduct,
    TResult Function(BuildContext context, int id)? fetchAdsProduct,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsListProduct != null) {
      return fetchAdsListProduct(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBanner value) fetchBanner,
    required TResult Function(FetchAdsBanner value) fetchAdsBanner,
    required TResult Function(FetchLooks value) fetchLooks,
    required TResult Function(FetchProduct value) fetchProduct,
    required TResult Function(UpdateProduct value) updateProduct,
    required TResult Function(FetchAdsProduct value) fetchAdsProduct,
    required TResult Function(FetchAdsListProduct value) fetchAdsListProduct,
  }) {
    return fetchAdsListProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBanner value)? fetchBanner,
    TResult? Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult? Function(FetchLooks value)? fetchLooks,
    TResult? Function(FetchProduct value)? fetchProduct,
    TResult? Function(UpdateProduct value)? updateProduct,
    TResult? Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult? Function(FetchAdsListProduct value)? fetchAdsListProduct,
  }) {
    return fetchAdsListProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBanner value)? fetchBanner,
    TResult Function(FetchAdsBanner value)? fetchAdsBanner,
    TResult Function(FetchLooks value)? fetchLooks,
    TResult Function(FetchProduct value)? fetchProduct,
    TResult Function(UpdateProduct value)? updateProduct,
    TResult Function(FetchAdsProduct value)? fetchAdsProduct,
    TResult Function(FetchAdsListProduct value)? fetchAdsListProduct,
    required TResult orElse(),
  }) {
    if (fetchAdsListProduct != null) {
      return fetchAdsListProduct(this);
    }
    return orElse();
  }
}

abstract class FetchAdsListProduct implements BannerEvent {
  const factory FetchAdsListProduct(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchAdsListProductImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchAdsListProductImplCopyWith<_$FetchAdsListProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  List<BannerData> get banners => throw _privateConstructorUsedError;
  List<BannerData> get adsBanners => throw _privateConstructorUsedError;
  List<BannerData> get looks => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;
  List<ShopAdsPackage> get shopAds => throw _privateConstructorUsedError;
  List<AdModel> get shopListAds => throw _privateConstructorUsedError;
  bool get isLoadingBanner => throw _privateConstructorUsedError;
  bool get isLoadingProduct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call(
      {List<BannerData> banners,
      List<BannerData> adsBanners,
      List<BannerData> looks,
      List<ProductData> products,
      List<ShopAdsPackage> shopAds,
      List<AdModel> shopListAds,
      bool isLoadingBanner,
      bool isLoadingProduct});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? adsBanners = null,
    Object? looks = null,
    Object? products = null,
    Object? shopAds = null,
    Object? shopListAds = null,
    Object? isLoadingBanner = null,
    Object? isLoadingProduct = null,
  }) {
    return _then(_value.copyWith(
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      adsBanners: null == adsBanners
          ? _value.adsBanners
          : adsBanners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      looks: null == looks
          ? _value.looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      shopAds: null == shopAds
          ? _value.shopAds
          : shopAds // ignore: cast_nullable_to_non_nullable
              as List<ShopAdsPackage>,
      shopListAds: null == shopListAds
          ? _value.shopListAds
          : shopListAds // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      isLoadingBanner: null == isLoadingBanner
          ? _value.isLoadingBanner
          : isLoadingBanner // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingProduct: null == isLoadingProduct
          ? _value.isLoadingProduct
          : isLoadingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerStateImplCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$BannerStateImplCopyWith(
          _$BannerStateImpl value, $Res Function(_$BannerStateImpl) then) =
      __$$BannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BannerData> banners,
      List<BannerData> adsBanners,
      List<BannerData> looks,
      List<ProductData> products,
      List<ShopAdsPackage> shopAds,
      List<AdModel> shopListAds,
      bool isLoadingBanner,
      bool isLoadingProduct});
}

/// @nodoc
class __$$BannerStateImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateImpl>
    implements _$$BannerStateImplCopyWith<$Res> {
  __$$BannerStateImplCopyWithImpl(
      _$BannerStateImpl _value, $Res Function(_$BannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? adsBanners = null,
    Object? looks = null,
    Object? products = null,
    Object? shopAds = null,
    Object? shopListAds = null,
    Object? isLoadingBanner = null,
    Object? isLoadingProduct = null,
  }) {
    return _then(_$BannerStateImpl(
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      adsBanners: null == adsBanners
          ? _value._adsBanners
          : adsBanners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      looks: null == looks
          ? _value._looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      shopAds: null == shopAds
          ? _value._shopAds
          : shopAds // ignore: cast_nullable_to_non_nullable
              as List<ShopAdsPackage>,
      shopListAds: null == shopListAds
          ? _value._shopListAds
          : shopListAds // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
      isLoadingBanner: null == isLoadingBanner
          ? _value.isLoadingBanner
          : isLoadingBanner // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingProduct: null == isLoadingProduct
          ? _value.isLoadingProduct
          : isLoadingProduct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BannerStateImpl implements _BannerState {
  const _$BannerStateImpl(
      {final List<BannerData> banners = const [],
      final List<BannerData> adsBanners = const [],
      final List<BannerData> looks = const [],
      final List<ProductData> products = const [],
      final List<ShopAdsPackage> shopAds = const [],
      final List<AdModel> shopListAds = const [],
      this.isLoadingBanner = true,
      this.isLoadingProduct = true})
      : _banners = banners,
        _adsBanners = adsBanners,
        _looks = looks,
        _products = products,
        _shopAds = shopAds,
        _shopListAds = shopListAds;

  final List<BannerData> _banners;
  @override
  @JsonKey()
  List<BannerData> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<BannerData> _adsBanners;
  @override
  @JsonKey()
  List<BannerData> get adsBanners {
    if (_adsBanners is EqualUnmodifiableListView) return _adsBanners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adsBanners);
  }

  final List<BannerData> _looks;
  @override
  @JsonKey()
  List<BannerData> get looks {
    if (_looks is EqualUnmodifiableListView) return _looks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_looks);
  }

  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ShopAdsPackage> _shopAds;
  @override
  @JsonKey()
  List<ShopAdsPackage> get shopAds {
    if (_shopAds is EqualUnmodifiableListView) return _shopAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopAds);
  }

  final List<AdModel> _shopListAds;
  @override
  @JsonKey()
  List<AdModel> get shopListAds {
    if (_shopListAds is EqualUnmodifiableListView) return _shopListAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopListAds);
  }

  @override
  @JsonKey()
  final bool isLoadingBanner;
  @override
  @JsonKey()
  final bool isLoadingProduct;

  @override
  String toString() {
    return 'BannerState(banners: $banners, adsBanners: $adsBanners, looks: $looks, products: $products, shopAds: $shopAds, shopListAds: $shopListAds, isLoadingBanner: $isLoadingBanner, isLoadingProduct: $isLoadingProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._adsBanners, _adsBanners) &&
            const DeepCollectionEquality().equals(other._looks, _looks) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality().equals(other._shopAds, _shopAds) &&
            const DeepCollectionEquality()
                .equals(other._shopListAds, _shopListAds) &&
            (identical(other.isLoadingBanner, isLoadingBanner) ||
                other.isLoadingBanner == isLoadingBanner) &&
            (identical(other.isLoadingProduct, isLoadingProduct) ||
                other.isLoadingProduct == isLoadingProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_adsBanners),
      const DeepCollectionEquality().hash(_looks),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_shopAds),
      const DeepCollectionEquality().hash(_shopListAds),
      isLoadingBanner,
      isLoadingProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      __$$BannerStateImplCopyWithImpl<_$BannerStateImpl>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {final List<BannerData> banners,
      final List<BannerData> adsBanners,
      final List<BannerData> looks,
      final List<ProductData> products,
      final List<ShopAdsPackage> shopAds,
      final List<AdModel> shopListAds,
      final bool isLoadingBanner,
      final bool isLoadingProduct}) = _$BannerStateImpl;

  @override
  List<BannerData> get banners;
  @override
  List<BannerData> get adsBanners;
  @override
  List<BannerData> get looks;
  @override
  List<ProductData> get products;
  @override
  List<ShopAdsPackage> get shopAds;
  @override
  List<AdModel> get shopListAds;
  @override
  bool get isLoadingBanner;
  @override
  bool get isLoadingProduct;
  @override
  @JsonKey(ignore: true)
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
