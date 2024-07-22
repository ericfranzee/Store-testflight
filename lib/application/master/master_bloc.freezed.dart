// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MasterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterEventCopyWith<$Res> {
  factory $MasterEventCopyWith(
          MasterEvent value, $Res Function(MasterEvent) then) =
      _$MasterEventCopyWithImpl<$Res, MasterEvent>;
}

/// @nodoc
class _$MasterEventCopyWithImpl<$Res, $Val extends MasterEvent>
    implements $MasterEventCopyWith<$Res> {
  _$MasterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchMastersImplCopyWith<$Res> {
  factory _$$FetchMastersImplCopyWith(
          _$FetchMastersImpl value, $Res Function(_$FetchMastersImpl) then) =
      __$$FetchMastersImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      int? serviceId,
      List<int>? serviceIds,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchMastersImplCopyWithImpl<$Res>
    extends _$MasterEventCopyWithImpl<$Res, _$FetchMastersImpl>
    implements _$$FetchMastersImplCopyWith<$Res> {
  __$$FetchMastersImplCopyWithImpl(
      _$FetchMastersImpl _value, $Res Function(_$FetchMastersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? serviceId = freezed,
    Object? serviceIds = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchMastersImpl(
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
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceIds: freezed == serviceIds
          ? _value._serviceIds
          : serviceIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchMastersImpl implements FetchMasters {
  const _$FetchMastersImpl(
      {required this.context,
      this.isRefresh,
      this.shopId,
      this.serviceId,
      final List<int>? serviceIds,
      this.controller})
      : _serviceIds = serviceIds;

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final int? shopId;
  @override
  final int? serviceId;
  final List<int>? _serviceIds;
  @override
  List<int>? get serviceIds {
    final value = _serviceIds;
    if (value == null) return null;
    if (_serviceIds is EqualUnmodifiableListView) return _serviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'MasterEvent.fetchMasters(context: $context, isRefresh: $isRefresh, shopId: $shopId, serviceId: $serviceId, serviceIds: $serviceIds, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMastersImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            const DeepCollectionEquality()
                .equals(other._serviceIds, _serviceIds) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, shopId,
      serviceId, const DeepCollectionEquality().hash(_serviceIds), controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMastersImplCopyWith<_$FetchMastersImpl> get copyWith =>
      __$$FetchMastersImplCopyWithImpl<_$FetchMastersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) {
    return fetchMasters(
        context, isRefresh, shopId, serviceId, serviceIds, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) {
    return fetchMasters?.call(
        context, isRefresh, shopId, serviceId, serviceIds, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasters != null) {
      return fetchMasters(
          context, isRefresh, shopId, serviceId, serviceIds, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) {
    return fetchMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) {
    return fetchMasters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasters != null) {
      return fetchMasters(this);
    }
    return orElse();
  }
}

abstract class FetchMasters implements MasterEvent {
  const factory FetchMasters(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final int? serviceId,
      final List<int>? serviceIds,
      final RefreshController? controller}) = _$FetchMastersImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  int? get serviceId;
  List<int>? get serviceIds;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchMastersImplCopyWith<_$FetchMastersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchLikeMastersImplCopyWith<$Res> {
  factory _$$FetchLikeMastersImplCopyWith(_$FetchLikeMastersImpl value,
          $Res Function(_$FetchLikeMastersImpl) then) =
      __$$FetchLikeMastersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$FetchLikeMastersImplCopyWithImpl<$Res>
    extends _$MasterEventCopyWithImpl<$Res, _$FetchLikeMastersImpl>
    implements _$$FetchLikeMastersImplCopyWith<$Res> {
  __$$FetchLikeMastersImplCopyWithImpl(_$FetchLikeMastersImpl _value,
      $Res Function(_$FetchLikeMastersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$FetchLikeMastersImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$FetchLikeMastersImpl implements FetchLikeMasters {
  const _$FetchLikeMastersImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'MasterEvent.fetchLikeMasters(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchLikeMastersImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchLikeMastersImplCopyWith<_$FetchLikeMastersImpl> get copyWith =>
      __$$FetchLikeMastersImplCopyWithImpl<_$FetchLikeMastersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) {
    return fetchLikeMasters(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) {
    return fetchLikeMasters?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) {
    if (fetchLikeMasters != null) {
      return fetchLikeMasters(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) {
    return fetchLikeMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) {
    return fetchLikeMasters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (fetchLikeMasters != null) {
      return fetchLikeMasters(this);
    }
    return orElse();
  }
}

abstract class FetchLikeMasters implements MasterEvent {
  const factory FetchLikeMasters({required final BuildContext context}) =
      _$FetchLikeMastersImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$FetchLikeMastersImplCopyWith<_$FetchLikeMastersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchMasterByIdImplCopyWith<$Res> {
  factory _$$FetchMasterByIdImplCopyWith(_$FetchMasterByIdImpl value,
          $Res Function(_$FetchMasterByIdImpl) then) =
      __$$FetchMasterByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, MasterModel master});
}

/// @nodoc
class __$$FetchMasterByIdImplCopyWithImpl<$Res>
    extends _$MasterEventCopyWithImpl<$Res, _$FetchMasterByIdImpl>
    implements _$$FetchMasterByIdImplCopyWith<$Res> {
  __$$FetchMasterByIdImplCopyWithImpl(
      _$FetchMasterByIdImpl _value, $Res Function(_$FetchMasterByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? master = null,
  }) {
    return _then(_$FetchMasterByIdImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      master: null == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as MasterModel,
    ));
  }
}

/// @nodoc

class _$FetchMasterByIdImpl implements FetchMasterById {
  const _$FetchMasterByIdImpl({required this.context, required this.master});

  @override
  final BuildContext context;
  @override
  final MasterModel master;

  @override
  String toString() {
    return 'MasterEvent.fetchMasterById(context: $context, master: $master)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMasterByIdImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.master, master) || other.master == master));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, master);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMasterByIdImplCopyWith<_$FetchMasterByIdImpl> get copyWith =>
      __$$FetchMasterByIdImplCopyWithImpl<_$FetchMasterByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) {
    return fetchMasterById(context, master);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) {
    return fetchMasterById?.call(context, master);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasterById != null) {
      return fetchMasterById(context, master);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) {
    return fetchMasterById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) {
    return fetchMasterById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasterById != null) {
      return fetchMasterById(this);
    }
    return orElse();
  }
}

abstract class FetchMasterById implements MasterEvent {
  const factory FetchMasterById(
      {required final BuildContext context,
      required final MasterModel master}) = _$FetchMasterByIdImpl;

  BuildContext get context;
  MasterModel get master;
  @JsonKey(ignore: true)
  _$$FetchMasterByIdImplCopyWith<_$FetchMasterByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchMasterImageImplCopyWith<$Res> {
  factory _$$FetchMasterImageImplCopyWith(_$FetchMasterImageImpl value,
          $Res Function(_$FetchMasterImageImpl) then) =
      __$$FetchMasterImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int id});
}

/// @nodoc
class __$$FetchMasterImageImplCopyWithImpl<$Res>
    extends _$MasterEventCopyWithImpl<$Res, _$FetchMasterImageImpl>
    implements _$$FetchMasterImageImplCopyWith<$Res> {
  __$$FetchMasterImageImplCopyWithImpl(_$FetchMasterImageImpl _value,
      $Res Function(_$FetchMasterImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
  }) {
    return _then(_$FetchMasterImageImpl(
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

class _$FetchMasterImageImpl implements FetchMasterImage {
  const _$FetchMasterImageImpl({required this.context, required this.id});

  @override
  final BuildContext context;
  @override
  final int id;

  @override
  String toString() {
    return 'MasterEvent.fetchMasterImage(context: $context, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMasterImageImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMasterImageImplCopyWith<_$FetchMasterImageImpl> get copyWith =>
      __$$FetchMasterImageImplCopyWithImpl<_$FetchMasterImageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) {
    return fetchMasterImage(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) {
    return fetchMasterImage?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasterImage != null) {
      return fetchMasterImage(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) {
    return fetchMasterImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) {
    return fetchMasterImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (fetchMasterImage != null) {
      return fetchMasterImage(this);
    }
    return orElse();
  }
}

abstract class FetchMasterImage implements MasterEvent {
  const factory FetchMasterImage(
      {required final BuildContext context,
      required final int id}) = _$FetchMasterImageImpl;

  BuildContext get context;
  int get id;
  @JsonKey(ignore: true)
  _$$FetchMasterImageImplCopyWith<_$FetchMasterImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStateImplCopyWith<$Res> {
  factory _$$UpdateStateImplCopyWith(
          _$UpdateStateImpl value, $Res Function(_$UpdateStateImpl) then) =
      __$$UpdateStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateStateImplCopyWithImpl<$Res>
    extends _$MasterEventCopyWithImpl<$Res, _$UpdateStateImpl>
    implements _$$UpdateStateImplCopyWith<$Res> {
  __$$UpdateStateImplCopyWithImpl(
      _$UpdateStateImpl _value, $Res Function(_$UpdateStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateStateImpl implements UpdateState {
  const _$UpdateStateImpl();

  @override
  String toString() {
    return 'MasterEvent.updateState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)
        fetchMasters,
    required TResult Function(BuildContext context) fetchLikeMasters,
    required TResult Function(BuildContext context, MasterModel master)
        fetchMasterById,
    required TResult Function(BuildContext context, int id) fetchMasterImage,
    required TResult Function() updateState,
  }) {
    return updateState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult? Function(BuildContext context)? fetchLikeMasters,
    TResult? Function(BuildContext context, MasterModel master)?
        fetchMasterById,
    TResult? Function(BuildContext context, int id)? fetchMasterImage,
    TResult? Function()? updateState,
  }) {
    return updateState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? serviceId,
            List<int>? serviceIds,
            RefreshController? controller)?
        fetchMasters,
    TResult Function(BuildContext context)? fetchLikeMasters,
    TResult Function(BuildContext context, MasterModel master)? fetchMasterById,
    TResult Function(BuildContext context, int id)? fetchMasterImage,
    TResult Function()? updateState,
    required TResult orElse(),
  }) {
    if (updateState != null) {
      return updateState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMasters value) fetchMasters,
    required TResult Function(FetchLikeMasters value) fetchLikeMasters,
    required TResult Function(FetchMasterById value) fetchMasterById,
    required TResult Function(FetchMasterImage value) fetchMasterImage,
    required TResult Function(UpdateState value) updateState,
  }) {
    return updateState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMasters value)? fetchMasters,
    TResult? Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult? Function(FetchMasterById value)? fetchMasterById,
    TResult? Function(FetchMasterImage value)? fetchMasterImage,
    TResult? Function(UpdateState value)? updateState,
  }) {
    return updateState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMasters value)? fetchMasters,
    TResult Function(FetchLikeMasters value)? fetchLikeMasters,
    TResult Function(FetchMasterById value)? fetchMasterById,
    TResult Function(FetchMasterImage value)? fetchMasterImage,
    TResult Function(UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (updateState != null) {
      return updateState(this);
    }
    return orElse();
  }
}

abstract class UpdateState implements MasterEvent {
  const factory UpdateState() = _$UpdateStateImpl;
}

/// @nodoc
mixin _$MasterState {
  List<MasterModel> get masters => throw _privateConstructorUsedError;
  MasterModel? get master => throw _privateConstructorUsedError;
  List<MasterModel> get likeMasters => throw _privateConstructorUsedError;
  List<Galleries> get masterImages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterStateCopyWith<MasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterStateCopyWith<$Res> {
  factory $MasterStateCopyWith(
          MasterState value, $Res Function(MasterState) then) =
      _$MasterStateCopyWithImpl<$Res, MasterState>;
  @useResult
  $Res call(
      {List<MasterModel> masters,
      MasterModel? master,
      List<MasterModel> likeMasters,
      List<Galleries> masterImages,
      bool isLoading});
}

/// @nodoc
class _$MasterStateCopyWithImpl<$Res, $Val extends MasterState>
    implements $MasterStateCopyWith<$Res> {
  _$MasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masters = null,
    Object? master = freezed,
    Object? likeMasters = null,
    Object? masterImages = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      masters: null == masters
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<MasterModel>,
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as MasterModel?,
      likeMasters: null == likeMasters
          ? _value.likeMasters
          : likeMasters // ignore: cast_nullable_to_non_nullable
              as List<MasterModel>,
      masterImages: null == masterImages
          ? _value.masterImages
          : masterImages // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterStateImplCopyWith<$Res>
    implements $MasterStateCopyWith<$Res> {
  factory _$$MasterStateImplCopyWith(
          _$MasterStateImpl value, $Res Function(_$MasterStateImpl) then) =
      __$$MasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MasterModel> masters,
      MasterModel? master,
      List<MasterModel> likeMasters,
      List<Galleries> masterImages,
      bool isLoading});
}

/// @nodoc
class __$$MasterStateImplCopyWithImpl<$Res>
    extends _$MasterStateCopyWithImpl<$Res, _$MasterStateImpl>
    implements _$$MasterStateImplCopyWith<$Res> {
  __$$MasterStateImplCopyWithImpl(
      _$MasterStateImpl _value, $Res Function(_$MasterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masters = null,
    Object? master = freezed,
    Object? likeMasters = null,
    Object? masterImages = null,
    Object? isLoading = null,
  }) {
    return _then(_$MasterStateImpl(
      masters: null == masters
          ? _value._masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<MasterModel>,
      master: freezed == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as MasterModel?,
      likeMasters: null == likeMasters
          ? _value._likeMasters
          : likeMasters // ignore: cast_nullable_to_non_nullable
              as List<MasterModel>,
      masterImages: null == masterImages
          ? _value._masterImages
          : masterImages // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MasterStateImpl implements _MasterState {
  const _$MasterStateImpl(
      {final List<MasterModel> masters = const [],
      this.master = null,
      final List<MasterModel> likeMasters = const [],
      final List<Galleries> masterImages = const [],
      this.isLoading = true})
      : _masters = masters,
        _likeMasters = likeMasters,
        _masterImages = masterImages;

  final List<MasterModel> _masters;
  @override
  @JsonKey()
  List<MasterModel> get masters {
    if (_masters is EqualUnmodifiableListView) return _masters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_masters);
  }

  @override
  @JsonKey()
  final MasterModel? master;
  final List<MasterModel> _likeMasters;
  @override
  @JsonKey()
  List<MasterModel> get likeMasters {
    if (_likeMasters is EqualUnmodifiableListView) return _likeMasters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeMasters);
  }

  final List<Galleries> _masterImages;
  @override
  @JsonKey()
  List<Galleries> get masterImages {
    if (_masterImages is EqualUnmodifiableListView) return _masterImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_masterImages);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MasterState(masters: $masters, master: $master, likeMasters: $likeMasters, masterImages: $masterImages, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterStateImpl &&
            const DeepCollectionEquality().equals(other._masters, _masters) &&
            (identical(other.master, master) || other.master == master) &&
            const DeepCollectionEquality()
                .equals(other._likeMasters, _likeMasters) &&
            const DeepCollectionEquality()
                .equals(other._masterImages, _masterImages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_masters),
      master,
      const DeepCollectionEquality().hash(_likeMasters),
      const DeepCollectionEquality().hash(_masterImages),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterStateImplCopyWith<_$MasterStateImpl> get copyWith =>
      __$$MasterStateImplCopyWithImpl<_$MasterStateImpl>(this, _$identity);
}

abstract class _MasterState implements MasterState {
  const factory _MasterState(
      {final List<MasterModel> masters,
      final MasterModel? master,
      final List<MasterModel> likeMasters,
      final List<Galleries> masterImages,
      final bool isLoading}) = _$MasterStateImpl;

  @override
  List<MasterModel> get masters;
  @override
  MasterModel? get master;
  @override
  List<MasterModel> get likeMasters;
  @override
  List<Galleries> get masterImages;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$MasterStateImplCopyWith<_$MasterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
