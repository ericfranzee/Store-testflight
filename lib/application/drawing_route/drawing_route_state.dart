part of 'drawing_route_bloc.dart';


@freezed
class DrawingRouteState with _$DrawingRouteState {
  const factory DrawingRouteState({
    @Default(false) bool isLoading,
    @Default({}) Map<MarkerId, Marker> markers,
    @Default([]) List<LatLng> polylineCoordinates,
  }) = _DrawingRouteState;
}
