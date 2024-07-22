// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategory,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategoryOfService,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategory,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategoryTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategory value) fetchCategory,
    required TResult Function(FetchCategoryOfService value)
        fetchCategoryOfService,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectCategoryTwo value) selectCategoryTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategory value)? fetchCategory,
    TResult? Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectCategoryTwo value)? selectCategoryTwo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategory value)? fetchCategory,
    TResult Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectCategoryTwo value)? selectCategoryTwo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEventCopyWith<CategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

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
abstract class _$$FetchCategoryImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$FetchCategoryImplCopyWith(
          _$FetchCategoryImpl value, $Res Function(_$FetchCategoryImpl) then) =
      __$$FetchCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$FetchCategoryImpl>
    implements _$$FetchCategoryImplCopyWith<$Res> {
  __$$FetchCategoryImplCopyWithImpl(
      _$FetchCategoryImpl _value, $Res Function(_$FetchCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchCategoryImpl(
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

class _$FetchCategoryImpl implements FetchCategory {
  const _$FetchCategoryImpl(
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
    return 'CategoryEvent.fetchCategory(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryImpl &&
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
  _$$FetchCategoryImplCopyWith<_$FetchCategoryImpl> get copyWith =>
      __$$FetchCategoryImplCopyWithImpl<_$FetchCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategory,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategoryOfService,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategory,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategoryTwo,
  }) {
    return fetchCategory(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
  }) {
    return fetchCategory?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategory value) fetchCategory,
    required TResult Function(FetchCategoryOfService value)
        fetchCategoryOfService,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectCategoryTwo value) selectCategoryTwo,
  }) {
    return fetchCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategory value)? fetchCategory,
    TResult? Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectCategoryTwo value)? selectCategoryTwo,
  }) {
    return fetchCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategory value)? fetchCategory,
    TResult Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectCategoryTwo value)? selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (fetchCategory != null) {
      return fetchCategory(this);
    }
    return orElse();
  }
}

abstract class FetchCategory implements CategoryEvent {
  const factory FetchCategory(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchCategoryImpl;

  @override
  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchCategoryImplCopyWith<_$FetchCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCategoryOfServiceImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$FetchCategoryOfServiceImplCopyWith(
          _$FetchCategoryOfServiceImpl value,
          $Res Function(_$FetchCategoryOfServiceImpl) then) =
      __$$FetchCategoryOfServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context,
      bool? isRefresh,
      int? shopId,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchCategoryOfServiceImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$FetchCategoryOfServiceImpl>
    implements _$$FetchCategoryOfServiceImplCopyWith<$Res> {
  __$$FetchCategoryOfServiceImplCopyWithImpl(
      _$FetchCategoryOfServiceImpl _value,
      $Res Function(_$FetchCategoryOfServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? shopId = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchCategoryOfServiceImpl(
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

class _$FetchCategoryOfServiceImpl implements FetchCategoryOfService {
  const _$FetchCategoryOfServiceImpl(
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
    return 'CategoryEvent.fetchCategoryOfService(context: $context, isRefresh: $isRefresh, shopId: $shopId, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoryOfServiceImpl &&
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
  _$$FetchCategoryOfServiceImplCopyWith<_$FetchCategoryOfServiceImpl>
      get copyWith => __$$FetchCategoryOfServiceImplCopyWithImpl<
          _$FetchCategoryOfServiceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategory,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategoryOfService,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategory,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategoryTwo,
  }) {
    return fetchCategoryOfService(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
  }) {
    return fetchCategoryOfService?.call(context, isRefresh, shopId, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (fetchCategoryOfService != null) {
      return fetchCategoryOfService(context, isRefresh, shopId, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategory value) fetchCategory,
    required TResult Function(FetchCategoryOfService value)
        fetchCategoryOfService,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectCategoryTwo value) selectCategoryTwo,
  }) {
    return fetchCategoryOfService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategory value)? fetchCategory,
    TResult? Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectCategoryTwo value)? selectCategoryTwo,
  }) {
    return fetchCategoryOfService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategory value)? fetchCategory,
    TResult Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectCategoryTwo value)? selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (fetchCategoryOfService != null) {
      return fetchCategoryOfService(this);
    }
    return orElse();
  }
}

abstract class FetchCategoryOfService implements CategoryEvent {
  const factory FetchCategoryOfService(
      {required final BuildContext context,
      final bool? isRefresh,
      final int? shopId,
      final RefreshController? controller}) = _$FetchCategoryOfServiceImpl;

