// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawing_route_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawingRouteEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  OrderShops? get order => throw _privateConstructorUsedError;
  ParcelOrder? get parcel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)
        getRoutingAll,
    required TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)
        setMarkers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult? Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRoutingAll value) getRoutingAll,
    required TResult Function(SetMarkers value) setMarkers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRoutingAll value)? getRoutingAll,
    TResult? Function(SetMarkers value)? setMarkers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRoutingAll value)? getRoutingAll,
    TResult Function(SetMarkers value)? setMarkers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawingRouteEventCopyWith<DrawingRouteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingRouteEventCopyWith<$Res> {
  factory $DrawingRouteEventCopyWith(
          DrawingRouteEvent value, $Res Function(DrawingRouteEvent) then) =
      _$DrawingRouteEventCopyWithImpl<$Res, DrawingRouteEvent>;
  @useResult
  $Res call({BuildContext context, OrderShops? order, ParcelOrder? parcel});
}

/// @nodoc
class _$DrawingRouteEventCopyWithImpl<$Res, $Val extends DrawingRouteEvent>
    implements $DrawingRouteEventCopyWith<$Res> {
  _$DrawingRouteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? order = freezed,
    Object? parcel = freezed,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderShops?,
      parcel: freezed == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as ParcelOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetRoutingAllImplCopyWith<$Res>
    implements $DrawingRouteEventCopyWith<$Res> {
  factory _$$GetRoutingAllImplCopyWith(
          _$GetRoutingAllImpl value, $Res Function(_$GetRoutingAllImpl) then) =
      __$$GetRoutingAllImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context, OrderShops? order, ParcelOrder? parcel});
}

/// @nodoc
class __$$GetRoutingAllImplCopyWithImpl<$Res>
    extends _$DrawingRouteEventCopyWithImpl<$Res, _$GetRoutingAllImpl>
    implements _$$GetRoutingAllImplCopyWith<$Res> {
  __$$GetRoutingAllImplCopyWithImpl(
      _$GetRoutingAllImpl _value, $Res Function(_$GetRoutingAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? order = freezed,
    Object? parcel = freezed,
  }) {
    return _then(_$GetRoutingAllImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderShops?,
      parcel: freezed == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as ParcelOrder?,
    ));
  }
}

/// @nodoc

class _$GetRoutingAllImpl implements GetRoutingAll {
  const _$GetRoutingAllImpl({required this.context, this.order, this.parcel});

  @override
  final BuildContext context;
  @override
  final OrderShops? order;
  @override
  final ParcelOrder? parcel;

  @override
  String toString() {
    return 'DrawingRouteEvent.getRoutingAll(context: $context, order: $order, parcel: $parcel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRoutingAllImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.parcel, parcel) || other.parcel == parcel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, order, parcel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRoutingAllImplCopyWith<_$GetRoutingAllImpl> get copyWith =>
      __$$GetRoutingAllImplCopyWithImpl<_$GetRoutingAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)
        getRoutingAll,
    required TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)
        setMarkers,
  }) {
    return getRoutingAll(context, order, parcel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult? Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
  }) {
    return getRoutingAll?.call(context, order, parcel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
    required TResult orElse(),
  }) {
    if (getRoutingAll != null) {
      return getRoutingAll(context, order, parcel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRoutingAll value) getRoutingAll,
    required TResult Function(SetMarkers value) setMarkers,
  }) {
    return getRoutingAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRoutingAll value)? getRoutingAll,
    TResult? Function(SetMarkers value)? setMarkers,
  }) {
    return getRoutingAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRoutingAll value)? getRoutingAll,
    TResult Function(SetMarkers value)? setMarkers,
    required TResult orElse(),
  }) {
    if (getRoutingAll != null) {
      return getRoutingAll(this);
    }
    return orElse();
  }
}

abstract class GetRoutingAll implements DrawingRouteEvent {
  const factory GetRoutingAll(
      {required final BuildContext context,
      final OrderShops? order,
      final ParcelOrder? parcel}) = _$GetRoutingAllImpl;

  @override
  BuildContext get context;
  @override
  OrderShops? get order;
  @override
  ParcelOrder? get parcel;
  @override
  @JsonKey(ignore: true)
  _$$GetRoutingAllImplCopyWith<_$GetRoutingAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMarkersImplCopyWith<$Res>
    implements $DrawingRouteEventCopyWith<$Res> {
  factory _$$SetMarkersImplCopyWith(
          _$SetMarkersImpl value, $Res Function(_$SetMarkersImpl) then) =
      __$$SetMarkersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildContext context,
      CustomColorSet colors,
      OrderShops? order,
      ParcelOrder? parcel});
}

/// @nodoc
class __$$SetMarkersImplCopyWithImpl<$Res>
    extends _$DrawingRouteEventCopyWithImpl<$Res, _$SetMarkersImpl>
    implements _$$SetMarkersImplCopyWith<$Res> {
  __$$SetMarkersImplCopyWithImpl(
      _$SetMarkersImpl _value, $Res Function(_$SetMarkersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? colors = null,
    Object? order = freezed,
    Object? parcel = freezed,
  }) {
    return _then(_$SetMarkersImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as CustomColorSet,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderShops?,
      parcel: freezed == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as ParcelOrder?,
    ));
  }
}

/// @nodoc

class _$SetMarkersImpl implements SetMarkers {
  const _$SetMarkersImpl(
      {required this.context, required this.colors, this.order, this.parcel});

  @override
  final BuildContext context;
  @override
  final CustomColorSet colors;
  @override
  final OrderShops? order;
  @override
  final ParcelOrder? parcel;

