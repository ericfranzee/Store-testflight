part of 'drawing_route_bloc.dart';

@freezed
abstract class DrawingRouteEvent with _$DrawingRouteEvent {

  const factory DrawingRouteEvent.getRoutingAll({
    required BuildContext context,
    OrderShops? order,
    ParcelOrder? parcel,
  }) = GetRoutingAll;

  const factory DrawingRouteEvent.setMarkers({
    required BuildContext context,
    required CustomColorSet colors,
    OrderShops? order,
     ParcelOrder? parcel,
  }) = SetMarkers;
}
