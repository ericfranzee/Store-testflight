// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    Timer? timer;
    dynamic check;
    late LatLng latLng;

    on<SetQuery>((event, emit) {
      if (state.textController?.text.trim().isNotEmpty ?? false) {
        if (timer?.isActive ?? false) {
          timer?.cancel();
        }
        timer = Timer(
          const Duration(milliseconds: 500),
          () {
            event.context.read<MapBloc>().add(const MapEvent.searchLocations());
          },
        );
      }
    });

    on<SearchLocations>((event, emit) async {
      emit(state.copyWith(isSearching: true, isSearchLoading: true));
      try {
        final result = await Nominatim.searchByName(
          query:
              event.search?.trim() ?? state.textController?.text.trim() ?? '',
          limit: 5,
          addressDetails: true,
          extraTags: true,
          nameDetails: true,
        );
        emit(state.copyWith(searchedPlaces: result, isSearchLoading: false));
      } catch (e) {
        debugPrint('===> search location error $e');
        emit(state.copyWith(isSearchLoading: false));
      }
    });

    on<SetMapController>((event, emit) {
      emit(state.copyWith(mapController: event.controller));
    });

    on<SetChoosing>((event, emit) {
      emit(state.copyWith(isChoosing: event.value, isSearching: false));
    });

    on<GoToLocation>((event, emit) {
      emit(state.copyWith(
          location: LatLng(event.place.lat, event.place.lon),
          isSearching: false,
          textController: TextEditingController(text: event.place.displayName),
          mapController: state.mapController
            ?..animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 0,
                  target: LatLng(event.place.lat, event.place.lon),
                  tilt: 0,
                  zoom: 17,
                ),
              ),
            )));
    });

    on<GoToMyLocation>((event, emit) async {
      emit(state.copyWith(searchedPlaces: [], isSearching: false));
      Place? place;
      try {
        place = await Nominatim.reverseSearch(
          lat: event.location.latitude,
          lon: event.location.longitude,
          addressDetails: true,
          extraTags: true,
          nameDetails: true,
        );
        emit(state.copyWith(
            textController: TextEditingController(text: place.displayName)));
      } catch (e) {
        emit(state.copyWith(textController: TextEditingController(text: "")));
      }
      if (place != null) {
        emit(state.copyWith(
            location: LatLng(place.lat, place.lon),
            mapController: state.mapController
              ?..animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    bearing: 0,
                    target: LatLng(place.lat, place.lon),
                    tilt: 0,
                    zoom: 17,
                  ),
                ),
              )));
      }
    });

    on<FindMyLocation>((event, emit) async {
      if (check == LocationPermission.denied ||
          check == LocationPermission.deniedForever) {
        check = await Geolocator.requestPermission();
        if (check != LocationPermission.denied &&
            check != LocationPermission.deniedForever) {
          var loc = await Geolocator.getCurrentPosition();
          latLng = LatLng(loc.latitude, loc.longitude);
          emit(state.copyWith(
              mapController: state.mapController
                ?..animateCamera(CameraUpdate.newLatLngZoom(latLng, 15))));
        }
      } else {
        if (check != LocationPermission.deniedForever) {
          var loc = await Geolocator.getCurrentPosition();
          latLng = LatLng(loc.latitude, loc.longitude);
          emit(state.copyWith(
              mapController: state.mapController
                ?..animateCamera(CameraUpdate.newLatLngZoom(latLng, 15))));
        }
      }
    });

    on<GoToTappedLocation>((event, emit) async {
      emit(state.copyWith(searchedPlaces: [], isSearching: false));
      Place? place;
      try {
        place = await Nominatim.reverseSearch(
          lat: event.latLng.latitude,
          lon: event.latLng.longitude,
          addressDetails: true,
          extraTags: true,
          nameDetails: true,
        );
        emit(state.copyWith(
            textController: TextEditingController(text: place.displayName)));
      } catch (e) {
        emit(state.copyWith(textController: TextEditingController(text: "")));
      }

      emit(state.copyWith(
          location: LatLng(event.latLng.latitude, event.latLng.longitude),
          mapController: state.mapController
            ?..animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 0,
                  target: event.latLng,
                  tilt: 0,
                  zoom: 17,
                ),
              ),
            )));
    });

    on<SetTitle>((event, emit) {
      emit(state.copyWith(title: event.title));
    });



    on<SetMarker>((event, emit)  {
      Set<Marker> markers = Set.from(state.markers);
      markers.addAll(event.markers);
      emit(state.copyWith(markers: markers,));
    });

    on<ClearSearchField>((event, emit) {
      emit(state.copyWith(
          searchedPlaces: [],
          isSearching: false,
          textController: TextEditingController()));
    });

    on<SaveLocalAddress>((event, emit) {
      event.context.read<MapBloc>().add(const MapEvent.clearSearchField());
      emit(state.copyWith(mapController: state.mapController?..dispose()));
    });

    on<FetchLocationName>((event, emit) async {
      emit(state.copyWith(location: event.latLng));
      Place? place;
      try {
        place = await Nominatim.reverseSearch(
            lat: event.latLng?.latitude,
            lon: event.latLng?.longitude,
            addressDetails: true,
            extraTags: true,
            nameDetails: true,
            language: "en");
        emit(state.copyWith(
            textController: TextEditingController(text: place.displayName)));
      } catch (e) {
        emit(state.copyWith(textController: TextEditingController(text: "")));
      }
    });
  }
}
