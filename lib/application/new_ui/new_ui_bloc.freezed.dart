// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_ui_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewUiEvent {
  double get top => throw _privateConstructorUsedError;
  double get left => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double top, double left) updateCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double top, double left)? updateCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double top, double left)? updateCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateCart value) updateCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateCart value)? updateCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateCart value)? updateCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewUiEventCopyWith<NewUiEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewUiEventCopyWith<$Res> {
  factory $NewUiEventCopyWith(
          NewUiEvent value, $Res Function(NewUiEvent) then) =
      _$NewUiEventCopyWithImpl<$Res, NewUiEvent>;
  @useResult
  $Res call({double top, double left});
}

/// @nodoc
class _$NewUiEventCopyWithImpl<$Res, $Val extends NewUiEvent>
    implements $NewUiEventCopyWith<$Res> {
  _$NewUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCartImplCopyWith<$Res>
    implements $NewUiEventCopyWith<$Res> {
  factory _$$UpdateCartImplCopyWith(
          _$UpdateCartImpl value, $Res Function(_$UpdateCartImpl) then) =
      __$$UpdateCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double top, double left});
}

/// @nodoc
class __$$UpdateCartImplCopyWithImpl<$Res>
    extends _$NewUiEventCopyWithImpl<$Res, _$UpdateCartImpl>
    implements _$$UpdateCartImplCopyWith<$Res> {
  __$$UpdateCartImplCopyWithImpl(
      _$UpdateCartImpl _value, $Res Function(_$UpdateCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
  }) {
    return _then(_$UpdateCartImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateCartImpl implements UpdateCart {
  const _$UpdateCartImpl({required this.top, required this.left});

  @override
  final double top;
  @override
  final double left;

  @override
  String toString() {
    return 'NewUiEvent.updateCart(top: $top, left: $left)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCartImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left));
  }

  @override
  int get hashCode => Object.hash(runtimeType, top, left);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCartImplCopyWith<_$UpdateCartImpl> get copyWith =>
      __$$UpdateCartImplCopyWithImpl<_$UpdateCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double top, double left) updateCart,
  }) {
    return updateCart(top, left);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double top, double left)? updateCart,
  }) {
    return updateCart?.call(top, left);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double top, double left)? updateCart,
    required TResult orElse(),
  }) {
    if (updateCart != null) {
      return updateCart(top, left);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateCart value) updateCart,
  }) {
    return updateCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateCart value)? updateCart,
  }) {
    return updateCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateCart value)? updateCart,
    required TResult orElse(),
  }) {
    if (updateCart != null) {
      return updateCart(this);
    }
    return orElse();
  }
}

abstract class UpdateCart implements NewUiEvent {
  const factory UpdateCart(
      {required final double top,
      required final double left}) = _$UpdateCartImpl;

  @override
  double get top;
  @override
  double get left;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCartImplCopyWith<_$UpdateCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewUiState {
  double get top => throw _privateConstructorUsedError;
  double get left => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewUiStateCopyWith<NewUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewUiStateCopyWith<$Res> {
  factory $NewUiStateCopyWith(
          NewUiState value, $Res Function(NewUiState) then) =
      _$NewUiStateCopyWithImpl<$Res, NewUiState>;
  @useResult
  $Res call({double top, double left});
}

/// @nodoc
class _$NewUiStateCopyWithImpl<$Res, $Val extends NewUiState>
    implements $NewUiStateCopyWith<$Res> {
  _$NewUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
  }) {
    return _then(_value.copyWith(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewUiStateImplCopyWith<$Res>
    implements $NewUiStateCopyWith<$Res> {
  factory _$$NewUiStateImplCopyWith(
          _$NewUiStateImpl value, $Res Function(_$NewUiStateImpl) then) =
      __$$NewUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double top, double left});
}

/// @nodoc
class __$$NewUiStateImplCopyWithImpl<$Res>
    extends _$NewUiStateCopyWithImpl<$Res, _$NewUiStateImpl>
    implements _$$NewUiStateImplCopyWith<$Res> {
  __$$NewUiStateImplCopyWithImpl(
      _$NewUiStateImpl _value, $Res Function(_$NewUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? left = null,
  }) {
    return _then(_$NewUiStateImpl(
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$NewUiStateImpl implements _NewUiState {
  const _$NewUiStateImpl({this.top = 50, this.left = -200});

  @override
  @JsonKey()
  final double top;
  @override
  @JsonKey()
  final double left;

  @override
  String toString() {
    return 'NewUiState(top: $top, left: $left)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewUiStateImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.left, left) || other.left == left));
  }

  @override
  int get hashCode => Object.hash(runtimeType, top, left);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewUiStateImplCopyWith<_$NewUiStateImpl> get copyWith =>
      __$$NewUiStateImplCopyWithImpl<_$NewUiStateImpl>(this, _$identity);
}

abstract class _NewUiState implements NewUiState {
  const factory _NewUiState({final double top, final double left}) =
      _$NewUiStateImpl;

  @override
  double get top;
  @override
  double get left;
  @override
  @JsonKey(ignore: true)
  _$$NewUiStateImplCopyWith<_$NewUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
