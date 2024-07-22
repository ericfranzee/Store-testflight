// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, List<int>? serviceMasterIds)
        fetchForms,
    required TResult Function(
            BuildContext context, int? id, FormOptionsData? form)
        fetchSingleForms,
    required TResult Function(
            BuildContext context, FormOptionsData? formOptions)
        setFormOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult? Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult? Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForms value) fetchForms,
    required TResult Function(FetchSingleForms value) fetchSingleForms,
    required TResult Function(SetFormOption value) setFormOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForms value)? fetchForms,
    TResult? Function(FetchSingleForms value)? fetchSingleForms,
    TResult? Function(SetFormOption value)? setFormOption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForms value)? fetchForms,
    TResult Function(FetchSingleForms value)? fetchSingleForms,
    TResult Function(SetFormOption value)? setFormOption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormEventCopyWith<FormEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormEventCopyWith<$Res> {
  factory $FormEventCopyWith(FormEvent value, $Res Function(FormEvent) then) =
      _$FormEventCopyWithImpl<$Res, FormEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$FormEventCopyWithImpl<$Res, $Val extends FormEvent>
    implements $FormEventCopyWith<$Res> {
  _$FormEventCopyWithImpl(this._value, this._then);

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
abstract class _$$FetchFormsImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$FetchFormsImplCopyWith(
          _$FetchFormsImpl value, $Res Function(_$FetchFormsImpl) then) =
      __$$FetchFormsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, List<int>? serviceMasterIds});
}

/// @nodoc
class __$$FetchFormsImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$FetchFormsImpl>
    implements _$$FetchFormsImplCopyWith<$Res> {
  __$$FetchFormsImplCopyWithImpl(
      _$FetchFormsImpl _value, $Res Function(_$FetchFormsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? serviceMasterIds = freezed,
  }) {
    return _then(_$FetchFormsImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      serviceMasterIds: freezed == serviceMasterIds
          ? _value._serviceMasterIds
          : serviceMasterIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$FetchFormsImpl implements FetchForms {
  const _$FetchFormsImpl(
      {required this.context, required final List<int>? serviceMasterIds})
      : _serviceMasterIds = serviceMasterIds;

  @override
  final BuildContext context;
  final List<int>? _serviceMasterIds;
  @override
  List<int>? get serviceMasterIds {
    final value = _serviceMasterIds;
    if (value == null) return null;
    if (_serviceMasterIds is EqualUnmodifiableListView)
      return _serviceMasterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FormEvent.fetchForms(context: $context, serviceMasterIds: $serviceMasterIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFormsImpl &&
            (identical(other.context, context) || other.context == context) &&
            const DeepCollectionEquality()
                .equals(other._serviceMasterIds, _serviceMasterIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context,
      const DeepCollectionEquality().hash(_serviceMasterIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFormsImplCopyWith<_$FetchFormsImpl> get copyWith =>
      __$$FetchFormsImplCopyWithImpl<_$FetchFormsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, List<int>? serviceMasterIds)
        fetchForms,
    required TResult Function(
            BuildContext context, int? id, FormOptionsData? form)
        fetchSingleForms,
    required TResult Function(
            BuildContext context, FormOptionsData? formOptions)
        setFormOption,
  }) {
    return fetchForms(context, serviceMasterIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult? Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult? Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
  }) {
    return fetchForms?.call(context, serviceMasterIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
    required TResult orElse(),
  }) {
    if (fetchForms != null) {
      return fetchForms(context, serviceMasterIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForms value) fetchForms,
    required TResult Function(FetchSingleForms value) fetchSingleForms,
    required TResult Function(SetFormOption value) setFormOption,
  }) {
    return fetchForms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForms value)? fetchForms,
    TResult? Function(FetchSingleForms value)? fetchSingleForms,
    TResult? Function(SetFormOption value)? setFormOption,
  }) {
    return fetchForms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForms value)? fetchForms,
    TResult Function(FetchSingleForms value)? fetchSingleForms,
    TResult Function(SetFormOption value)? setFormOption,
    required TResult orElse(),
  }) {
    if (fetchForms != null) {
      return fetchForms(this);
    }
    return orElse();
  }
}

abstract class FetchForms implements FormEvent {
  const factory FetchForms(
      {required final BuildContext context,
      required final List<int>? serviceMasterIds}) = _$FetchFormsImpl;

  @override
  BuildContext get context;
  List<int>? get serviceMasterIds;
  @override
  @JsonKey(ignore: true)
  _$$FetchFormsImplCopyWith<_$FetchFormsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchSingleFormsImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$FetchSingleFormsImplCopyWith(_$FetchSingleFormsImpl value,
          $Res Function(_$FetchSingleFormsImpl) then) =
      __$$FetchSingleFormsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, int? id, FormOptionsData? form});
}

