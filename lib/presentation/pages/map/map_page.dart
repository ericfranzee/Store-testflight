import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:lottie/lottie.dart' as lottie;

import 'widgets/main_list_shimmer.dart';
import 'widgets/my_location_button.dart';
import 'widgets/searched_location_item.dart';

class MapPage extends StatefulWidget {
  final LocationModel? location;

  const MapPage({super.key, this.location});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  CameraPosition? _cameraPosition;
  LocationPermission? check;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getMyLocation() async {
    check = await Geolocator.checkPermission();
    if (check == LocationPermission.denied ||
        check == LocationPermission.deniedForever) {
      check = await Geolocator.requestPermission();
      if (check != LocationPermission.denied &&
          check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        final latLng = LatLng(loc.latitude, loc.longitude);
        if (mounted) {
          context.read<MapBloc>().add(MapEvent.goToTappedLocation(latLng));
        }
      }
    } else {
      if (check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        final latLng = LatLng(loc.latitude, loc.longitude);
        if (mounted) {
          context.read<MapBloc>().add(MapEvent.goToTappedLocation(latLng));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: (colors) => BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    GoogleMap(
                      tiltGesturesEnabled: false,
                      myLocationButtonEnabled: false,
                      onTap: (location) {
                        context
                            .read<MapBloc>()
                            .add(MapEvent.goToMyLocation(location: location));
                      },
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        bearing: 0,
                        target: widget.location == null
                            ? LatLng(
                                AppHelper.getInitialLatitude(),
                                AppHelper.getInitialLongitude(),
                              )
                            : LatLng(
                                double.tryParse(
                                        widget.location?.latitude ?? "0") ??
                                    AppHelper.getInitialLatitude(),
                                double.tryParse(
                                        widget.location?.longitude ?? "0") ??
                                    AppHelper.getInitialLongitude(),
                              ),
                        tilt: 0,
                        zoom: 17,
                      ),
                      onMapCreated: (controller) {
                        context
                            .read<MapBloc>()
                            .add(MapEvent.setMapController(controller));
                      },
                      onCameraMoveStarted: () {
                        _animationController.repeat(
                          min: AppConstants.pinLoadingMin,
                          max: AppConstants.pinLoadingMax,
                          period: _animationController.duration! *
                              (AppConstants.pinLoadingMax -
                                  AppConstants.pinLoadingMin),
                        );
                        context
                            .read<MapBloc>()
                            .add(const MapEvent.setChoosing(true));
                      },
                      onCameraIdle: () {
                        context.read<MapBloc>().add(MapEvent.fetchLocationName(
                              _cameraPosition?.target ??
                                  (widget.location == null
                                      ? LatLng(
                                          AppHelper.getInitialLatitude(),
                                          AppHelper.getInitialLongitude(),
                                        )
                                      : LatLng(
                                          double.tryParse(
                                                  widget.location?.latitude ??
                                                      "0") ??
                                              AppHelper.getInitialLatitude(),
                                          double.tryParse(
                                                  widget.location?.longitude ??
                                                      "0") ??
                                              AppHelper.getInitialLongitude(),
                                        )),
                            ));

                        _animationController.forward(
                          from: AppConstants.pinLoadingMax,
                        );

                        context
                            .read<MapBloc>()
                            .add(const MapEvent.setChoosing(false));
                      },
                      onCameraMove: (cameraPosition) {
                        _cameraPosition = cameraPosition;
                      },
                    ),
                    IgnorePointer(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 78.0,
                          ),
                          child: lottie.Lottie.asset(
                            "assets/lottie/pin.json",
                            onLoaded: (composition) {
                              _animationController.duration =
                                  composition.duration;
                            },
                            controller: _animationController,
                            width: 250,
                            height: 250,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        53.verticalSpace,
                        Row(
                          children: [
                            16.horizontalSpace,
                            MyLocationButton(
                              iconData: FlutterRemix.arrow_left_s_line,
                              width: 50,
                              onTap: () {
                                if (_animationController.isCompleted) {
                                  Navigator.pop(context);
                                }
                              },
                              colors: colors,
                            ),
                            6.horizontalSpace,
                            Expanded(
                              child: Container(
                                height: 50.r,
                                padding: REdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: colors.icon,
                                      offset: const Offset(0, 2),
                                      blurRadius: 2,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                  color: colors.backgroundColor,
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FlutterRemix.search_line,
                                      size: 20.r,
                                      color: colors.textBlack,
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: TextFormField(
                                        controller: state.textController,
                                        style: CustomStyle.interNormal(
                                            color: colors.textBlack, size: 16),
                                        onChanged: (value) => context
                                            .read<MapBloc>()
                                            .add(MapEvent.setQuery(context)),
                                        cursorWidth: 1.r,
                                        cursorColor: colors.textBlack,
                                        decoration: InputDecoration.collapsed(
                                          hintText: AppHelper.getTrn(
                                              TrKeys.searchLocation),
                                          hintStyle: CustomStyle.interRegular(
                                              color: colors.textHint, size: 14),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => context
                                          .read<MapBloc>()
                                          .add(const MapEvent
                                              .clearSearchField()),
                                      splashRadius: 20.r,
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        FlutterRemix.close_line,
                                        size: 20.r,
                                        color: colors.textBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                          ],
                        ),
                        if (state.isSearching)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: colors.backgroundColor,
                            ),
                            margin: REdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            padding: REdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: state.isSearchLoading
                                ? const MainListShimmer()
                                : ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.searchedPlaces.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return SearchedLocationItem(
                                        place: state.searchedPlaces[index],
                                        isLast:
                                            state.searchedPlaces.length - 1 ==
                                                index,
                                        onTap: () {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          context.read<MapBloc>().add(
                                              MapEvent.goToLocation(
                                                  place: state
                                                      .searchedPlaces[index]));
                                        },
                                        colors: colors,
                                      );
                                    },
                                  ),
                          ),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 150),
                      bottom: state.isChoosing ? -60.r : 20.r,
                      left: 16.r,
                      right: 16.r,
                      child: CustomButton(
                        title: AppHelper.getTrn(TrKeys.confirmLocation),
                        bgColor: CustomStyle.black,
                        titleColor: colors.white,
                        onTap: () {
                          if (!(state.textController?.text.contains(
                                  LocalStorage.getAddress()?.cityId != null
                                      ? (LocalStorage.getAddress()?.city ?? "")
                                      : (LocalStorage.getAddress()?.country ??
                                          "")) ??
                              false)) {
                            AppHelper.errorSnackBar(
                                context: context,
                                message: AppHelper.getTrn(
                                    TrKeys.thisLocationIsWrong));
                            return;
                          }
                          context.read<MapBloc>().add(MapEvent.saveLocalAddress(
                              true,
                              context: context));
                          Navigator.pop(
                              context,
                              LocationModel(
                                  latitude: state.location?.latitude.toString(),
                                  longitude:
                                      state.location?.longitude.toString(),
                                  address: state.textController?.text));
                        },
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 150),
                      bottom: 89.r,
                      right: state.isChoosing ? -60.r : 15.r,
                      child: MyLocationButton(
                        iconData: FlutterRemix.navigation_fill,
                        onTap: getMyLocation,
                        colors: colors,
                      ),
                    ),
                  ],
                );
              },
            ));
  }
}
