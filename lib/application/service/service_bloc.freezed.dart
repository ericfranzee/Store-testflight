// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? categoryId,
            int? masterId,
            RefreshController? controller)
        fetchServices,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? masterId,
            int? categoryId,
            RefreshController? controller)
        fetchCategoryServices,
    required TResult Function(int index) selectServiceCategory,
    required TResult Function(ServiceModel service) selectService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult? Function(int index)? selectServiceCategory,
    TResult? Function(ServiceModel service)? selectService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult Function(int index)? selectServiceCategory,
    TResult Function(ServiceModel service)? selectService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(FetchCategoryServices value)
        fetchCategoryServices,
    required TResult Function(SelectServiceCategory value)
        selectServiceCategory,
    required TResult Function(SelectService value) selectService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult? Function(SelectServiceCategory value)? selectServiceCategory,
    TResult? Function(SelectService value)? selectService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult Function(SelectServiceCategory value)? selectServiceCategory,
    TResult Function(SelectService value)? selectService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEventCopyWith<$Res> {
  factory $ServiceEventCopyWith(
          ServiceEvent value, $Res Function(ServiceEvent) then) =
      _$ServiceEventCopyWithImpl<$Res, ServiceEvent>;
}

/// @nodoc
class _$ServiceEventCopyWithImpl<$Res, $Val extends ServiceEvent>
    implements $ServiceEventCopyWith<$Res> {
  _$ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchServicesImplCopyWith<$Res> {
  factory _$$FetchServicesImplCopyWith(
          _$FetchServicesImpl value, $Res Function(_$FetchServicesImpl) then) =
      __$$FetchServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      int? categoryId,
      int? masterId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchServicesImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$FetchServicesImpl>
    implements _$$FetchServicesImplCopyWith<$Res> {
  __$$FetchServicesImplCopyWithImpl(
      _$FetchServicesImpl _value, $Res Function(_$FetchServicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? categoryId = freezed,
    Object? masterId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchServicesImpl(
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchServicesImpl implements FetchServices {
  const _$FetchServicesImpl(
      {required this.context,
      this.isRefresh,
      this.shopId,
      this.categoryId,
      this.masterId,
      this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final int? shopId;
  @override
  final int? categoryId;
  @override
  final int? masterId;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ServiceEvent.fetchServices(context: $context, isRefresh: $isRefresh, shopId: $shopId, categoryId: $categoryId, masterId: $masterId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchServicesImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, shopId,
      categoryId, masterId, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchServicesImplCopyWith<_$FetchServicesImpl> get copyWith =>
      __$$FetchServicesImplCopyWithImpl<_$FetchServicesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? categoryId,
            int? masterId,
            RefreshController? controller)
        fetchServices,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? masterId,
            int? categoryId,
            RefreshController? controller)
        fetchCategoryServices,
    required TResult Function(int index) selectServiceCategory,
    required TResult Function(ServiceModel service) selectService,
  }) {
    return fetchServices(
        context, isRefresh, shopId, categoryId, masterId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult? Function(int index)? selectServiceCategory,
    TResult? Function(ServiceModel service)? selectService,
  }) {
    return fetchServices?.call(
        context, isRefresh, shopId, categoryId, masterId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult Function(int index)? selectServiceCategory,
    TResult Function(ServiceModel service)? selectService,
    required TResult orElse(),
  }) {
    if (fetchServices != null) {
      return fetchServices(
          context, isRefresh, shopId, categoryId, masterId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(FetchCategoryServices value)
        fetchCategoryServices,
    required TResult Function(SelectServiceCategory value)
        selectServiceCategory,
    required TResult Function(SelectService value) selectService,
  }) {
    return fetchServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult? Function(SelectServiceCategory value)? selectServiceCategory,
    TResult? Function(SelectService value)? selectService,
  }) {
    return fetchServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult Function(SelectServiceCategory value)? selectServiceCategory,
    TResult Function(SelectService value)? selectService,
    required TResult orElse(),
  }) {
    if (fetchServices != null) {
      return fetchServices(this);
    }
    return orElse();
  }
}

abstract class FetchServices implements ServiceEvent {
  const factory FetchServices(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final int? categoryId,
      final int? masterId,
      final RefreshController? controller}) = _$FetchServicesImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  int? get categoryId;
  int? get masterId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchServicesImplCopyWith<_$FetchServicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCategoryServicesImplCopyWith<$Res> {
  factory _$$FetchCategoryServicesImplCopyWith(
          _$FetchCategoryServicesImpl value,
          $Res Function(_$FetchCategoryServicesImpl) then) =
      __$$FetchCategoryServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      int? masterId,
      int? categoryId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchCategoryServicesImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$FetchCategoryServicesImpl>
    implements _$$FetchCategoryServicesImplCopyWith<$Res> {
  __$$FetchCategoryServicesImplCopyWithImpl(_$FetchCategoryServicesImpl _value,
      $Res Function(_$FetchCategoryServicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? masterId = freezed,
    Object? categoryId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchCategoryServicesImpl(
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
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchCategoryServicesImpl implements FetchCategoryServices {
  const _$FetchCategoryServicesImpl(
      {required this.context,
      this.isRefresh,
      this.shopId,
      this.masterId,
      this.categoryId,
      this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final int? shopId;
  @override
  final int? masterId;
  @override
  final int? categoryId;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ServiceEvent.fetchCategoryServices(context: $context, isRefresh: $isRefresh, shopId: $shopId, masterId: $masterId, categoryId: $categoryId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryServicesImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, shopId,
      masterId, categoryId, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCategoryServicesImplCopyWith<_$FetchCategoryServicesImpl>
      get copyWith => __$$FetchCategoryServicesImplCopyWithImpl<
          _$FetchCategoryServicesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? categoryId,
            int? masterId,
            RefreshController? controller)
        fetchServices,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? masterId,
            int? categoryId,
            RefreshController? controller)
        fetchCategoryServices,
    required TResult Function(int index) selectServiceCategory,
    required TResult Function(ServiceModel service) selectService,
  }) {
    return fetchCategoryServices(
        context, isRefresh, shopId, masterId, categoryId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult? Function(int index)? selectServiceCategory,
    TResult? Function(ServiceModel service)? selectService,
  }) {
    return fetchCategoryServices?.call(
        context, isRefresh, shopId, masterId, categoryId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult Function(int index)? selectServiceCategory,
    TResult Function(ServiceModel service)? selectService,
    required TResult orElse(),
  }) {
    if (fetchCategoryServices != null) {
      return fetchCategoryServices(
          context, isRefresh, shopId, masterId, categoryId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(FetchCategoryServices value)
        fetchCategoryServices,
    required TResult Function(SelectServiceCategory value)
        selectServiceCategory,
    required TResult Function(SelectService value) selectService,
  }) {
    return fetchCategoryServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult? Function(SelectServiceCategory value)? selectServiceCategory,
    TResult? Function(SelectService value)? selectService,
  }) {
    return fetchCategoryServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult Function(SelectServiceCategory value)? selectServiceCategory,
    TResult Function(SelectService value)? selectService,
    required TResult orElse(),
  }) {
    if (fetchCategoryServices != null) {
      return fetchCategoryServices(this);
    }
    return orElse();
  }
}

abstract class FetchCategoryServices implements ServiceEvent {
  const factory FetchCategoryServices(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final int? masterId,
      final int? categoryId,
      final RefreshController? controller}) = _$FetchCategoryServicesImpl;

  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  int? get masterId;
  int? get categoryId;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchCategoryServicesImplCopyWith<_$FetchCategoryServicesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectServiceCategoryImplCopyWith<$Res> {
  factory _$$SelectServiceCategoryImplCopyWith(
          _$SelectServiceCategoryImpl value,
          $Res Function(_$SelectServiceCategoryImpl) then) =
      __$$SelectServiceCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectServiceCategoryImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$SelectServiceCategoryImpl>
    implements _$$SelectServiceCategoryImplCopyWith<$Res> {
  __$$SelectServiceCategoryImplCopyWithImpl(_$SelectServiceCategoryImpl _value,
      $Res Function(_$SelectServiceCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectServiceCategoryImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectServiceCategoryImpl implements SelectServiceCategory {
  const _$SelectServiceCategoryImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ServiceEvent.selectServiceCategory(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectServiceCategoryImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectServiceCategoryImplCopyWith<_$SelectServiceCategoryImpl>
      get copyWith => __$$SelectServiceCategoryImplCopyWithImpl<
          _$SelectServiceCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? categoryId,
            int? masterId,
            RefreshController? controller)
        fetchServices,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? masterId,
            int? categoryId,
            RefreshController? controller)
        fetchCategoryServices,
    required TResult Function(int index) selectServiceCategory,
    required TResult Function(ServiceModel service) selectService,
  }) {
    return selectServiceCategory(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult? Function(int index)? selectServiceCategory,
    TResult? Function(ServiceModel service)? selectService,
  }) {
    return selectServiceCategory?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult Function(int index)? selectServiceCategory,
    TResult Function(ServiceModel service)? selectService,
    required TResult orElse(),
  }) {
    if (selectServiceCategory != null) {
      return selectServiceCategory(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(FetchCategoryServices value)
        fetchCategoryServices,
    required TResult Function(SelectServiceCategory value)
        selectServiceCategory,
    required TResult Function(SelectService value) selectService,
  }) {
    return selectServiceCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult? Function(SelectServiceCategory value)? selectServiceCategory,
    TResult? Function(SelectService value)? selectService,
  }) {
    return selectServiceCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult Function(SelectServiceCategory value)? selectServiceCategory,
    TResult Function(SelectService value)? selectService,
    required TResult orElse(),
  }) {
    if (selectServiceCategory != null) {
      return selectServiceCategory(this);
    }
    return orElse();
  }
}

abstract class SelectServiceCategory implements ServiceEvent {
  const factory SelectServiceCategory({required final int index}) =
      _$SelectServiceCategoryImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SelectServiceCategoryImplCopyWith<_$SelectServiceCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectServiceImplCopyWith<$Res> {
  factory _$$SelectServiceImplCopyWith(
          _$SelectServiceImpl value, $Res Function(_$SelectServiceImpl) then) =
      __$$SelectServiceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ServiceModel service});
}

/// @nodoc
class __$$SelectServiceImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$SelectServiceImpl>
    implements _$$SelectServiceImplCopyWith<$Res> {
  __$$SelectServiceImplCopyWithImpl(
      _$SelectServiceImpl _value, $Res Function(_$SelectServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$SelectServiceImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
    ));
  }
}

/// @nodoc

class _$SelectServiceImpl implements SelectService {
  const _$SelectServiceImpl({required this.service});

  @override
  final ServiceModel service;

  @override
  String toString() {
    return 'ServiceEvent.selectService(service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectServiceImpl &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectServiceImplCopyWith<_$SelectServiceImpl> get copyWith =>
      __$$SelectServiceImplCopyWithImpl<_$SelectServiceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? categoryId,
            int? masterId,
            RefreshController? controller)
        fetchServices,
    required TResult Function(
            BuildContext context,
            bool? isRefresh,
            int? shopId,
            int? masterId,
            int? categoryId,
            RefreshController? controller)
        fetchCategoryServices,
    required TResult Function(int index) selectServiceCategory,
    required TResult Function(ServiceModel service) selectService,
  }) {
    return selectService(service);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult? Function(int index)? selectServiceCategory,
    TResult? Function(ServiceModel service)? selectService,
  }) {
    return selectService?.call(service);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? categoryId, int? masterId, RefreshController? controller)?
        fetchServices,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            int? masterId, int? categoryId, RefreshController? controller)?
        fetchCategoryServices,
    TResult Function(int index)? selectServiceCategory,
    TResult Function(ServiceModel service)? selectService,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(service);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchServices value) fetchServices,
    required TResult Function(FetchCategoryServices value)
        fetchCategoryServices,
    required TResult Function(SelectServiceCategory value)
        selectServiceCategory,
    required TResult Function(SelectService value) selectService,
  }) {
    return selectService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchServices value)? fetchServices,
    TResult? Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult? Function(SelectServiceCategory value)? selectServiceCategory,
    TResult? Function(SelectService value)? selectService,
  }) {
    return selectService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchServices value)? fetchServices,
    TResult Function(FetchCategoryServices value)? fetchCategoryServices,
    TResult Function(SelectServiceCategory value)? selectServiceCategory,
    TResult Function(SelectService value)? selectService,
    required TResult orElse(),
  }) {
    if (selectService != null) {
      return selectService(this);
    }
    return orElse();
  }
}

