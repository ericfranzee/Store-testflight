// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(bool value) changeForYou,
    required TResult Function(bool value) showSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(bool value)? changeForYou,
    TResult? Function(bool value)? showSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(bool value)? changeForYou,
    TResult Function(bool value)? showSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIndex value) changeIndex,
    required TResult Function(ChangeForYou value) changeForYou,
    required TResult Function(ShowSearch value) showSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeIndex value)? changeIndex,
    TResult? Function(ChangeForYou value)? changeForYou,
    TResult? Function(ShowSearch value)? showSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIndex value)? changeIndex,
    TResult Function(ChangeForYou value)? changeForYou,
    TResult Function(ShowSearch value)? showSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeIndexImplCopyWith<$Res> {
  factory _$$ChangeIndexImplCopyWith(
          _$ChangeIndexImpl value, $Res Function(_$ChangeIndexImpl) then) =
      __$$ChangeIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeIndexImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$ChangeIndexImpl>
    implements _$$ChangeIndexImplCopyWith<$Res> {
  __$$ChangeIndexImplCopyWithImpl(
      _$ChangeIndexImpl _value, $Res Function(_$ChangeIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ChangeIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeIndexImpl implements ChangeIndex {
  const _$ChangeIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'MainEvent.changeIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeIndexImplCopyWith<_$ChangeIndexImpl> get copyWith =>
      __$$ChangeIndexImplCopyWithImpl<_$ChangeIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(bool value) changeForYou,
    required TResult Function(bool value) showSearch,
  }) {
    return changeIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(bool value)? changeForYou,
    TResult? Function(bool value)? showSearch,
  }) {
    return changeIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(bool value)? changeForYou,
    TResult Function(bool value)? showSearch,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIndex value) changeIndex,
    required TResult Function(ChangeForYou value) changeForYou,
    required TResult Function(ShowSearch value) showSearch,
  }) {
    return changeIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeIndex value)? changeIndex,
    TResult? Function(ChangeForYou value)? changeForYou,
    TResult? Function(ShowSearch value)? showSearch,
  }) {
    return changeIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIndex value)? changeIndex,
    TResult Function(ChangeForYou value)? changeForYou,
    TResult Function(ShowSearch value)? showSearch,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(this);
    }
    return orElse();
  }
}

abstract class ChangeIndex implements MainEvent {
  const factory ChangeIndex({required final int index}) = _$ChangeIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ChangeIndexImplCopyWith<_$ChangeIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeForYouImplCopyWith<$Res> {
  factory _$$ChangeForYouImplCopyWith(
          _$ChangeForYouImpl value, $Res Function(_$ChangeForYouImpl) then) =
      __$$ChangeForYouImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ChangeForYouImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$ChangeForYouImpl>
    implements _$$ChangeForYouImplCopyWith<$Res> {
  __$$ChangeForYouImplCopyWithImpl(
      _$ChangeForYouImpl _value, $Res Function(_$ChangeForYouImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ChangeForYouImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeForYouImpl implements ChangeForYou {
  const _$ChangeForYouImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'MainEvent.changeForYou(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeForYouImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeForYouImplCopyWith<_$ChangeForYouImpl> get copyWith =>
      __$$ChangeForYouImplCopyWithImpl<_$ChangeForYouImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(bool value) changeForYou,
    required TResult Function(bool value) showSearch,
  }) {
    return changeForYou(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(bool value)? changeForYou,
    TResult? Function(bool value)? showSearch,
  }) {
    return changeForYou?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(bool value)? changeForYou,
    TResult Function(bool value)? showSearch,
    required TResult orElse(),
  }) {
    if (changeForYou != null) {
      return changeForYou(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIndex value) changeIndex,
    required TResult Function(ChangeForYou value) changeForYou,
    required TResult Function(ShowSearch value) showSearch,
  }) {
    return changeForYou(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeIndex value)? changeIndex,
    TResult? Function(ChangeForYou value)? changeForYou,
    TResult? Function(ShowSearch value)? showSearch,
  }) {
    return changeForYou?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIndex value)? changeIndex,
    TResult Function(ChangeForYou value)? changeForYou,
    TResult Function(ShowSearch value)? showSearch,
    required TResult orElse(),
  }) {
    if (changeForYou != null) {
      return changeForYou(this);
    }
    return orElse();
  }
}