/// @nodoc
class __$$FetchSingleFormsImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$FetchSingleFormsImpl>
    implements _$$FetchSingleFormsImplCopyWith<$Res> {
  __$$FetchSingleFormsImplCopyWithImpl(_$FetchSingleFormsImpl _value,
      $Res Function(_$FetchSingleFormsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = freezed,
    Object? form = freezed,
  }) {
    return _then(_$FetchSingleFormsImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      form: freezed == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
    ));
  }
}

/// @nodoc

class _$FetchSingleFormsImpl implements FetchSingleForms {
  const _$FetchSingleFormsImpl(
      {required this.context, required this.id, this.form});

  @override
  final BuildContext context;
  @override
  final int? id;
  @override
  final FormOptionsData? form;

  @override
  String toString() {
    return 'FormEvent.fetchSingleForms(context: $context, id: $id, form: $form)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSingleFormsImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSingleFormsImplCopyWith<_$FetchSingleFormsImpl> get copyWith =>
      __$$FetchSingleFormsImplCopyWithImpl<_$FetchSingleFormsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, List<int>? serviceMasterIds)
        fetchForms,
    required TResult Function(
            BuildContext context, int? id, FormOptionsData? form)
        fetchSingleForms,
    required TResult Function(
            BuildContext context, FormOptionsData? formOptions)
        setFormOption,
  }) {
    return fetchSingleForms(context, id, form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult? Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult? Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
  }) {
    return fetchSingleForms?.call(context, id, form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
    required TResult orElse(),
  }) {
    if (fetchSingleForms != null) {
      return fetchSingleForms(context, id, form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForms value) fetchForms,
    required TResult Function(FetchSingleForms value) fetchSingleForms,
    required TResult Function(SetFormOption value) setFormOption,
  }) {
    return fetchSingleForms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForms value)? fetchForms,
    TResult? Function(FetchSingleForms value)? fetchSingleForms,
    TResult? Function(SetFormOption value)? setFormOption,
  }) {
    return fetchSingleForms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForms value)? fetchForms,
    TResult Function(FetchSingleForms value)? fetchSingleForms,
    TResult Function(SetFormOption value)? setFormOption,
    required TResult orElse(),
  }) {
    if (fetchSingleForms != null) {
      return fetchSingleForms(this);
    }
    return orElse();
  }
}

abstract class FetchSingleForms implements FormEvent {
  const factory FetchSingleForms(
      {required final BuildContext context,
      required final int? id,
      final FormOptionsData? form}) = _$FetchSingleFormsImpl;

  @override
  BuildContext get context;
  int? get id;
  FormOptionsData? get form;
  @override
  @JsonKey(ignore: true)
  _$$FetchSingleFormsImplCopyWith<_$FetchSingleFormsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFormOptionImplCopyWith<$Res>
    implements $FormEventCopyWith<$Res> {
  factory _$$SetFormOptionImplCopyWith(
          _$SetFormOptionImpl value, $Res Function(_$SetFormOptionImpl) then) =
      __$$SetFormOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, FormOptionsData? formOptions});
}

/// @nodoc
class __$$SetFormOptionImplCopyWithImpl<$Res>
    extends _$FormEventCopyWithImpl<$Res, _$SetFormOptionImpl>
    implements _$$SetFormOptionImplCopyWith<$Res> {
  __$$SetFormOptionImplCopyWithImpl(
      _$SetFormOptionImpl _value, $Res Function(_$SetFormOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? formOptions = freezed,
  }) {
    return _then(_$SetFormOptionImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      formOptions: freezed == formOptions
          ? _value.formOptions
          : formOptions // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
    ));
  }
}

/// @nodoc

class _$SetFormOptionImpl implements SetFormOption {
  const _$SetFormOptionImpl({required this.context, required this.formOptions});

  @override
  final BuildContext context;
  @override
  final FormOptionsData? formOptions;

  @override
  String toString() {
    return 'FormEvent.setFormOption(context: $context, formOptions: $formOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFormOptionImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.formOptions, formOptions) ||
                other.formOptions == formOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, formOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFormOptionImplCopyWith<_$SetFormOptionImpl> get copyWith =>
      __$$SetFormOptionImplCopyWithImpl<_$SetFormOptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, List<int>? serviceMasterIds)
        fetchForms,
    required TResult Function(
            BuildContext context, int? id, FormOptionsData? form)
        fetchSingleForms,
    required TResult Function(
            BuildContext context, FormOptionsData? formOptions)
        setFormOption,
  }) {
    return setFormOption(context, formOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult? Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult? Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
  }) {
    return setFormOption?.call(context, formOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, List<int>? serviceMasterIds)?
        fetchForms,
    TResult Function(BuildContext context, int? id, FormOptionsData? form)?
        fetchSingleForms,
    TResult Function(BuildContext context, FormOptionsData? formOptions)?
        setFormOption,
    required TResult orElse(),
  }) {
    if (setFormOption != null) {
      return setFormOption(context, formOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchForms value) fetchForms,
    required TResult Function(FetchSingleForms value) fetchSingleForms,
    required TResult Function(SetFormOption value) setFormOption,
  }) {
    return setFormOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchForms value)? fetchForms,
    TResult? Function(FetchSingleForms value)? fetchSingleForms,
    TResult? Function(SetFormOption value)? setFormOption,
  }) {
    return setFormOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchForms value)? fetchForms,
    TResult Function(FetchSingleForms value)? fetchSingleForms,
    TResult Function(SetFormOption value)? setFormOption,
    required TResult orElse(),
  }) {
    if (setFormOption != null) {
      return setFormOption(this);
    }
    return orElse();
  }
}

