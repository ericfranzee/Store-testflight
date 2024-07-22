part of 'map_bloc.dart';

@freezed
abstract class MapEvent with _$MapEvent {
  const factory MapEvent.clearSearchField() = ClearSearchField;

  const factory MapEvent.setQuery(BuildContext context) = SetQuery;
  const factory MapEvent.searchLocations({String? search}) = SearchLocations;
  const factory MapEvent.setMapController(GoogleMapController controller) = SetMapController;

  const factory MapEvent.setChoosing(bool value) = SetChoosing;

  const factory MapEvent.goToLocation({required Place place}) = GoToLocation;

  const factory MapEvent.goToMyLocation({required LatLng location}) = GoToMyLocation;

  const factory MapEvent.findMyLocation(BuildContext context) = FindMyLocation;

  const factory MapEvent.goToTappedLocation(LatLng latLng) = GoToTappedLocation;

  const factory MapEvent.setTitle(String title) = SetTitle;

  const factory MapEvent.setMarker({required Set<Marker> markers}) = SetMarker;

  const factory MapEvent.saveLocalAddress(
      bool? hasBack, {
        required BuildContext context,
        VoidCallback? onBack,
        VoidCallback? onGoMain,
      }) = SaveLocalAddress;

  const factory MapEvent.fetchLocationName(LatLng? latLng) = FetchLocationName;
}