  @override
  String toString() {
    return 'DrawingRouteEvent.setMarkers(context: $context, colors: $colors, order: $order, parcel: $parcel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMarkersImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.parcel, parcel) || other.parcel == parcel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, colors, order, parcel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMarkersImplCopyWith<_$SetMarkersImpl> get copyWith =>
      __$$SetMarkersImplCopyWithImpl<_$SetMarkersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)
        getRoutingAll,
    required TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)
        setMarkers,
  }) {
    return setMarkers(context, colors, order, parcel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult? Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
  }) {
    return setMarkers?.call(context, colors, order, parcel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BuildContext context, OrderShops? order, ParcelOrder? parcel)?
        getRoutingAll,
    TResult Function(BuildContext context, CustomColorSet colors,
            OrderShops? order, ParcelOrder? parcel)?
        setMarkers,
    required TResult orElse(),
  }) {
    if (setMarkers != null) {
      return setMarkers(context, colors, order, parcel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRoutingAll value) getRoutingAll,
    required TResult Function(SetMarkers value) setMarkers,
  }) {
    return setMarkers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRoutingAll value)? getRoutingAll,
    TResult? Function(SetMarkers value)? setMarkers,
  }) {
    return setMarkers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRoutingAll value)? getRoutingAll,
    TResult Function(SetMarkers value)? setMarkers,
    required TResult orElse(),
  }) {
    if (setMarkers != null) {
      return setMarkers(this);
    }
    return orElse();
  }
}

abstract class SetMarkers implements DrawingRouteEvent {
  const factory SetMarkers(
      {required final BuildContext context,
      required final CustomColorSet colors,
      final OrderShops? order,
      final ParcelOrder? parcel}) = _$SetMarkersImpl;

  @override
  BuildContext get context;
  CustomColorSet get colors;
  @override
  OrderShops? get order;
  @override
  ParcelOrder? get parcel;
  @override
  @JsonKey(ignore: true)
  _$$SetMarkersImplCopyWith<_$SetMarkersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DrawingRouteState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<MarkerId, Marker> get markers => throw _privateConstructorUsedError;
  List<LatLng> get polylineCoordinates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawingRouteStateCopyWith<DrawingRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingRouteStateCopyWith<$Res> {
  factory $DrawingRouteStateCopyWith(
          DrawingRouteState value, $Res Function(DrawingRouteState) then) =
      _$DrawingRouteStateCopyWithImpl<$Res, DrawingRouteState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<MarkerId, Marker> markers,
      List<LatLng> polylineCoordinates});
}

/// @nodoc
class _$DrawingRouteStateCopyWithImpl<$Res, $Val extends DrawingRouteState>
    implements $DrawingRouteStateCopyWith<$Res> {
  _$DrawingRouteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? markers = null,
    Object? polylineCoordinates = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      polylineCoordinates: null == polylineCoordinates
          ? _value.polylineCoordinates
          : polylineCoordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrawingRouteStateImplCopyWith<$Res>
    implements $DrawingRouteStateCopyWith<$Res> {
  factory _$$DrawingRouteStateImplCopyWith(_$DrawingRouteStateImpl value,
          $Res Function(_$DrawingRouteStateImpl) then) =
      __$$DrawingRouteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<MarkerId, Marker> markers,
      List<LatLng> polylineCoordinates});
}

/// @nodoc
class __$$DrawingRouteStateImplCopyWithImpl<$Res>
    extends _$DrawingRouteStateCopyWithImpl<$Res, _$DrawingRouteStateImpl>
    implements _$$DrawingRouteStateImplCopyWith<$Res> {
  __$$DrawingRouteStateImplCopyWithImpl(_$DrawingRouteStateImpl _value,
      $Res Function(_$DrawingRouteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? markers = null,
    Object? polylineCoordinates = null,
  }) {
    return _then(_$DrawingRouteStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      polylineCoordinates: null == polylineCoordinates
          ? _value._polylineCoordinates
          : polylineCoordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc

class _$DrawingRouteStateImpl implements _DrawingRouteState {
  const _$DrawingRouteStateImpl(
      {this.isLoading = false,
      final Map<MarkerId, Marker> markers = const {},
      final List<LatLng> polylineCoordinates = const []})
      : _markers = markers,
        _polylineCoordinates = polylineCoordinates;

  @override
  @JsonKey()
  final bool isLoading;
  final Map<MarkerId, Marker> _markers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get markers {
    if (_markers is EqualUnmodifiableMapView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_markers);
  }

  final List<LatLng> _polylineCoordinates;
  @override
  @JsonKey()
  List<LatLng> get polylineCoordinates {
    if (_polylineCoordinates is EqualUnmodifiableListView)
      return _polylineCoordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylineCoordinates);
  }

  @override
  String toString() {
    return 'DrawingRouteState(isLoading: $isLoading, markers: $markers, polylineCoordinates: $polylineCoordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawingRouteStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylineCoordinates, _polylineCoordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylineCoordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawingRouteStateImplCopyWith<_$DrawingRouteStateImpl> get copyWith =>
      __$$DrawingRouteStateImplCopyWithImpl<_$DrawingRouteStateImpl>(
          this, _$identity);
}

abstract class _DrawingRouteState implements DrawingRouteState {
  const factory _DrawingRouteState(
      {final bool isLoading,
      final Map<MarkerId, Marker> markers,
      final List<LatLng> polylineCoordinates}) = _$DrawingRouteStateImpl;

  @override
  bool get isLoading;
  @override
  Map<MarkerId, Marker> get markers;
  @override
  List<LatLng> get polylineCoordinates;
  @override
  @JsonKey(ignore: true)
  _$$DrawingRouteStateImplCopyWith<_$DrawingRouteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