abstract class SetFormOption implements FormEvent {
  const factory SetFormOption(
      {required final BuildContext context,
      required final FormOptionsData? formOptions}) = _$SetFormOptionImpl;

  @override
  BuildContext get context;
  FormOptionsData? get formOptions;
  @override
  @JsonKey(ignore: true)
  _$$SetFormOptionImplCopyWith<_$SetFormOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormOptionsState {
  List<FormOptionsData> get formOptionList =>
      throw _privateConstructorUsedError;
  FormOptionsData? get formOptions => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormOptionsStateCopyWith<FormOptionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormOptionsStateCopyWith<$Res> {
  factory $FormOptionsStateCopyWith(
          FormOptionsState value, $Res Function(FormOptionsState) then) =
      _$FormOptionsStateCopyWithImpl<$Res, FormOptionsState>;
  @useResult
  $Res call(
      {List<FormOptionsData> formOptionList,
      FormOptionsData? formOptions,
      bool isLoading});
}

/// @nodoc
class _$FormOptionsStateCopyWithImpl<$Res, $Val extends FormOptionsState>
    implements $FormOptionsStateCopyWith<$Res> {
  _$FormOptionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formOptionList = null,
    Object? formOptions = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      formOptionList: null == formOptionList
          ? _value.formOptionList
          : formOptionList // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
      formOptions: freezed == formOptions
          ? _value.formOptions
          : formOptions // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormOptionsStateImplCopyWith<$Res>
    implements $FormOptionsStateCopyWith<$Res> {
  factory _$$FormOptionsStateImplCopyWith(_$FormOptionsStateImpl value,
          $Res Function(_$FormOptionsStateImpl) then) =
      __$$FormOptionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FormOptionsData> formOptionList,
      FormOptionsData? formOptions,
      bool isLoading});
}

/// @nodoc
class __$$FormOptionsStateImplCopyWithImpl<$Res>
    extends _$FormOptionsStateCopyWithImpl<$Res, _$FormOptionsStateImpl>
    implements _$$FormOptionsStateImplCopyWith<$Res> {
  __$$FormOptionsStateImplCopyWithImpl(_$FormOptionsStateImpl _value,
      $Res Function(_$FormOptionsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formOptionList = null,
    Object? formOptions = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$FormOptionsStateImpl(
      formOptionList: null == formOptionList
          ? _value._formOptionList
          : formOptionList // ignore: cast_nullable_to_non_nullable
              as List<FormOptionsData>,
      formOptions: freezed == formOptions
          ? _value.formOptions
          : formOptions // ignore: cast_nullable_to_non_nullable
              as FormOptionsData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormOptionsStateImpl implements _FormOptionsState {
  const _$FormOptionsStateImpl(
      {final List<FormOptionsData> formOptionList = const [],
      this.formOptions = null,
      this.isLoading = true})
      : _formOptionList = formOptionList;

  final List<FormOptionsData> _formOptionList;
  @override
  @JsonKey()
  List<FormOptionsData> get formOptionList {
    if (_formOptionList is EqualUnmodifiableListView) return _formOptionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formOptionList);
  }

  @override
  @JsonKey()
  final FormOptionsData? formOptions;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'FormOptionsState(formOptionList: $formOptionList, formOptions: $formOptions, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormOptionsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._formOptionList, _formOptionList) &&
            (identical(other.formOptions, formOptions) ||
                other.formOptions == formOptions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_formOptionList),
      formOptions,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormOptionsStateImplCopyWith<_$FormOptionsStateImpl> get copyWith =>
      __$$FormOptionsStateImplCopyWithImpl<_$FormOptionsStateImpl>(
          this, _$identity);
}

abstract class _FormOptionsState implements FormOptionsState {
  const factory _FormOptionsState(
      {final List<FormOptionsData> formOptionList,
      final FormOptionsData? formOptions,
      final bool isLoading}) = _$FormOptionsStateImpl;

  @override
  List<FormOptionsData> get formOptionList;
  @override
  FormOptionsData? get formOptions;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$FormOptionsStateImplCopyWith<_$FormOptionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