abstract class ChangeForYou implements MainEvent {
  const factory ChangeForYou({required final bool value}) = _$ChangeForYouImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ChangeForYouImplCopyWith<_$ChangeForYouImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowSearchImplCopyWith<$Res> {
  factory _$$ShowSearchImplCopyWith(
          _$ShowSearchImpl value, $Res Function(_$ShowSearchImpl) then) =
      __$$ShowSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ShowSearchImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$ShowSearchImpl>
    implements _$$ShowSearchImplCopyWith<$Res> {
  __$$ShowSearchImplCopyWithImpl(
      _$ShowSearchImpl _value, $Res Function(_$ShowSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ShowSearchImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShowSearchImpl implements ShowSearch {
  const _$ShowSearchImpl({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'MainEvent.showSearch(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowSearchImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowSearchImplCopyWith<_$ShowSearchImpl> get copyWith =>
      __$$ShowSearchImplCopyWithImpl<_$ShowSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(bool value) changeForYou,
    required TResult Function(bool value) showSearch,
  }) {
    return showSearch(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(bool value)? changeForYou,
    TResult? Function(bool value)? showSearch,
  }) {
    return showSearch?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(bool value)? changeForYou,
    TResult Function(bool value)? showSearch,
    required TResult orElse(),
  }) {
    if (showSearch != null) {
      return showSearch(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeIndex value) changeIndex,
    required TResult Function(ChangeForYou value) changeForYou,
    required TResult Function(ShowSearch value) showSearch,
  }) {
    return showSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeIndex value)? changeIndex,
    TResult? Function(ChangeForYou value)? changeForYou,
    TResult? Function(ShowSearch value)? showSearch,
  }) {
    return showSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeIndex value)? changeIndex,
    TResult Function(ChangeForYou value)? changeForYou,
    TResult Function(ShowSearch value)? showSearch,
    required TResult orElse(),
  }) {
    if (showSearch != null) {
      return showSearch(this);
    }
    return orElse();
  }
}

abstract class ShowSearch implements MainEvent {
  const factory ShowSearch({required final bool value}) = _$ShowSearchImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ShowSearchImplCopyWith<_$ShowSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainState {
  int get selectIndex => throw _privateConstructorUsedError;
  bool get selectForYou => throw _privateConstructorUsedError;
  bool get isShowSearch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({int selectIndex, bool selectForYou, bool isShowSearch});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectIndex = null,
    Object? selectForYou = null,
    Object? isShowSearch = null,
  }) {
    return _then(_value.copyWith(
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectForYou: null == selectForYou
          ? _value.selectForYou
          : selectForYou // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSearch: null == isShowSearch
          ? _value.isShowSearch
          : isShowSearch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectIndex, bool selectForYou, bool isShowSearch});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectIndex = null,
    Object? selectForYou = null,
    Object? isShowSearch = null,
  }) {
    return _then(_$MainStateImpl(
      selectIndex: null == selectIndex
          ? _value.selectIndex
          : selectIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectForYou: null == selectForYou
          ? _value.selectForYou
          : selectForYou // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSearch: null == isShowSearch
          ? _value.isShowSearch
          : isShowSearch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.selectIndex = 0,
      this.selectForYou = true,
      this.isShowSearch = true});

  @override
  @JsonKey()
  final int selectIndex;
  @override
  @JsonKey()
  final bool selectForYou;
  @override
  @JsonKey()
  final bool isShowSearch;

  @override
  String toString() {
    return 'MainState(selectIndex: $selectIndex, selectForYou: $selectForYou, isShowSearch: $isShowSearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.selectIndex, selectIndex) ||
                other.selectIndex == selectIndex) &&
            (identical(other.selectForYou, selectForYou) ||
                other.selectForYou == selectForYou) &&
            (identical(other.isShowSearch, isShowSearch) ||
                other.isShowSearch == isShowSearch));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectIndex, selectForYou, isShowSearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final int selectIndex,
      final bool selectForYou,
      final bool isShowSearch}) = _$MainStateImpl;

  @override
  int get selectIndex;
  @override
  bool get selectForYou;
  @override
  bool get isShowSearch;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
