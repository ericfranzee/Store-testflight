// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailEventCopyWith(
          ProductDetailEvent value, $Res Function(ProductDetailEvent) then) =
      _$ProductDetailEventCopyWithImpl<$Res, ProductDetailEvent>;
}

/// @nodoc
class _$ProductDetailEventCopyWithImpl<$Res, $Val extends ProductDetailEvent>
    implements $ProductDetailEventCopyWith<$Res> {
  _$ProductDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchProductByIdImplCopyWith<$Res> {
  factory _$$FetchProductByIdImplCopyWith(_$FetchProductByIdImpl value,
          $Res Function(_$FetchProductByIdImpl) then) =
      __$$FetchProductByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      RefreshController? controller,
      ProductData? product});
}

/// @nodoc
class __$$FetchProductByIdImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchProductByIdImpl>
    implements _$$FetchProductByIdImplCopyWith<$Res> {
  __$$FetchProductByIdImplCopyWithImpl(_$FetchProductByIdImpl _value,
      $Res Function(_$FetchProductByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? controller = freezed,
    Object? product = freezed,
  }) {
    return _then(_$FetchProductByIdImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData?,
    ));
  }
}

/// @nodoc

class _$FetchProductByIdImpl implements FetchProductById {
  const _$FetchProductByIdImpl(
      {required this.context, this.controller, this.product});

