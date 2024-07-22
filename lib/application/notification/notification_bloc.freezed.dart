// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationEventCopyWith<NotificationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

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
abstract class _$$FetchNotificationImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$FetchNotificationImplCopyWith(_$FetchNotificationImpl value,
          $Res Function(_$FetchNotificationImpl) then) =
      __$$FetchNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$FetchNotificationImpl>
    implements _$$FetchNotificationImplCopyWith<$Res> {
  __$$FetchNotificationImplCopyWithImpl(_$FetchNotificationImpl _value,
      $Res Function(_$FetchNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchNotificationImpl(
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

class _$FetchNotificationImpl implements FetchNotification {
  const _$FetchNotificationImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'NotificationEvent.fetchNotification(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNotificationImpl &&
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
  _$$FetchNotificationImplCopyWith<_$FetchNotificationImpl> get copyWith =>
      __$$FetchNotificationImplCopyWithImpl<_$FetchNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) {
    return fetchNotification(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) {
    return fetchNotification?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) {
    return fetchNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) {
    return fetchNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) {
    if (fetchNotification != null) {
      return fetchNotification(this);
    }
    return orElse();
  }
}

abstract class FetchNotification implements NotificationEvent {
  const factory FetchNotification(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchNotificationImpl;

  @override
  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchNotificationImplCopyWith<_$FetchNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadAllImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$ReadAllImplCopyWith(
          _$ReadAllImpl value, $Res Function(_$ReadAllImpl) then) =
      __$$ReadAllImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$ReadAllImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ReadAllImpl>
    implements _$$ReadAllImplCopyWith<$Res> {
  __$$ReadAllImplCopyWithImpl(
      _$ReadAllImpl _value, $Res Function(_$ReadAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$ReadAllImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$ReadAllImpl implements ReadAll {
  const _$ReadAllImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'NotificationEvent.readAll(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadAllImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadAllImplCopyWith<_$ReadAllImpl> get copyWith =>
      __$$ReadAllImplCopyWithImpl<_$ReadAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) {
    return readAll(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) {
    return readAll?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) {
    if (readAll != null) {
      return readAll(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) {
    return readAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) {
    return readAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) {
    if (readAll != null) {
      return readAll(this);
    }
    return orElse();
  }
}

abstract class ReadAll implements NotificationEvent {
  const factory ReadAll({required final BuildContext context}) = _$ReadAllImpl;

  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$ReadAllImplCopyWith<_$ReadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadOneImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$ReadOneImplCopyWith(
          _$ReadOneImpl value, $Res Function(_$ReadOneImpl) then) =
      __$$ReadOneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int? id});
}

/// @nodoc
class __$$ReadOneImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$ReadOneImpl>
    implements _$$ReadOneImplCopyWith<$Res> {
  __$$ReadOneImplCopyWithImpl(
      _$ReadOneImpl _value, $Res Function(_$ReadOneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = freezed,
  }) {
    return _then(_$ReadOneImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ReadOneImpl implements ReadOne {
  const _$ReadOneImpl({required this.context, required this.id});

  @override
  final BuildContext context;
  @override
  final int? id;

  @override
  String toString() {
    return 'NotificationEvent.readOne(context: $context, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadOneImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadOneImplCopyWith<_$ReadOneImpl> get copyWith =>
      __$$ReadOneImplCopyWithImpl<_$ReadOneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) {
    return readOne(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) {
    return readOne?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) {
    if (readOne != null) {
      return readOne(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) {
    return readOne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) {
    return readOne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) {
    if (readOne != null) {
      return readOne(this);
    }
    return orElse();
  }
}

abstract class ReadOne implements NotificationEvent {
  const factory ReadOne(
      {required final BuildContext context,
      required final int? id}) = _$ReadOneImpl;

  @override
  BuildContext get context;
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$ReadOneImplCopyWith<_$ReadOneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$RemoveItemImplCopyWith(
          _$RemoveItemImpl value, $Res Function(_$RemoveItemImpl) then) =
      __$$RemoveItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int? id});
}

/// @nodoc
class __$$RemoveItemImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$RemoveItemImpl>
    implements _$$RemoveItemImplCopyWith<$Res> {
  __$$RemoveItemImplCopyWithImpl(
      _$RemoveItemImpl _value, $Res Function(_$RemoveItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = freezed,
  }) {
    return _then(_$RemoveItemImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RemoveItemImpl implements RemoveItem {
  const _$RemoveItemImpl({required this.context, required this.id});

  @override
  final BuildContext context;
  @override
  final int? id;

  @override
  String toString() {
    return 'NotificationEvent.removeItem(context: $context, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      __$$RemoveItemImplCopyWithImpl<_$RemoveItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) {
    return removeItem(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) {
    return removeItem?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class RemoveItem implements NotificationEvent {
  const factory RemoveItem(
      {required final BuildContext context,
      required final int? id}) = _$RemoveItemImpl;

  @override
  BuildContext get context;
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCountImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$FetchCountImplCopyWith(
          _$FetchCountImpl value, $Res Function(_$FetchCountImpl) then) =
      __$$FetchCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$FetchCountImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$FetchCountImpl>
    implements _$$FetchCountImplCopyWith<$Res> {
  __$$FetchCountImplCopyWithImpl(
      _$FetchCountImpl _value, $Res Function(_$FetchCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$FetchCountImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$FetchCountImpl implements FetchCount {
  const _$FetchCountImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'NotificationEvent.fetchCount(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCountImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCountImplCopyWith<_$FetchCountImpl> get copyWith =>
      __$$FetchCountImplCopyWithImpl<_$FetchCountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchNotification,
    required TResult Function(BuildContext context) readAll,
    required TResult Function(BuildContext context, int? id) readOne,
    required TResult Function(BuildContext context, int? id) removeItem,
    required TResult Function(BuildContext context) fetchCount,
  }) {
    return fetchCount(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult? Function(BuildContext context)? readAll,
    TResult? Function(BuildContext context, int? id)? readOne,
    TResult? Function(BuildContext context, int? id)? removeItem,
    TResult? Function(BuildContext context)? fetchCount,
  }) {
    return fetchCount?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchNotification,
    TResult Function(BuildContext context)? readAll,
    TResult Function(BuildContext context, int? id)? readOne,
    TResult Function(BuildContext context, int? id)? removeItem,
    TResult Function(BuildContext context)? fetchCount,
    required TResult orElse(),
  }) {
    if (fetchCount != null) {
      return fetchCount(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotification value) fetchNotification,
    required TResult Function(ReadAll value) readAll,
    required TResult Function(ReadOne value) readOne,
    required TResult Function(RemoveItem value) removeItem,
    required TResult Function(FetchCount value) fetchCount,
  }) {
    return fetchCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotification value)? fetchNotification,
    TResult? Function(ReadAll value)? readAll,
    TResult? Function(ReadOne value)? readOne,
    TResult? Function(RemoveItem value)? removeItem,
    TResult? Function(FetchCount value)? fetchCount,
  }) {
    return fetchCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotification value)? fetchNotification,
    TResult Function(ReadAll value)? readAll,
    TResult Function(ReadOne value)? readOne,
    TResult Function(RemoveItem value)? removeItem,
    TResult Function(FetchCount value)? fetchCount,
    required TResult orElse(),
  }) {
    if (fetchCount != null) {
      return fetchCount(this);
    }
    return orElse();
  }
}

abstract class FetchCount implements NotificationEvent {
  const factory FetchCount({required final BuildContext context}) =
      _$FetchCountImpl;

  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$FetchCountImplCopyWith<_$FetchCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  CountNotificationModel? get countOfNotifications =>
      throw _privateConstructorUsedError;
  bool get isReadAllLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<NotificationModel> notifications,
      CountNotificationModel? countOfNotifications,
      bool isReadAllLoading});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notifications = null,
    Object? countOfNotifications = freezed,
    Object? isReadAllLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      countOfNotifications: freezed == countOfNotifications
          ? _value.countOfNotifications
          : countOfNotifications // ignore: cast_nullable_to_non_nullable
              as CountNotificationModel?,
      isReadAllLoading: null == isReadAllLoading
          ? _value.isReadAllLoading
          : isReadAllLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<NotificationModel> notifications,
      CountNotificationModel? countOfNotifications,
      bool isReadAllLoading});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notifications = null,
    Object? countOfNotifications = freezed,
    Object? isReadAllLoading = null,
  }) {
    return _then(_$NotificationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      countOfNotifications: freezed == countOfNotifications
          ? _value.countOfNotifications
          : countOfNotifications // ignore: cast_nullable_to_non_nullable
              as CountNotificationModel?,
      isReadAllLoading: null == isReadAllLoading
          ? _value.isReadAllLoading
          : isReadAllLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl implements _NotificationState {
  const _$NotificationStateImpl(
      {this.isLoading = false,
      final List<NotificationModel> notifications = const [],
      this.countOfNotifications = null,
      this.isReadAllLoading = false})
      : _notifications = notifications;

  @override
  @JsonKey()
  final bool isLoading;
  final List<NotificationModel> _notifications;
  @override
  @JsonKey()
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final CountNotificationModel? countOfNotifications;
  @override
  @JsonKey()
  final bool isReadAllLoading;

  @override
  String toString() {
    return 'NotificationState(isLoading: $isLoading, notifications: $notifications, countOfNotifications: $countOfNotifications, isReadAllLoading: $isReadAllLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.countOfNotifications, countOfNotifications) ||
                other.countOfNotifications == countOfNotifications) &&
            (identical(other.isReadAllLoading, isReadAllLoading) ||
                other.isReadAllLoading == isReadAllLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_notifications),
      countOfNotifications,
      isReadAllLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {final bool isLoading,
      final List<NotificationModel> notifications,
      final CountNotificationModel? countOfNotifications,
      final bool isReadAllLoading}) = _$NotificationStateImpl;

  @override
  bool get isLoading;
  @override
  List<NotificationModel> get notifications;
  @override
  CountNotificationModel? get countOfNotifications;
  @override
  bool get isReadAllLoading;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