abstract class SelectService implements ServiceEvent {
  const factory SelectService({required final ServiceModel service}) =
      _$SelectServiceImpl;

  ServiceModel get service;
  @JsonKey(ignore: true)
  _$$SelectServiceImplCopyWith<_$SelectServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceState {
  List<ServiceModel> get services => throw _privateConstructorUsedError;
  List<CategoryData> get categoryServices => throw _privateConstructorUsedError;
  List<ServiceModel> get selectServices => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get selectIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceStateCopyWith<ServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStateCopyWith<$Res> {
  factory $ServiceStateCopyWith(
          ServiceState value, $Res Function(ServiceState) then) =
      _$ServiceStateCopyWithImpl<$Res, ServiceState>;
  @useResult
  $Res call(
      {List<ServiceModel> services,
      List<CategoryData> categoryServices,
      List<ServiceModel> selectServices,
      bool isLoading,
      int selectIndex});
}

/// @nodoc
class _$ServiceStateCopyWithImpl<$Res, $Val extends ServiceState>
    implements $ServiceStateCopyWith<$Res> {
  _$ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? categoryServices = null,
    Object? selectServices = null,
    Object? isLoading = null,
    Object? selectIndex = null,
  }) {
    return _then(_value.copyWith(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      categoryServices: null == categoryServices
          ? _value.categoryServices
          : categoryServices // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectServices: null == selectServices
          ? _value.selectServices
          : selectServices // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceStateImplCopyWith<$Res>
    implements $ServiceStateCopyWith<$Res> {
  factory _$$ServiceStateImplCopyWith(
          _$ServiceStateImpl value, $Res Function(_$ServiceStateImpl) then) =
      __$$ServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceModel> services,
      List<CategoryData> categoryServices,
      List<ServiceModel> selectServices,
      bool isLoading,
      int selectIndex});
}

/// @nodoc
class __$$ServiceStateImplCopyWithImpl<$Res>
    extends _$ServiceStateCopyWithImpl<$Res, _$ServiceStateImpl>
    implements _$$ServiceStateImplCopyWith<$Res> {
  __$$ServiceStateImplCopyWithImpl(
      _$ServiceStateImpl _value, $Res Function(_$ServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
    Object? categoryServices = null,
    Object? selectServices = null,
    Object? isLoading = null,
    Object? selectIndex = null,
  }) {
    return _then(_$ServiceStateImpl(
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      categoryServices: null == categoryServices
          ? _value._categoryServices
          : categoryServices // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectServices: null == selectServices
          ? _value._selectServices
          : selectServices // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ServiceStateImpl implements _ServiceState {
  const _$ServiceStateImpl(
      {final List<ServiceModel> services = const [],
      final List<CategoryData> categoryServices = const [],
      final List<ServiceModel> selectServices = const [],
      this.isLoading = true,
      this.selectIndex = 0})
      : _services = services,
        _categoryServices = categoryServices,
        _selectServices = selectServices;

  final List<ServiceModel> _services;
  @override
  @JsonKey()
  List<ServiceModel> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<CategoryData> _categoryServices;
  @override
  @JsonKey()
  List<CategoryData> get categoryServices {
    if (_categoryServices is EqualUnmodifiableListView)
      return _categoryServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryServices);
  }

  final List<ServiceModel> _selectServices;
  @override
  @JsonKey()
  List<ServiceModel> get selectServices {
    if (_selectServices is EqualUnmodifiableListView) return _selectServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectServices);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int selectIndex;

  @override
  String toString() {
    return 'ServiceState(services: $services, categoryServices: $categoryServices, selectServices: $selectServices, isLoading: $isLoading, selectIndex: $selectIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStateImpl &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._categoryServices, _categoryServices) &&
            const DeepCollectionEquality()
                .equals(other._selectServices, _selectServices) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectIndex, selectIndex) ||
                other.selectIndex == selectIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_categoryServices),
      const DeepCollectionEquality().hash(_selectServices),
      isLoading,
      selectIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStateImplCopyWith<_$ServiceStateImpl> get copyWith =>
      __$$ServiceStateImplCopyWithImpl<_$ServiceStateImpl>(this, _$identity);
}

abstract class _ServiceState implements ServiceState {
  const factory _ServiceState(
      {final List<ServiceModel> services,
      final List<CategoryData> categoryServices,
      final List<ServiceModel> selectServices,
      final bool isLoading,
      final int selectIndex}) = _$ServiceStateImpl;

  @override
  List<ServiceModel> get services;
  @override
  List<CategoryData> get categoryServices;
  @override
  List<ServiceModel> get selectServices;
  @override
  bool get isLoading;
  @override
  int get selectIndex;
  @override
  @JsonKey(ignore: true)
  _$$ServiceStateImplCopyWith<_$ServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