  @override
  final BuildContext context;
  @override
  final RefreshController? controller;
  @override
  final ProductData? product;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchProductById(context: $context, controller: $controller, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProductByIdImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, controller, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchProductByIdImplCopyWith<_$FetchProductByIdImpl> get copyWith =>
      __$$FetchProductByIdImplCopyWithImpl<_$FetchProductByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return fetchProductById(context, controller, product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return fetchProductById?.call(context, controller, product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (fetchProductById != null) {
      return fetchProductById(context, controller, product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return fetchProductById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return fetchProductById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (fetchProductById != null) {
      return fetchProductById(this);
    }
    return orElse();
  }
}

abstract class FetchProductById implements ProductDetailEvent {
  const factory FetchProductById(
      {required final BuildContext context,
      final RefreshController? controller,
      final ProductData? product}) = _$FetchProductByIdImpl;

  BuildContext get context;
  RefreshController? get controller;
  ProductData? get product;
  @JsonKey(ignore: true)
  _$$FetchProductByIdImplCopyWith<_$FetchProductByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchRelatedProductImplCopyWith<$Res> {
  factory _$$FetchRelatedProductImplCopyWith(_$FetchRelatedProductImpl value,
          $Res Function(_$FetchRelatedProductImpl) then) =
      __$$FetchRelatedProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      String? productUuid,
      bool? isRefresh,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchRelatedProductImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchRelatedProductImpl>
    implements _$$FetchRelatedProductImplCopyWith<$Res> {
  __$$FetchRelatedProductImplCopyWithImpl(_$FetchRelatedProductImpl _value,
      $Res Function(_$FetchRelatedProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? productUuid = freezed,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchRelatedProductImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$FetchRelatedProductImpl implements FetchRelatedProduct {
  const _$FetchRelatedProductImpl(
      {required this.context,
      required this.productUuid,
      this.isRefresh,
      this.controller});

  @override
  final BuildContext context;
  @override
  final String? productUuid;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchRelatedProduct(context: $context, productUuid: $productUuid, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchRelatedProductImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, productUuid, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchRelatedProductImplCopyWith<_$FetchRelatedProductImpl> get copyWith =>
      __$$FetchRelatedProductImplCopyWithImpl<_$FetchRelatedProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return fetchRelatedProduct(context, productUuid, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return fetchRelatedProduct?.call(
        context, productUuid, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (fetchRelatedProduct != null) {
      return fetchRelatedProduct(context, productUuid, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return fetchRelatedProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return fetchRelatedProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (fetchRelatedProduct != null) {
      return fetchRelatedProduct(this);
    }
    return orElse();
  }
}

abstract class FetchRelatedProduct implements ProductDetailEvent {
  const factory FetchRelatedProduct(
      {required final BuildContext context,
      required final String? productUuid,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchRelatedProductImpl;

  BuildContext get context;
  String? get productUuid;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchRelatedProductImplCopyWith<_$FetchRelatedProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchViewedProductsImplCopyWith<$Res> {
  factory _$$FetchViewedProductsImplCopyWith(_$FetchViewedProductsImpl value,
          $Res Function(_$FetchViewedProductsImpl) then) =
      __$$FetchViewedProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      int? productId,
      bool? isRefresh,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchViewedProductsImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchViewedProductsImpl>
    implements _$$FetchViewedProductsImplCopyWith<$Res> {
  __$$FetchViewedProductsImplCopyWithImpl(_$FetchViewedProductsImpl _value,
      $Res Function(_$FetchViewedProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? productId = freezed,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchViewedProductsImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$FetchViewedProductsImpl implements FetchViewedProducts {
  const _$FetchViewedProductsImpl(
      {required this.context,
      required this.productId,
      this.isRefresh,
      this.controller});

  @override
  final BuildContext context;
  @override
  final int? productId;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchViewedProducts(context: $context, productId: $productId, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchViewedProductsImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, productId, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchViewedProductsImplCopyWith<_$FetchViewedProductsImpl> get copyWith =>
      __$$FetchViewedProductsImplCopyWithImpl<_$FetchViewedProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return fetchViewedProducts(context, productId, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return fetchViewedProducts?.call(context, productId, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (fetchViewedProducts != null) {
      return fetchViewedProducts(context, productId, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return fetchViewedProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return fetchViewedProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (fetchViewedProducts != null) {
      return fetchViewedProducts(this);
    }
    return orElse();
  }
}

abstract class FetchViewedProducts implements ProductDetailEvent {
  const factory FetchViewedProducts(
      {required final BuildContext context,
      required final int? productId,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchViewedProductsImpl;

  BuildContext get context;
  int? get productId;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchViewedProductsImplCopyWith<_$FetchViewedProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchBuyWithProductImplCopyWith<$Res> {
  factory _$$FetchBuyWithProductImplCopyWith(_$FetchBuyWithProductImpl value,
          $Res Function(_$FetchBuyWithProductImpl) then) =
      __$$FetchBuyWithProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      int? productId,
      bool? isRefresh,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchBuyWithProductImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchBuyWithProductImpl>
    implements _$$FetchBuyWithProductImplCopyWith<$Res> {
  __$$FetchBuyWithProductImplCopyWithImpl(_$FetchBuyWithProductImpl _value,
      $Res Function(_$FetchBuyWithProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? productId = freezed,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchBuyWithProductImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$FetchBuyWithProductImpl implements FetchBuyWithProduct {
  const _$FetchBuyWithProductImpl(
      {required this.context,
      required this.productId,
      this.isRefresh,
      this.controller});

  @override
  final BuildContext context;
  @override
  final int? productId;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchBuyWithProduct(context: $context, productId: $productId, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBuyWithProductImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, productId, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchBuyWithProductImplCopyWith<_$FetchBuyWithProductImpl> get copyWith =>
      __$$FetchBuyWithProductImplCopyWithImpl<_$FetchBuyWithProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return fetchBuyWithProduct(context, productId, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return fetchBuyWithProduct?.call(context, productId, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (fetchBuyWithProduct != null) {
      return fetchBuyWithProduct(context, productId, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return fetchBuyWithProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return fetchBuyWithProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (fetchBuyWithProduct != null) {
      return fetchBuyWithProduct(this);
    }
    return orElse();
  }
}

abstract class FetchBuyWithProduct implements ProductDetailEvent {
  const factory FetchBuyWithProduct(
      {required final BuildContext context,
      required final int? productId,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchBuyWithProductImpl;

  BuildContext get context;
  int? get productId;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchBuyWithProductImplCopyWith<_$FetchBuyWithProductImpl> get copyWith =>
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
    extends _$ProductDetailEventCopyWithImpl<$Res, _$UpdateStateImpl>
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
    return 'ProductDetailEvent.updateState()';
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
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return updateState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return updateState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
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
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return updateState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return updateState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (updateState != null) {
      return updateState(this);
    }
    return orElse();
  }
}

abstract class UpdateState implements ProductDetailEvent {
  const factory UpdateState() = _$UpdateStateImpl;
}

/// @nodoc
abstract class _$$SetSelectedIndexesImplCopyWith<$Res> {
  factory _$$SetSelectedIndexesImplCopyWith(_$SetSelectedIndexesImpl value,
          $Res Function(_$SetSelectedIndexesImpl) then) =
      __$$SetSelectedIndexesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> indexes, BuildContext context});
}

/// @nodoc
class __$$SetSelectedIndexesImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$SetSelectedIndexesImpl>
    implements _$$SetSelectedIndexesImplCopyWith<$Res> {
  __$$SetSelectedIndexesImplCopyWithImpl(_$SetSelectedIndexesImpl _value,
      $Res Function(_$SetSelectedIndexesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexes = null,
    Object? context = null,
  }) {
    return _then(_$SetSelectedIndexesImpl(
      indexes: null == indexes
          ? _value._indexes
          : indexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SetSelectedIndexesImpl implements SetSelectedIndexes {
  const _$SetSelectedIndexesImpl(
      {required final List<int> indexes, required this.context})
      : _indexes = indexes;

  final List<int> _indexes;
  @override
  List<int> get indexes {
    if (_indexes is EqualUnmodifiableListView) return _indexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_indexes);
  }

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'ProductDetailEvent.setSelectedIndexes(indexes: $indexes, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetSelectedIndexesImpl &&
            const DeepCollectionEquality().equals(other._indexes, _indexes) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_indexes), context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetSelectedIndexesImplCopyWith<_$SetSelectedIndexesImpl> get copyWith =>
      __$$SetSelectedIndexesImplCopyWithImpl<_$SetSelectedIndexesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return setSelectedIndexes(indexes, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return setSelectedIndexes?.call(indexes, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (setSelectedIndexes != null) {
      return setSelectedIndexes(indexes, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return setSelectedIndexes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return setSelectedIndexes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (setSelectedIndexes != null) {
      return setSelectedIndexes(this);
    }
    return orElse();
  }
}

abstract class SetSelectedIndexes implements ProductDetailEvent {
  const factory SetSelectedIndexes(
      {required final List<int> indexes,
      required final BuildContext context}) = _$SetSelectedIndexesImpl;

  List<int> get indexes;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$SetSelectedIndexesImplCopyWith<_$SetSelectedIndexesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateExtrasImplCopyWith<$Res> {
  factory _$$UpdateExtrasImplCopyWith(
          _$UpdateExtrasImpl value, $Res Function(_$UpdateExtrasImpl) then) =
      __$$UpdateExtrasImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateExtrasImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$UpdateExtrasImpl>
    implements _$$UpdateExtrasImplCopyWith<$Res> {
  __$$UpdateExtrasImplCopyWithImpl(
      _$UpdateExtrasImpl _value, $Res Function(_$UpdateExtrasImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateExtrasImpl implements UpdateExtras {
  const _$UpdateExtrasImpl();

  @override
  String toString() {
    return 'ProductDetailEvent.updateExtras()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateExtrasImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return updateExtras();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return updateExtras?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (updateExtras != null) {
      return updateExtras();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return updateExtras(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return updateExtras?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (updateExtras != null) {
      return updateExtras(this);
    }
    return orElse();
  }
}

abstract class UpdateExtras implements ProductDetailEvent {
  const factory UpdateExtras() = _$UpdateExtrasImpl;
}

/// @nodoc
abstract class _$$UpdateSelectedIndexesImplCopyWith<$Res> {
  factory _$$UpdateSelectedIndexesImplCopyWith(
          _$UpdateSelectedIndexesImpl value,
          $Res Function(_$UpdateSelectedIndexesImpl) then) =
      __$$UpdateSelectedIndexesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int value, BuildContext context});
}

/// @nodoc
class __$$UpdateSelectedIndexesImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$UpdateSelectedIndexesImpl>
    implements _$$UpdateSelectedIndexesImplCopyWith<$Res> {
  __$$UpdateSelectedIndexesImplCopyWithImpl(_$UpdateSelectedIndexesImpl _value,
      $Res Function(_$UpdateSelectedIndexesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? value = null,
    Object? context = null,
  }) {
    return _then(_$UpdateSelectedIndexesImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$UpdateSelectedIndexesImpl implements UpdateSelectedIndexes {
  const _$UpdateSelectedIndexesImpl(this.index, this.value, this.context);

  @override
  final int index;
  @override
  final int value;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'ProductDetailEvent.updateSelectedIndexes(index: $index, value: $value, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectedIndexesImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, value, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectedIndexesImplCopyWith<_$UpdateSelectedIndexesImpl>
      get copyWith => __$$UpdateSelectedIndexesImplCopyWithImpl<
          _$UpdateSelectedIndexesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return updateSelectedIndexes(index, value, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return updateSelectedIndexes?.call(index, value, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (updateSelectedIndexes != null) {
      return updateSelectedIndexes(index, value, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return updateSelectedIndexes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return updateSelectedIndexes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (updateSelectedIndexes != null) {
      return updateSelectedIndexes(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectedIndexes implements ProductDetailEvent {
  const factory UpdateSelectedIndexes(
          final int index, final int value, final BuildContext context) =
      _$UpdateSelectedIndexesImpl;

  int get index;
  int get value;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$UpdateSelectedIndexesImplCopyWith<_$UpdateSelectedIndexesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectImageImplCopyWith<$Res> {
  factory _$$SelectImageImplCopyWith(
          _$SelectImageImpl value, $Res Function(_$SelectImageImpl) then) =
      __$$SelectImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Galleries image, bool? jumpTo, bool? nextImageTo});
}

/// @nodoc
class __$$SelectImageImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$SelectImageImpl>
    implements _$$SelectImageImplCopyWith<$Res> {
  __$$SelectImageImplCopyWithImpl(
      _$SelectImageImpl _value, $Res Function(_$SelectImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? jumpTo = freezed,
    Object? nextImageTo = freezed,
  }) {
    return _then(_$SelectImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Galleries,
      jumpTo: freezed == jumpTo
          ? _value.jumpTo
          : jumpTo // ignore: cast_nullable_to_non_nullable
              as bool?,
      nextImageTo: freezed == nextImageTo
          ? _value.nextImageTo
          : nextImageTo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SelectImageImpl implements SelectImage {
  const _$SelectImageImpl({required this.image, this.jumpTo, this.nextImageTo});

  @override
  final Galleries image;
  @override
  final bool? jumpTo;
  @override
  final bool? nextImageTo;

  @override
  String toString() {
    return 'ProductDetailEvent.selectImage(image: $image, jumpTo: $jumpTo, nextImageTo: $nextImageTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectImageImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.jumpTo, jumpTo) || other.jumpTo == jumpTo) &&
            (identical(other.nextImageTo, nextImageTo) ||
                other.nextImageTo == nextImageTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, jumpTo, nextImageTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectImageImplCopyWith<_$SelectImageImpl> get copyWith =>
      __$$SelectImageImplCopyWithImpl<_$SelectImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context,
            RefreshController? controller, ProductData? product)
        fetchProductById,
    required TResult Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)
        fetchRelatedProduct,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchViewedProducts,
    required TResult Function(BuildContext context, int? productId,
            bool? isRefresh, RefreshController? controller)
        fetchBuyWithProduct,
    required TResult Function() updateState,
    required TResult Function(List<int> indexes, BuildContext context)
        setSelectedIndexes,
    required TResult Function() updateExtras,
    required TResult Function(int index, int value, BuildContext context)
        updateSelectedIndexes,
    required TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)
        selectImage,
  }) {
    return selectImage(image, jumpTo, nextImageTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult? Function(BuildContext context, String? productUuid,
            bool? isRefresh, RefreshController? controller)?
        fetchRelatedProduct,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult? Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult? Function()? updateState,
    TResult? Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult? Function()? updateExtras,
    TResult? Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult? Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
  }) {
    return selectImage?.call(image, jumpTo, nextImageTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, RefreshController? controller,
            ProductData? product)?
        fetchProductById,
    TResult Function(BuildContext context, String? productUuid, bool? isRefresh,
            RefreshController? controller)?
        fetchRelatedProduct,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchViewedProducts,
    TResult Function(BuildContext context, int? productId, bool? isRefresh,
            RefreshController? controller)?
        fetchBuyWithProduct,
    TResult Function()? updateState,
    TResult Function(List<int> indexes, BuildContext context)?
        setSelectedIndexes,
    TResult Function()? updateExtras,
    TResult Function(int index, int value, BuildContext context)?
        updateSelectedIndexes,
    TResult Function(Galleries image, bool? jumpTo, bool? nextImageTo)?
        selectImage,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage(image, jumpTo, nextImageTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchProductById value) fetchProductById,
    required TResult Function(FetchRelatedProduct value) fetchRelatedProduct,
    required TResult Function(FetchViewedProducts value) fetchViewedProducts,
    required TResult Function(FetchBuyWithProduct value) fetchBuyWithProduct,
    required TResult Function(UpdateState value) updateState,
    required TResult Function(SetSelectedIndexes value) setSelectedIndexes,
    required TResult Function(UpdateExtras value) updateExtras,
    required TResult Function(UpdateSelectedIndexes value)
        updateSelectedIndexes,
    required TResult Function(SelectImage value) selectImage,
  }) {
    return selectImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchProductById value)? fetchProductById,
    TResult? Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult? Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult? Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult? Function(UpdateState value)? updateState,
    TResult? Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult? Function(UpdateExtras value)? updateExtras,
    TResult? Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult? Function(SelectImage value)? selectImage,
  }) {
    return selectImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchProductById value)? fetchProductById,
    TResult Function(FetchRelatedProduct value)? fetchRelatedProduct,
    TResult Function(FetchViewedProducts value)? fetchViewedProducts,
    TResult Function(FetchBuyWithProduct value)? fetchBuyWithProduct,
    TResult Function(UpdateState value)? updateState,
    TResult Function(SetSelectedIndexes value)? setSelectedIndexes,
    TResult Function(UpdateExtras value)? updateExtras,
    TResult Function(UpdateSelectedIndexes value)? updateSelectedIndexes,
    TResult Function(SelectImage value)? selectImage,
    required TResult orElse(),
  }) {
    if (selectImage != null) {
      return selectImage(this);
    }
    return orElse();
  }
}

abstract class SelectImage implements ProductDetailEvent {
  const factory SelectImage(
      {required final Galleries image,
      final bool? jumpTo,
      final bool? nextImageTo}) = _$SelectImageImpl;

  Galleries get image;
  bool? get jumpTo;
  bool? get nextImageTo;
  @JsonKey(ignore: true)
  _$$SelectImageImplCopyWith<_$SelectImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailState {
  List<ProductData> get relatedProduct => throw _privateConstructorUsedError;
  List<ProductData> get viewedProduct => throw _privateConstructorUsedError;
  List<ProductData> get buyWithProduct => throw _privateConstructorUsedError;
  ProductData? get product => throw _privateConstructorUsedError;
  List<TypedExtra> get typedExtras => throw _privateConstructorUsedError;
  List<Stocks> get initialStocks => throw _privateConstructorUsedError;
  List<int> get selectedIndexes => throw _privateConstructorUsedError;
  List<Galleries> get galleries => throw _privateConstructorUsedError;
  bool get jumpTo => throw _privateConstructorUsedError;
  bool get nextImageTo => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingNew => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get stockCount => throw _privateConstructorUsedError;
  Galleries? get selectImage => throw _privateConstructorUsedError;
  Stocks? get selectedStock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {List<ProductData> relatedProduct,
      List<ProductData> viewedProduct,
      List<ProductData> buyWithProduct,
      ProductData? product,
      List<TypedExtra> typedExtras,
      List<Stocks> initialStocks,
      List<int> selectedIndexes,
      List<Galleries> galleries,
      bool jumpTo,
      bool nextImageTo,
      bool isLoading,
      bool isLoadingNew,
      int totalCount,
      int stockCount,
      Galleries? selectImage,
      Stocks? selectedStock});
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relatedProduct = null,
    Object? viewedProduct = null,
    Object? buyWithProduct = null,
    Object? product = freezed,
    Object? typedExtras = null,
    Object? initialStocks = null,
    Object? selectedIndexes = null,
    Object? galleries = null,
    Object? jumpTo = null,
    Object? nextImageTo = null,
    Object? isLoading = null,
    Object? isLoadingNew = null,
    Object? totalCount = null,
    Object? stockCount = null,
    Object? selectImage = freezed,
    Object? selectedStock = freezed,
  }) {
    return _then(_value.copyWith(
      relatedProduct: null == relatedProduct
          ? _value.relatedProduct
          : relatedProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      viewedProduct: null == viewedProduct
          ? _value.viewedProduct
          : viewedProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      buyWithProduct: null == buyWithProduct
          ? _value.buyWithProduct
          : buyWithProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData?,
      typedExtras: null == typedExtras
          ? _value.typedExtras
          : typedExtras // ignore: cast_nullable_to_non_nullable
              as List<TypedExtra>,
      initialStocks: null == initialStocks
          ? _value.initialStocks
          : initialStocks // ignore: cast_nullable_to_non_nullable
              as List<Stocks>,
      selectedIndexes: null == selectedIndexes
          ? _value.selectedIndexes
          : selectedIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      galleries: null == galleries
          ? _value.galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      jumpTo: null == jumpTo
          ? _value.jumpTo
          : jumpTo // ignore: cast_nullable_to_non_nullable
              as bool,
      nextImageTo: null == nextImageTo
          ? _value.nextImageTo
          : nextImageTo // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingNew: null == isLoadingNew
          ? _value.isLoadingNew
          : isLoadingNew // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockCount: null == stockCount
          ? _value.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectImage: freezed == selectImage
          ? _value.selectImage
          : selectImage // ignore: cast_nullable_to_non_nullable
              as Galleries?,
      selectedStock: freezed == selectedStock
          ? _value.selectedStock
          : selectedStock // ignore: cast_nullable_to_non_nullable
              as Stocks?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDetailStateImplCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$ProductDetailStateImplCopyWith(_$ProductDetailStateImpl value,
          $Res Function(_$ProductDetailStateImpl) then) =
      __$$ProductDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductData> relatedProduct,
      List<ProductData> viewedProduct,
      List<ProductData> buyWithProduct,
      ProductData? product,
      List<TypedExtra> typedExtras,
      List<Stocks> initialStocks,
      List<int> selectedIndexes,
      List<Galleries> galleries,
      bool jumpTo,
      bool nextImageTo,
      bool isLoading,
      bool isLoadingNew,
      int totalCount,
      int stockCount,
      Galleries? selectImage,
      Stocks? selectedStock});
}

/// @nodoc
class __$$ProductDetailStateImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailStateImpl>
    implements _$$ProductDetailStateImplCopyWith<$Res> {
  __$$ProductDetailStateImplCopyWithImpl(_$ProductDetailStateImpl _value,
      $Res Function(_$ProductDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relatedProduct = null,
    Object? viewedProduct = null,
    Object? buyWithProduct = null,
    Object? product = freezed,
    Object? typedExtras = null,
    Object? initialStocks = null,
    Object? selectedIndexes = null,
    Object? galleries = null,
    Object? jumpTo = null,
    Object? nextImageTo = null,
    Object? isLoading = null,
    Object? isLoadingNew = null,
    Object? totalCount = null,
    Object? stockCount = null,
    Object? selectImage = freezed,
    Object? selectedStock = freezed,
  }) {
    return _then(_$ProductDetailStateImpl(
      relatedProduct: null == relatedProduct
          ? _value._relatedProduct
          : relatedProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      viewedProduct: null == viewedProduct
          ? _value._viewedProduct
          : viewedProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      buyWithProduct: null == buyWithProduct
          ? _value._buyWithProduct
          : buyWithProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData?,
      typedExtras: null == typedExtras
          ? _value._typedExtras
          : typedExtras // ignore: cast_nullable_to_non_nullable
              as List<TypedExtra>,
      initialStocks: null == initialStocks
          ? _value._initialStocks
          : initialStocks // ignore: cast_nullable_to_non_nullable
              as List<Stocks>,
      selectedIndexes: null == selectedIndexes
          ? _value._selectedIndexes
          : selectedIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      galleries: null == galleries
          ? _value._galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<Galleries>,
      jumpTo: null == jumpTo
          ? _value.jumpTo
          : jumpTo // ignore: cast_nullable_to_non_nullable
              as bool,
      nextImageTo: null == nextImageTo
          ? _value.nextImageTo
          : nextImageTo // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingNew: null == isLoadingNew
          ? _value.isLoadingNew
          : isLoadingNew // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockCount: null == stockCount
          ? _value.stockCount
          : stockCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectImage: freezed == selectImage
          ? _value.selectImage
          : selectImage // ignore: cast_nullable_to_non_nullable
              as Galleries?,
      selectedStock: freezed == selectedStock
          ? _value.selectedStock
          : selectedStock // ignore: cast_nullable_to_non_nullable
              as Stocks?,
    ));
  }
}

/// @nodoc

class _$ProductDetailStateImpl implements _ProductDetailState {
  const _$ProductDetailStateImpl(
      {final List<ProductData> relatedProduct = const [],
      final List<ProductData> viewedProduct = const [],
      final List<ProductData> buyWithProduct = const [],
      this.product = null,
      final List<TypedExtra> typedExtras = const [],
      final List<Stocks> initialStocks = const [],
      final List<int> selectedIndexes = const [],
      final List<Galleries> galleries = const [],
      this.jumpTo = true,
      this.nextImageTo = true,
      this.isLoading = true,
      this.isLoadingNew = true,
      this.totalCount = 0,
      this.stockCount = 0,
      this.selectImage = null,
      this.selectedStock = null})
      : _relatedProduct = relatedProduct,
        _viewedProduct = viewedProduct,
        _buyWithProduct = buyWithProduct,
        _typedExtras = typedExtras,
        _initialStocks = initialStocks,
        _selectedIndexes = selectedIndexes,
        _galleries = galleries;

  final List<ProductData> _relatedProduct;
  @override
  @JsonKey()
  List<ProductData> get relatedProduct {
    if (_relatedProduct is EqualUnmodifiableListView) return _relatedProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedProduct);
  }

  final List<ProductData> _viewedProduct;
  @override
  @JsonKey()
  List<ProductData> get viewedProduct {
    if (_viewedProduct is EqualUnmodifiableListView) return _viewedProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedProduct);
  }

  final List<ProductData> _buyWithProduct;
  @override
  @JsonKey()
  List<ProductData> get buyWithProduct {
    if (_buyWithProduct is EqualUnmodifiableListView) return _buyWithProduct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buyWithProduct);
  }

  @override
  @JsonKey()
  final ProductData? product;
  final List<TypedExtra> _typedExtras;
  @override
  @JsonKey()
  List<TypedExtra> get typedExtras {
    if (_typedExtras is EqualUnmodifiableListView) return _typedExtras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typedExtras);
  }

  final List<Stocks> _initialStocks;
  @override
  @JsonKey()
  List<Stocks> get initialStocks {
    if (_initialStocks is EqualUnmodifiableListView) return _initialStocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialStocks);
  }

  final List<int> _selectedIndexes;
  @override
  @JsonKey()
  List<int> get selectedIndexes {
    if (_selectedIndexes is EqualUnmodifiableListView) return _selectedIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIndexes);
  }

  final List<Galleries> _galleries;
  @override
  @JsonKey()
  List<Galleries> get galleries {
    if (_galleries is EqualUnmodifiableListView) return _galleries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleries);
  }

  @override
  @JsonKey()
  final bool jumpTo;
  @override
  @JsonKey()
  final bool nextImageTo;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingNew;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int stockCount;
  @override
  @JsonKey()
  final Galleries? selectImage;
  @override
  @JsonKey()
  final Stocks? selectedStock;

  @override
  String toString() {
    return 'ProductDetailState(relatedProduct: $relatedProduct, viewedProduct: $viewedProduct, buyWithProduct: $buyWithProduct, product: $product, typedExtras: $typedExtras, initialStocks: $initialStocks, selectedIndexes: $selectedIndexes, galleries: $galleries, jumpTo: $jumpTo, nextImageTo: $nextImageTo, isLoading: $isLoading, isLoadingNew: $isLoadingNew, totalCount: $totalCount, stockCount: $stockCount, selectImage: $selectImage, selectedStock: $selectedStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailStateImpl &&
            const DeepCollectionEquality()
                .equals(other._relatedProduct, _relatedProduct) &&
            const DeepCollectionEquality()
                .equals(other._viewedProduct, _viewedProduct) &&
            const DeepCollectionEquality()
                .equals(other._buyWithProduct, _buyWithProduct) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._typedExtras, _typedExtras) &&
            const DeepCollectionEquality()
                .equals(other._initialStocks, _initialStocks) &&
            const DeepCollectionEquality()
                .equals(other._selectedIndexes, _selectedIndexes) &&
            const DeepCollectionEquality()
                .equals(other._galleries, _galleries) &&
            (identical(other.jumpTo, jumpTo) || other.jumpTo == jumpTo) &&
            (identical(other.nextImageTo, nextImageTo) ||
                other.nextImageTo == nextImageTo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingNew, isLoadingNew) ||
                other.isLoadingNew == isLoadingNew) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.stockCount, stockCount) ||
                other.stockCount == stockCount) &&
            (identical(other.selectImage, selectImage) ||
                other.selectImage == selectImage) &&
            (identical(other.selectedStock, selectedStock) ||
                other.selectedStock == selectedStock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_relatedProduct),
      const DeepCollectionEquality().hash(_viewedProduct),
      const DeepCollectionEquality().hash(_buyWithProduct),
      product,
      const DeepCollectionEquality().hash(_typedExtras),
      const DeepCollectionEquality().hash(_initialStocks),
      const DeepCollectionEquality().hash(_selectedIndexes),
      const DeepCollectionEquality().hash(_galleries),
      jumpTo,
      nextImageTo,
      isLoading,
      isLoadingNew,
      totalCount,
      stockCount,
      selectImage,
      selectedStock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      __$$ProductDetailStateImplCopyWithImpl<_$ProductDetailStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailState implements ProductDetailState {
  const factory _ProductDetailState(
      {final List<ProductData> relatedProduct,
      final List<ProductData> viewedProduct,
      final List<ProductData> buyWithProduct,
      final ProductData? product,
      final List<TypedExtra> typedExtras,
      final List<Stocks> initialStocks,
      final List<int> selectedIndexes,
      final List<Galleries> galleries,
      final bool jumpTo,
      final bool nextImageTo,
      final bool isLoading,
      final bool isLoadingNew,
      final int totalCount,
      final int stockCount,
      final Galleries? selectImage,
      final Stocks? selectedStock}) = _$ProductDetailStateImpl;

  @override
  List<ProductData> get relatedProduct;
  @override
  List<ProductData> get viewedProduct;
  @override
  List<ProductData> get buyWithProduct;
  @override
  ProductData? get product;
  @override
  List<TypedExtra> get typedExtras;
  @override
  List<Stocks> get initialStocks;
  @override
  List<int> get selectedIndexes;
  @override
  List<Galleries> get galleries;
  @override
  bool get jumpTo;
  @override
  bool get nextImageTo;
  @override
  bool get isLoading;
  @override
  bool get isLoadingNew;
  @override
  int get totalCount;
  @override
  int get stockCount;
  @override
  Galleries? get selectImage;
  @override
  Stocks? get selectedStock;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
