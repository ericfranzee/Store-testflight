part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isChoosing,
    @Default([]) List<Place> searchedPlaces,
    @Default({}) Set<Marker> markers,
    @Default('') String title,
    TextEditingController? textController,
    GoogleMapController? mapController,
    LatLng? location,
  }) = _MapState;
}