  @override
  BuildContext get context;
  bool? get isRefresh;
  int? get shopId;
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchCategoryOfServiceImplCopyWith<_$FetchCategoryOfServiceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCategoryImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$SelectCategoryImplCopyWith(_$SelectCategoryImpl value,
          $Res Function(_$SelectCategoryImpl) then) =
      __$$SelectCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, CategoryData? category});
}

/// @nodoc
class __$$SelectCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$SelectCategoryImpl>
    implements _$$SelectCategoryImplCopyWith<$Res> {
  __$$SelectCategoryImplCopyWithImpl(
      _$SelectCategoryImpl _value, $Res Function(_$SelectCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? category = freezed,
  }) {
    return _then(_$SelectCategoryImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$SelectCategoryImpl implements SelectCategory {
  const _$SelectCategoryImpl({required this.context, this.category});

  @override
  final BuildContext context;
  @override
  final CategoryData? category;

  @override
  String toString() {
    return 'CategoryEvent.selectCategory(context: $context, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      __$$SelectCategoryImplCopyWithImpl<_$SelectCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategory,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategoryOfService,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategory,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategoryTwo,
  }) {
    return selectCategory(context, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
  }) {
    return selectCategory?.call(context, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(context, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategory value) fetchCategory,
    required TResult Function(FetchCategoryOfService value)
        fetchCategoryOfService,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectCategoryTwo value) selectCategoryTwo,
  }) {
    return selectCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategory value)? fetchCategory,
    TResult? Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectCategoryTwo value)? selectCategoryTwo,
  }) {
    return selectCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategory value)? fetchCategory,
    TResult Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectCategoryTwo value)? selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(this);
    }
    return orElse();
  }
}

abstract class SelectCategory implements CategoryEvent {
  const factory SelectCategory(
      {required final BuildContext context,
      final CategoryData? category}) = _$SelectCategoryImpl;

  @override
  BuildContext get context;
  CategoryData? get category;
  @override
  @JsonKey(ignore: true)
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCategoryTwoImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$SelectCategoryTwoImplCopyWith(_$SelectCategoryTwoImpl value,
          $Res Function(_$SelectCategoryTwoImpl) then) =
      __$$SelectCategoryTwoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, CategoryData? category});
}

/// @nodoc
class __$$SelectCategoryTwoImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$SelectCategoryTwoImpl>
    implements _$$SelectCategoryTwoImplCopyWith<$Res> {
  __$$SelectCategoryTwoImplCopyWithImpl(_$SelectCategoryTwoImpl _value,
      $Res Function(_$SelectCategoryTwoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? category = freezed,
  }) {
    return _then(_$SelectCategoryTwoImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$SelectCategoryTwoImpl implements SelectCategoryTwo {
  const _$SelectCategoryTwoImpl({required this.context, this.category});

  @override
  final BuildContext context;
  @override
  final CategoryData? category;

  @override
  String toString() {
    return 'CategoryEvent.selectCategoryTwo(context: $context, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryTwoImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryTwoImplCopyWith<_$SelectCategoryTwoImpl> get copyWith =>
      __$$SelectCategoryTwoImplCopyWithImpl<_$SelectCategoryTwoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategory,
    required TResult Function(BuildContext context, bool? isRefresh,
            int? shopId, RefreshController? controller)
        fetchCategoryOfService,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategory,
    required TResult Function(BuildContext context, CategoryData? category)
        selectCategoryTwo,
  }) {
    return selectCategoryTwo(context, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult? Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult? Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
  }) {
    return selectCategoryTwo?.call(context, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategory,
    TResult Function(BuildContext context, bool? isRefresh, int? shopId,
            RefreshController? controller)?
        fetchCategoryOfService,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategory,
    TResult Function(BuildContext context, CategoryData? category)?
        selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (selectCategoryTwo != null) {
      return selectCategoryTwo(context, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategory value) fetchCategory,
    required TResult Function(FetchCategoryOfService value)
        fetchCategoryOfService,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(SelectCategoryTwo value) selectCategoryTwo,
  }) {
    return selectCategoryTwo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategory value)? fetchCategory,
    TResult? Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(SelectCategoryTwo value)? selectCategoryTwo,
  }) {
    return selectCategoryTwo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategory value)? fetchCategory,
    TResult Function(FetchCategoryOfService value)? fetchCategoryOfService,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(SelectCategoryTwo value)? selectCategoryTwo,
    required TResult orElse(),
  }) {
    if (selectCategoryTwo != null) {
      return selectCategoryTwo(this);
    }
    return orElse();
  }
}

abstract class SelectCategoryTwo implements CategoryEvent {
  const factory SelectCategoryTwo(
      {required final BuildContext context,
      final CategoryData? category}) = _$SelectCategoryTwoImpl;

