import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/marker_image_cropper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/pages/search/widgets/search_widget.dart';

import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchMapPage extends StatefulWidget {
  final LocationModel? location;
  final int? categoryId;

  const SearchMapPage({super.key, this.location, this.categoryId});

  @override
  State<SearchMapPage> createState() => _SearchMapPageState();
}

class _SearchMapPageState extends State<SearchMapPage>
    with TickerProviderStateMixin {
  CameraPosition? _cameraPosition;
  late RefreshController shopsRefresh;
  final ImageCropperForMarker image = ImageCropperForMarker();

  @override
  void initState() {
    shopsRefresh = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    shopsRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => Stack(
        children: [
          _map(context),
          SearchWidget(colors: colors),
          _shops(colors),
        ],
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Widget _map(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return GoogleMap(
          tiltGesturesEnabled: false,
          myLocationEnabled: true,
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
                    double.tryParse(widget.location?.latitude ?? "0") ??
                        AppHelper.getInitialLatitude(),
                    double.tryParse(widget.location?.longitude ?? "0") ??
                        AppHelper.getInitialLongitude(),
                  ),
            tilt: 0,
            zoom: 17,
          ),
          markers: state.markers,
          onMapCreated: (controller) {
            context.read<MapBloc>().add(MapEvent.setMapController(controller));
          },
          onCameraIdle: () {
            context.read<ShopBloc>().add(ShopEvent.fetchNearShops(
                  isRefresh: true,
                  context: context,
                  onSuccess: () {},
                  category: widget.categoryId,
                  location: LocationModel(
                    latitude: _cameraPosition?.target.latitude.toString(),
                    longitude: _cameraPosition?.target.longitude.toString(),
                  ),
                ));
          },
          onCameraMove: (cameraPosition) {
            _cameraPosition = cameraPosition;
          },
        );
      },
    );
  }

  DraggableScrollableSheet _shops(CustomColorSet colors) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.85,
      minChildSize: 0.1,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: colors.backgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.r),
                topLeft: Radius.circular(12.r),
              ),
              boxShadow: [
                BoxShadow(
                    color: colors.backgroundColor.withOpacity(0.25),
                    blurRadius: 40,
                    offset: const Offset(0, -2))
              ]),
          child: SmartRefresher(
            controller: shopsRefresh,
            enablePullDown: false,
            onLoading: () {
              context.read<ShopBloc>().add(ShopEvent.fetchNearShops(
                  context: context,
                  controller: shopsRefresh,
                  location: LocationModel(
                    latitude: _cameraPosition?.target.latitude.toString(),
                    longitude: _cameraPosition?.target.longitude.toString(),
                  ),
                  onSuccess: () {}));
            },
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.only(
                  top: 8.h,
                  bottom: MediaQuery.paddingOf(context).bottom + 16.h,
                  left: 16.w,
                  right: 16.w),
              children: [
                Container(
                  height: 4.r,
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 2 - 56.r),
                  decoration: BoxDecoration(
                      color: colors.icon,
                      borderRadius: BorderRadius.circular(100.r)),
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.salonsNearYou),
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 18),
                    ),
                    const Spacer(),
                    BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
                      return ButtonEffectAnimation(
                        onTap: () {
                          AppRouteShop.goFilterShopBottomSheet(
                            context: context,
                            colors: colors,
                            filter: state.filter,
                            isNear: true,
                            categoryId: widget.categoryId,
                            location: LocationModel(
                              latitude:
                                  _cameraPosition?.target.latitude.toString(),
                              longitude:
                                  _cameraPosition?.target.longitude.toString(),
                            ),
                          );
                        },
                        child: Container(
                          height: 46.r,
                          width: 46.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: colors.icon)),
                          child: Badge(
                            smallSize: 8,
                            isLabelVisible:
                                state.filter?.type == TrKeys.nearByShop,
                            padding: REdgeInsets.all(2),
                            child: Icon(
                              FlutterRemix.filter_2_line,
                              color: colors.textBlack,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
                16.verticalSpace,
                BlocConsumer<ShopBloc, ShopState>(
                  listener: (BuildContext context, ShopState state) async {
                    Set<Marker> markers = {};

                    for (var element in state.nearShops) {
                      markers.addAll({
                        Marker(
                          onTap: () {},
                          infoWindow: InfoWindow(
                              title: element.translation?.title,
                              snippet: element.translation?.description),
                          markerId: MarkerId(element.id.toString()),
                          position: LatLng(
                              double.tryParse(
                                      element.location?.latitude ?? "") ??
                                  AppHelper.getInitialLatitude(),
                              double.tryParse(
                                      element.location?.longitude ?? "") ??
                                  AppHelper.getInitialLongitude()),
                          icon: await image.getMarkerBitmap(
                            90,
                            text: element.ratingAvg?.toStringAsFixed(1),
                          ),
                        )
                      });
                    }
                    if (context.mounted) {
                      context
                          .read<MapBloc>()
                          .add(MapEvent.setMarker(markers: markers));
                    }
                  },
                  builder: (context, state) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 90.r),
                        shrinkWrap: true,
                        itemCount: state.nearShops.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.r),
                            child: ShopItem(
                              shop: state.nearShops[index],
                              colors: colors,
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
