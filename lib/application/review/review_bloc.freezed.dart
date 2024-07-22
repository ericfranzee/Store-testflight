// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEventCopyWith<$Res> {
  factory $ReviewEventCopyWith(
          ReviewEvent value, $Res Function(ReviewEvent) then) =
      _$ReviewEventCopyWithImpl<$Res, ReviewEvent>;
}

/// @nodoc
class _$ReviewEventCopyWithImpl<$Res, $Val extends ReviewEvent>
    implements $ReviewEventCopyWith<$Res> {
  _$ReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetReviewImplCopyWith<$Res> {
  factory _$$SetReviewImplCopyWith(
          _$SetReviewImpl value, $Res Function(_$SetReviewImpl) then) =
      __$$SetReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double review});
}

/// @nodoc
class __$$SetReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SetReviewImpl>
    implements _$$SetReviewImplCopyWith<$Res> {
  __$$SetReviewImplCopyWithImpl(
      _$SetReviewImpl _value, $Res Function(_$SetReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
  }) {
    return _then(_$SetReviewImpl(
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SetReviewImpl implements SetReview {
  const _$SetReviewImpl({required this.review});

  @override
  final double review;

  @override
  String toString() {
    return 'ReviewEvent.setReview(review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetReviewImpl &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetReviewImplCopyWith<_$SetReviewImpl> get copyWith =>
      __$$SetReviewImplCopyWithImpl<_$SetReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return setReview(review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return setReview?.call(review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (setReview != null) {
      return setReview(review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return setReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return setReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (setReview != null) {
      return setReview(this);
    }
    return orElse();
  }
}

abstract class SetReview implements ReviewEvent {
  const factory SetReview({required final double review}) = _$SetReviewImpl;

  double get review;
  @JsonKey(ignore: true)
  _$$SetReviewImplCopyWith<_$SetReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendReviewImplCopyWith<$Res> {
  factory _$$SendReviewImplCopyWith(
          _$SendReviewImpl value, $Res Function(_$SendReviewImpl) then) =
      __$$SendReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      String comment,
      int? shopId,
      String? productUuid,
      int? blogId,
      int? orderId,
      int? bookingId,
      VoidCallback onSuccess});
}

/// @nodoc
class __$$SendReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SendReviewImpl>
    implements _$$SendReviewImplCopyWith<$Res> {
  __$$SendReviewImplCopyWithImpl(
      _$SendReviewImpl _value, $Res Function(_$SendReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? comment = null,
    Object? shopId = freezed,
    Object? productUuid = freezed,
    Object? blogId = freezed,
    Object? orderId = freezed,
    Object? bookingId = freezed,
    Object? onSuccess = null,
  }) {
    return _then(_$SendReviewImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      productUuid: freezed == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      blogId: freezed == blogId
          ? _value.blogId
          : blogId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      onSuccess: null == onSuccess
          ? _value.onSuccess
          : onSuccess // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$SendReviewImpl implements SendReview {
  const _$SendReviewImpl(
      {required this.context,
      required this.comment,
      this.shopId,
      this.productUuid,
      this.blogId,
      this.orderId,
      this.bookingId,
      required this.onSuccess});

  @override
  final BuildContext context;
  @override
  final String comment;
  @override
  final int? shopId;
  @override
  final String? productUuid;
  @override
  final int? blogId;
  @override
  final int? orderId;
  @override
  final int? bookingId;
  @override
  final VoidCallback onSuccess;

  @override
  String toString() {
    return 'ReviewEvent.sendReview(context: $context, comment: $comment, shopId: $shopId, productUuid: $productUuid, blogId: $blogId, orderId: $orderId, bookingId: $bookingId, onSuccess: $onSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendReviewImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.blogId, blogId) || other.blogId == blogId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, comment, shopId,
      productUuid, blogId, orderId, bookingId, onSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendReviewImplCopyWith<_$SendReviewImpl> get copyWith =>
      __$$SendReviewImplCopyWithImpl<_$SendReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return sendReview(context, comment, shopId, productUuid, blogId, orderId,
        bookingId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return sendReview?.call(context, comment, shopId, productUuid, blogId,
        orderId, bookingId, onSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (sendReview != null) {
      return sendReview(context, comment, shopId, productUuid, blogId, orderId,
          bookingId, onSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return sendReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return sendReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (sendReview != null) {
      return sendReview(this);
    }
    return orElse();
  }
}

abstract class SendReview implements ReviewEvent {
  const factory SendReview(
      {required final BuildContext context,
      required final String comment,
      final int? shopId,
      final String? productUuid,
      final int? blogId,
      final int? orderId,
      final int? bookingId,
      required final VoidCallback onSuccess}) = _$SendReviewImpl;

  BuildContext get context;
  String get comment;
  int? get shopId;
  String? get productUuid;
  int? get blogId;
  int? get orderId;
  int? get bookingId;
  VoidCallback get onSuccess;
  @JsonKey(ignore: true)
  _$$SendReviewImplCopyWith<_$SendReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchReviewImplCopyWith<$Res> {
  factory _$$FetchReviewImplCopyWith(
          _$FetchReviewImpl value, $Res Function(_$FetchReviewImpl) then) =
      __$$FetchReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      int? shopId,
      int? blogId,
      int? driverId,
      int? productId});
}

/// @nodoc
class __$$FetchReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$FetchReviewImpl>
    implements _$$FetchReviewImplCopyWith<$Res> {
  __$$FetchReviewImplCopyWithImpl(
      _$FetchReviewImpl _value, $Res Function(_$FetchReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? shopId = freezed,
    Object? blogId = freezed,
    Object? driverId = freezed,
    Object? productId = freezed,
  }) {
    return _then(_$FetchReviewImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      blogId: freezed == blogId
          ? _value.blogId
          : blogId // ignore: cast_nullable_to_non_nullable
              as int?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchReviewImpl implements FetchReview {
  const _$FetchReviewImpl(
      {required this.context,
      this.shopId,
      this.blogId,
      this.driverId,
      this.productId});

  @override
  final BuildContext context;
  @override
  final int? shopId;
  @override
  final int? blogId;
  @override
  final int? driverId;
  @override
  final int? productId;

  @override
  String toString() {
    return 'ReviewEvent.fetchReview(context: $context, shopId: $shopId, blogId: $blogId, driverId: $driverId, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchReviewImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.blogId, blogId) || other.blogId == blogId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, shopId, blogId, driverId, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchReviewImplCopyWith<_$FetchReviewImpl> get copyWith =>
      __$$FetchReviewImplCopyWithImpl<_$FetchReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return fetchReview(context, shopId, blogId, driverId, productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return fetchReview?.call(context, shopId, blogId, driverId, productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReview != null) {
      return fetchReview(context, shopId, blogId, driverId, productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return fetchReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return fetchReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReview != null) {
      return fetchReview(this);
    }
    return orElse();
  }
}

abstract class FetchReview implements ReviewEvent {
  const factory FetchReview(
      {required final BuildContext context,
      final int? shopId,
      final int? blogId,
      final int? driverId,
      final int? productId}) = _$FetchReviewImpl;

  BuildContext get context;
  int? get shopId;
  int? get blogId;
  int? get driverId;
  int? get productId;
  @JsonKey(ignore: true)
  _$$FetchReviewImplCopyWith<_$FetchReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetImageImplCopyWith<$Res> {
  factory _$$SetImageImplCopyWith(
          _$SetImageImpl value, $Res Function(_$SetImageImpl) then) =
      __$$SetImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$SetImageImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SetImageImpl>
    implements _$$SetImageImplCopyWith<$Res> {
  __$$SetImageImplCopyWithImpl(
      _$SetImageImpl _value, $Res Function(_$SetImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$SetImageImpl(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetImageImpl implements SetImage {
  const _$SetImageImpl({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString() {
    return 'ReviewEvent.setImage(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetImageImpl &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetImageImplCopyWith<_$SetImageImpl> get copyWith =>
      __$$SetImageImplCopyWithImpl<_$SetImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return setImage(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return setImage?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (setImage != null) {
      return setImage(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return setImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return setImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (setImage != null) {
      return setImage(this);
    }
    return orElse();
  }
}

abstract class SetImage implements ReviewEvent {
  const factory SetImage({required final String imagePath}) = _$SetImageImpl;

  String get imagePath;
  @JsonKey(ignore: true)
  _$$SetImageImplCopyWith<_$SetImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectOfTypeImplCopyWith<$Res> {
  factory _$$SelectOfTypeImplCopyWith(
          _$SelectOfTypeImpl value, $Res Function(_$SelectOfTypeImpl) then) =
      __$$SelectOfTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$SelectOfTypeImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SelectOfTypeImpl>
    implements _$$SelectOfTypeImplCopyWith<$Res> {
  __$$SelectOfTypeImplCopyWithImpl(
      _$SelectOfTypeImpl _value, $Res Function(_$SelectOfTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SelectOfTypeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectOfTypeImpl implements SelectOfType {
  const _$SelectOfTypeImpl({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'ReviewEvent.selectOfType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectOfTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectOfTypeImplCopyWith<_$SelectOfTypeImpl> get copyWith =>
      __$$SelectOfTypeImplCopyWithImpl<_$SelectOfTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return selectOfType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return selectOfType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (selectOfType != null) {
      return selectOfType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return selectOfType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return selectOfType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (selectOfType != null) {
      return selectOfType(this);
    }
    return orElse();
  }
}

abstract class SelectOfType implements ReviewEvent {
  const factory SelectOfType({required final String type}) = _$SelectOfTypeImpl;

  String get type;
  @JsonKey(ignore: true)
  _$$SelectOfTypeImplCopyWith<_$SelectOfTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectOfTypeFromReviewImplCopyWith<$Res> {
  factory _$$SelectOfTypeFromReviewImplCopyWith(
          _$SelectOfTypeFromReviewImpl value,
          $Res Function(_$SelectOfTypeFromReviewImpl) then) =
      __$$SelectOfTypeFromReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewModel? review});
}

/// @nodoc
class __$$SelectOfTypeFromReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SelectOfTypeFromReviewImpl>
    implements _$$SelectOfTypeFromReviewImplCopyWith<$Res> {
  __$$SelectOfTypeFromReviewImplCopyWithImpl(
      _$SelectOfTypeFromReviewImpl _value,
      $Res Function(_$SelectOfTypeFromReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = freezed,
  }) {
    return _then(_$SelectOfTypeFromReviewImpl(
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel?,
    ));
  }
}

/// @nodoc

class _$SelectOfTypeFromReviewImpl implements SelectOfTypeFromReview {
  const _$SelectOfTypeFromReviewImpl({required this.review});

  @override
  final ReviewModel? review;

  @override
  String toString() {
    return 'ReviewEvent.selectOfTypeFromReview(review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectOfTypeFromReviewImpl &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectOfTypeFromReviewImplCopyWith<_$SelectOfTypeFromReviewImpl>
      get copyWith => __$$SelectOfTypeFromReviewImplCopyWithImpl<
          _$SelectOfTypeFromReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return selectOfTypeFromReview(review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return selectOfTypeFromReview?.call(review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (selectOfTypeFromReview != null) {
      return selectOfTypeFromReview(review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return selectOfTypeFromReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return selectOfTypeFromReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (selectOfTypeFromReview != null) {
      return selectOfTypeFromReview(this);
    }
    return orElse();
  }
}

abstract class SelectOfTypeFromReview implements ReviewEvent {
  const factory SelectOfTypeFromReview({required final ReviewModel? review}) =
      _$SelectOfTypeFromReviewImpl;

  ReviewModel? get review;
  @JsonKey(ignore: true)
  _$$SelectOfTypeFromReviewImplCopyWith<_$SelectOfTypeFromReviewImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchReviewListImplCopyWith<$Res> {
  factory _$$FetchReviewListImplCopyWith(_$FetchReviewListImpl value,
          $Res Function(_$FetchReviewListImpl) then) =
      __$$FetchReviewListImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context,
      int? shopId,
      int? blogId,
      int? driverId,
      int? masterId,
      String? productUuid,
      bool? isRefresh,
      RefreshController? controller});
}

/// @nodoc
class __$$FetchReviewListImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$FetchReviewListImpl>
    implements _$$FetchReviewListImplCopyWith<$Res> {
  __$$FetchReviewListImplCopyWithImpl(
      _$FetchReviewListImpl _value, $Res Function(_$FetchReviewListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? shopId = freezed,
    Object? blogId = freezed,
    Object? driverId = freezed,
    Object? masterId = freezed,
    Object? productUuid = freezed,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchReviewListImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      blogId: freezed == blogId
          ? _value.blogId
          : blogId // ignore: cast_nullable_to_non_nullable
              as int?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$FetchReviewListImpl implements FetchReviewList {
  const _$FetchReviewListImpl(
      {required this.context,
      this.shopId,
      this.blogId,
      this.driverId,
      this.masterId,
      this.productUuid,
      this.isRefresh,
      this.controller});

  @override
  final BuildContext context;
  @override
  final int? shopId;
  @override
  final int? blogId;
  @override
  final int? driverId;
  @override
  final int? masterId;
  @override
  final String? productUuid;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'ReviewEvent.fetchReviewList(context: $context, shopId: $shopId, blogId: $blogId, driverId: $driverId, masterId: $masterId, productUuid: $productUuid, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchReviewListImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.blogId, blogId) || other.blogId == blogId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, shopId, blogId,
      driverId, masterId, productUuid, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchReviewListImplCopyWith<_$FetchReviewListImpl> get copyWith =>
      __$$FetchReviewListImplCopyWithImpl<_$FetchReviewListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return fetchReviewList(context, shopId, blogId, driverId, masterId,
        productUuid, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return fetchReviewList?.call(context, shopId, blogId, driverId, masterId,
        productUuid, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReviewList != null) {
      return fetchReviewList(context, shopId, blogId, driverId, masterId,
          productUuid, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return fetchReviewList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return fetchReviewList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReviewList != null) {
      return fetchReviewList(this);
    }
    return orElse();
  }
}

abstract class FetchReviewList implements ReviewEvent {
  const factory FetchReviewList(
      {required final BuildContext context,
      final int? shopId,
      final int? blogId,
      final int? driverId,
      final int? masterId,
      final String? productUuid,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchReviewListImpl;

  BuildContext get context;
  int? get shopId;
  int? get blogId;
  int? get driverId;
  int? get masterId;
  String? get productUuid;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchReviewListImplCopyWith<_$FetchReviewListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchReviewOptionsImplCopyWith<$Res> {
  factory _$$FetchReviewOptionsImplCopyWith(_$FetchReviewOptionsImpl value,
          $Res Function(_$FetchReviewOptionsImpl) then) =
      __$$FetchReviewOptionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int? shopId});
}

/// @nodoc
class __$$FetchReviewOptionsImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$FetchReviewOptionsImpl>
    implements _$$FetchReviewOptionsImplCopyWith<$Res> {
  __$$FetchReviewOptionsImplCopyWithImpl(_$FetchReviewOptionsImpl _value,
      $Res Function(_$FetchReviewOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? shopId = freezed,
  }) {
    return _then(_$FetchReviewOptionsImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FetchReviewOptionsImpl implements FetchReviewOptions {
  const _$FetchReviewOptionsImpl({required this.context, this.shopId});

  @override
  final BuildContext context;
  @override
  final int? shopId;

  @override
  String toString() {
    return 'ReviewEvent.fetchReviewOptions(context: $context, shopId: $shopId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchReviewOptionsImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.shopId, shopId) || other.shopId == shopId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, shopId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchReviewOptionsImplCopyWith<_$FetchReviewOptionsImpl> get copyWith =>
      __$$FetchReviewOptionsImplCopyWithImpl<_$FetchReviewOptionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double review) setReview,
    required TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)
        sendReview,
    required TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)
        fetchReview,
    required TResult Function(String imagePath) setImage,
    required TResult Function(String type) selectOfType,
    required TResult Function(ReviewModel? review) selectOfTypeFromReview,
    required TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)
        fetchReviewList,
    required TResult Function(BuildContext context, int? shopId)
        fetchReviewOptions,
  }) {
    return fetchReviewOptions(context, shopId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double review)? setReview,
    TResult? Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult? Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult? Function(String imagePath)? setImage,
    TResult? Function(String type)? selectOfType,
    TResult? Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult? Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult? Function(BuildContext context, int? shopId)? fetchReviewOptions,
  }) {
    return fetchReviewOptions?.call(context, shopId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double review)? setReview,
    TResult Function(
            BuildContext context,
            String comment,
            int? shopId,
            String? productUuid,
            int? blogId,
            int? orderId,
            int? bookingId,
            VoidCallback onSuccess)?
        sendReview,
    TResult Function(BuildContext context, int? shopId, int? blogId,
            int? driverId, int? productId)?
        fetchReview,
    TResult Function(String imagePath)? setImage,
    TResult Function(String type)? selectOfType,
    TResult Function(ReviewModel? review)? selectOfTypeFromReview,
    TResult Function(
            BuildContext context,
            int? shopId,
            int? blogId,
            int? driverId,
            int? masterId,
            String? productUuid,
            bool? isRefresh,
            RefreshController? controller)?
        fetchReviewList,
    TResult Function(BuildContext context, int? shopId)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReviewOptions != null) {
      return fetchReviewOptions(context, shopId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetReview value) setReview,
    required TResult Function(SendReview value) sendReview,
    required TResult Function(FetchReview value) fetchReview,
    required TResult Function(SetImage value) setImage,
    required TResult Function(SelectOfType value) selectOfType,
    required TResult Function(SelectOfTypeFromReview value)
        selectOfTypeFromReview,
    required TResult Function(FetchReviewList value) fetchReviewList,
    required TResult Function(FetchReviewOptions value) fetchReviewOptions,
  }) {
    return fetchReviewOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SetReview value)? setReview,
    TResult? Function(SendReview value)? sendReview,
    TResult? Function(FetchReview value)? fetchReview,
    TResult? Function(SetImage value)? setImage,
    TResult? Function(SelectOfType value)? selectOfType,
    TResult? Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult? Function(FetchReviewList value)? fetchReviewList,
    TResult? Function(FetchReviewOptions value)? fetchReviewOptions,
  }) {
    return fetchReviewOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetReview value)? setReview,
    TResult Function(SendReview value)? sendReview,
    TResult Function(FetchReview value)? fetchReview,
    TResult Function(SetImage value)? setImage,
    TResult Function(SelectOfType value)? selectOfType,
    TResult Function(SelectOfTypeFromReview value)? selectOfTypeFromReview,
    TResult Function(FetchReviewList value)? fetchReviewList,
    TResult Function(FetchReviewOptions value)? fetchReviewOptions,
    required TResult orElse(),
  }) {
    if (fetchReviewOptions != null) {
      return fetchReviewOptions(this);
    }
    return orElse();
  }
}

abstract class FetchReviewOptions implements ReviewEvent {
  const factory FetchReviewOptions(
      {required final BuildContext context,
      final int? shopId}) = _$FetchReviewOptionsImpl;

  BuildContext get context;
  int? get shopId;
  @JsonKey(ignore: true)
  _$$FetchReviewOptionsImplCopyWith<_$FetchReviewOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewState {
  double get review => throw _privateConstructorUsedError;
  bool get isAddButton => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isButtonLoading => throw _privateConstructorUsedError;
  List<ReviewModel> get list => throw _privateConstructorUsedError;
  List<String> get listOfImage => throw _privateConstructorUsedError;
  List<String> get selectedTypes => throw _privateConstructorUsedError;
  ReviewCountModel? get reviewCount => throw _privateConstructorUsedError;
  ReviewOptions? get reviewOptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call(
      {double review,
      bool isAddButton,
      bool isLoading,
      bool isButtonLoading,
      List<ReviewModel> list,
      List<String> listOfImage,
      List<String> selectedTypes,
      ReviewCountModel? reviewCount,
      ReviewOptions? reviewOptions});
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? isAddButton = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? list = null,
    Object? listOfImage = null,
    Object? selectedTypes = null,
    Object? reviewCount = freezed,
    Object? reviewOptions = freezed,
  }) {
    return _then(_value.copyWith(
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as double,
      isAddButton: null == isAddButton
          ? _value.isAddButton
          : isAddButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      listOfImage: null == listOfImage
          ? _value.listOfImage
          : listOfImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTypes: null == selectedTypes
          ? _value.selectedTypes
          : selectedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCountModel?,
      reviewOptions: freezed == reviewOptions
          ? _value.reviewOptions
          : reviewOptions // ignore: cast_nullable_to_non_nullable
              as ReviewOptions?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
          _$ReviewStateImpl value, $Res Function(_$ReviewStateImpl) then) =
      __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double review,
      bool isAddButton,
      bool isLoading,
      bool isButtonLoading,
      List<ReviewModel> list,
      List<String> listOfImage,
      List<String> selectedTypes,
      ReviewCountModel? reviewCount,
      ReviewOptions? reviewOptions});
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
      _$ReviewStateImpl _value, $Res Function(_$ReviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? isAddButton = null,
    Object? isLoading = null,
    Object? isButtonLoading = null,
    Object? list = null,
    Object? listOfImage = null,
    Object? selectedTypes = null,
    Object? reviewCount = freezed,
    Object? reviewOptions = freezed,
  }) {
    return _then(_$ReviewStateImpl(
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as double,
      isAddButton: null == isAddButton
          ? _value.isAddButton
          : isAddButton // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonLoading: null == isButtonLoading
          ? _value.isButtonLoading
          : isButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      listOfImage: null == listOfImage
          ? _value._listOfImage
          : listOfImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTypes: null == selectedTypes
          ? _value._selectedTypes
          : selectedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCountModel?,
      reviewOptions: freezed == reviewOptions
          ? _value.reviewOptions
          : reviewOptions // ignore: cast_nullable_to_non_nullable
              as ReviewOptions?,
    ));
  }
}

/// @nodoc

class _$ReviewStateImpl implements _ReviewState {
  const _$ReviewStateImpl(
      {this.review = 3,
      this.isAddButton = false,
      this.isLoading = false,
      this.isButtonLoading = false,
      final List<ReviewModel> list = const [],
      final List<String> listOfImage = const [],
      final List<String> selectedTypes = const [],
      this.reviewCount = null,
      this.reviewOptions = null})
      : _list = list,
        _listOfImage = listOfImage,
        _selectedTypes = selectedTypes;

  @override
  @JsonKey()
  final double review;
  @override
  @JsonKey()
  final bool isAddButton;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isButtonLoading;
  final List<ReviewModel> _list;
  @override
  @JsonKey()
  List<ReviewModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<String> _listOfImage;
  @override
  @JsonKey()
  List<String> get listOfImage {
    if (_listOfImage is EqualUnmodifiableListView) return _listOfImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfImage);
  }

  final List<String> _selectedTypes;
  @override
  @JsonKey()
  List<String> get selectedTypes {
    if (_selectedTypes is EqualUnmodifiableListView) return _selectedTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTypes);
  }

  @override
  @JsonKey()
  final ReviewCountModel? reviewCount;
  @override
  @JsonKey()
  final ReviewOptions? reviewOptions;

  @override
  String toString() {
    return 'ReviewState(review: $review, isAddButton: $isAddButton, isLoading: $isLoading, isButtonLoading: $isButtonLoading, list: $list, listOfImage: $listOfImage, selectedTypes: $selectedTypes, reviewCount: $reviewCount, reviewOptions: $reviewOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.isAddButton, isAddButton) ||
                other.isAddButton == isAddButton) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isButtonLoading, isButtonLoading) ||
                other.isButtonLoading == isButtonLoading) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._listOfImage, _listOfImage) &&
            const DeepCollectionEquality()
                .equals(other._selectedTypes, _selectedTypes) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.reviewOptions, reviewOptions) ||
                other.reviewOptions == reviewOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      review,
      isAddButton,
      isLoading,
      isButtonLoading,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_listOfImage),
      const DeepCollectionEquality().hash(_selectedTypes),
      reviewCount,
      reviewOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState(
      {final double review,
      final bool isAddButton,
      final bool isLoading,
      final bool isButtonLoading,
      final List<ReviewModel> list,
      final List<String> listOfImage,
      final List<String> selectedTypes,
      final ReviewCountModel? reviewCount,
      final ReviewOptions? reviewOptions}) = _$ReviewStateImpl;

  @override
  double get review;
  @override
  bool get isAddButton;
  @override
  bool get isLoading;
  @override
  bool get isButtonLoading;
  @override
  List<ReviewModel> get list;
  @override
  List<String> get listOfImage;
  @override
  List<String> get selectedTypes;
  @override
  ReviewCountModel? get reviewCount;
  @override
  ReviewOptions? get reviewOptions;
  @override
  @JsonKey(ignore: true)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