  @override
  BuildContext get context;
  CategoryData? get category;
  @override
  @JsonKey(ignore: true)
  _$$SelectCategoryTwoImplCopyWith<_$SelectCategoryTwoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<CategoryData> get categoriesOfService =>
      throw _privateConstructorUsedError;
  bool get isLoadingCategory => throw _privateConstructorUsedError;
  CategoryData? get selectCategory => throw _privateConstructorUsedError;
  CategoryData? get selectCategoryTwo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {List<CategoryData> categories,
      List<CategoryData> categoriesOfService,
      bool isLoadingCategory,
      CategoryData? selectCategory,
      CategoryData? selectCategoryTwo});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categoriesOfService = null,
    Object? isLoadingCategory = null,
    Object? selectCategory = freezed,
    Object? selectCategoryTwo = freezed,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categoriesOfService: null == categoriesOfService
          ? _value.categoriesOfService
          : categoriesOfService // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      isLoadingCategory: null == isLoadingCategory
          ? _value.isLoadingCategory
          : isLoadingCategory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategoryTwo: freezed == selectCategoryTwo
          ? _value.selectCategoryTwo
          : selectCategoryTwo // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryStateImplCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$CategoryStateImplCopyWith(
          _$CategoryStateImpl value, $Res Function(_$CategoryStateImpl) then) =
      __$$CategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryData> categories,
      List<CategoryData> categoriesOfService,
      bool isLoadingCategory,
      CategoryData? selectCategory,
      CategoryData? selectCategoryTwo});
}

/// @nodoc
class __$$CategoryStateImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateImpl>
    implements _$$CategoryStateImplCopyWith<$Res> {
  __$$CategoryStateImplCopyWithImpl(
      _$CategoryStateImpl _value, $Res Function(_$CategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? categoriesOfService = null,
    Object? isLoadingCategory = null,
    Object? selectCategory = freezed,
    Object? selectCategoryTwo = freezed,
  }) {
    return _then(_$CategoryStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categoriesOfService: null == categoriesOfService
          ? _value._categoriesOfService
          : categoriesOfService // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      isLoadingCategory: null == isLoadingCategory
          ? _value.isLoadingCategory
          : isLoadingCategory // ignore: cast_nullable_to_non_nullable
              as bool,
      selectCategory: freezed == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
      selectCategoryTwo: freezed == selectCategoryTwo
          ? _value.selectCategoryTwo
          : selectCategoryTwo // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$CategoryStateImpl implements _CategoryState {
  const _$CategoryStateImpl(
      {final List<CategoryData> categories = const [],
      final List<CategoryData> categoriesOfService = const [],
      this.isLoadingCategory = true,
      this.selectCategory = null,
      this.selectCategoryTwo = null})
      : _categories = categories,
        _categoriesOfService = categoriesOfService;

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryData> _categoriesOfService;
  @override
  @JsonKey()
  List<CategoryData> get categoriesOfService {
    if (_categoriesOfService is EqualUnmodifiableListView)
      return _categoriesOfService;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesOfService);
  }

  @override
  @JsonKey()
  final bool isLoadingCategory;
  @override
  @JsonKey()
  final CategoryData? selectCategory;
  @override
  @JsonKey()
  final CategoryData? selectCategoryTwo;

  @override
  String toString() {
    return 'CategoryState(categories: $categories, categoriesOfService: $categoriesOfService, isLoadingCategory: $isLoadingCategory, selectCategory: $selectCategory, selectCategoryTwo: $selectCategoryTwo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._categoriesOfService, _categoriesOfService) &&
            (identical(other.isLoadingCategory, isLoadingCategory) ||
                other.isLoadingCategory == isLoadingCategory) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            (identical(other.selectCategoryTwo, selectCategoryTwo) ||
                other.selectCategoryTwo == selectCategoryTwo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_categoriesOfService),
      isLoadingCategory,
      selectCategory,
      selectCategoryTwo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      __$$CategoryStateImplCopyWithImpl<_$CategoryStateImpl>(this, _$identity);
}

abstract class _CategoryState implements CategoryState {
  const factory _CategoryState(
      {final List<CategoryData> categories,
      final List<CategoryData> categoriesOfService,
      final bool isLoadingCategory,
      final CategoryData? selectCategory,
      final CategoryData? selectCategoryTwo}) = _$CategoryStateImpl;

  @override
  List<CategoryData> get categories;
  @override
  List<CategoryData> get categoriesOfService;
  @override
  bool get isLoadingCategory;
  @override
  CategoryData? get selectCategory;
  @override
  CategoryData? get selectCategoryTwo;
  @override
  @JsonKey(ignore: true)
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
