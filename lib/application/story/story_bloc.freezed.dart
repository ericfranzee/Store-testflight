// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  bool? get isRefresh => throw _privateConstructorUsedError;
  RefreshController? get controller => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStory value) fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStory value)? fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStory value)? fetchStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryEventCopyWith<StoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEventCopyWith<$Res> {
  factory $StoryEventCopyWith(
          StoryEvent value, $Res Function(StoryEvent) then) =
      _$StoryEventCopyWithImpl<$Res, StoryEvent>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class _$StoryEventCopyWithImpl<$Res, $Val extends StoryEvent>
    implements $StoryEventCopyWith<$Res> {
  _$StoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchStoryImplCopyWith<$Res>
    implements $StoryEventCopyWith<$Res> {
  factory _$$FetchStoryImplCopyWith(
          _$FetchStoryImpl value, $Res Function(_$FetchStoryImpl) then) =
      __$$FetchStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchStoryImplCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$FetchStoryImpl>
    implements _$$FetchStoryImplCopyWith<$Res> {
  __$$FetchStoryImplCopyWithImpl(
      _$FetchStoryImpl _value, $Res Function(_$FetchStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchStoryImpl(
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

class _$FetchStoryImpl implements FetchStory {
  const _$FetchStoryImpl(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'StoryEvent.fetchStory(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStoryImpl &&
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
  _$$FetchStoryImplCopyWith<_$FetchStoryImpl> get copyWith =>
      __$$FetchStoryImplCopyWithImpl<_$FetchStoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchStory,
  }) {
    return fetchStory(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchStory,
  }) {
    return fetchStory?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchStory,
    required TResult orElse(),
  }) {
    if (fetchStory != null) {
      return fetchStory(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStory value) fetchStory,
  }) {
    return fetchStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStory value)? fetchStory,
  }) {
    return fetchStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStory value)? fetchStory,
    required TResult orElse(),
  }) {
    if (fetchStory != null) {
      return fetchStory(this);
    }
    return orElse();
  }
}

abstract class FetchStory implements StoryEvent {
  const factory FetchStory(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchStoryImpl;

  @override
  BuildContext get context;
  @override
  bool? get isRefresh;
  @override
  RefreshController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$FetchStoryImplCopyWith<_$FetchStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StoryState {
  List<List<StoryModel?>?> get story => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStateCopyWith<StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res, StoryState>;
  @useResult
  $Res call({List<List<StoryModel?>?> story, bool isLoading});
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res, $Val extends StoryState>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as List<List<StoryModel?>?>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryStateImplCopyWith<$Res>
    implements $StoryStateCopyWith<$Res> {
  factory _$$StoryStateImplCopyWith(
          _$StoryStateImpl value, $Res Function(_$StoryStateImpl) then) =
      __$$StoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<StoryModel?>?> story, bool isLoading});
}

/// @nodoc
class __$$StoryStateImplCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$StoryStateImpl>
    implements _$$StoryStateImplCopyWith<$Res> {
  __$$StoryStateImplCopyWithImpl(
      _$StoryStateImpl _value, $Res Function(_$StoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
    Object? isLoading = null,
  }) {
    return _then(_$StoryStateImpl(
      story: null == story
          ? _value._story
          : story // ignore: cast_nullable_to_non_nullable
              as List<List<StoryModel?>?>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StoryStateImpl implements _StoryState {
  const _$StoryStateImpl(
      {final List<List<StoryModel?>?> story = const [], this.isLoading = true})
      : _story = story;

  final List<List<StoryModel?>?> _story;
  @override
  @JsonKey()
  List<List<StoryModel?>?> get story {
    if (_story is EqualUnmodifiableListView) return _story;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_story);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'StoryState(story: $story, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryStateImpl &&
            const DeepCollectionEquality().equals(other._story, _story) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_story), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryStateImplCopyWith<_$StoryStateImpl> get copyWith =>
      __$$StoryStateImplCopyWithImpl<_$StoryStateImpl>(this, _$identity);
}

abstract class _StoryState implements StoryState {
  const factory _StoryState(
      {final List<List<StoryModel?>?> story,
      final bool isLoading}) = _$StoryStateImpl;

  @override
  List<List<StoryModel?>?> get story;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$StoryStateImplCopyWith<_$StoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
