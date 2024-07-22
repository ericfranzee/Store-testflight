import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/presentation/components/custom_tab_bar.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/checkout/delivered_screen.dart';
import 'package:ibeauty/presentation/pages/checkout/delivery_points.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShippingScreen extends StatelessWidget {
  final CustomColorSet colors;
  final TabController tabController;
  final List<Tab> list;
  final List<DeliveryPoint> listPoints;
  final List<UserAddress> listAddress;
  final bool isLoadingPoint;
  final bool isLoading;
  final int selectPointId;
  final int selectAddress;
  final Set<Marker>? markers;

  const ShippingScreen({
    super.key,
    required this.colors,
    required this.tabController,
    required this.list,
    required this.isLoadingPoint,
    required this.listPoints,
    required this.selectPointId,
    required this.markers,
    required this.listAddress,
    required this.isLoading,
    required this.selectAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
          child: CustomTabBar(
            tabs: list,
            tabController: tabController,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height - 390.r,
          child: TabBarView(controller: tabController, children: [
            DeliveredScreen(
              colors: colors,
              listAddress: listAddress,
              isLoading: isLoading,
              selectAddress: selectAddress,
            ),
            isLoadingPoint
                ? const Loading()
                : DeliveryPointScreen(
                    markers: markers,
                    selectPointId: selectPointId,
                    colors: colors,
                    list: listPoints,
                  ),
          ]),
        )
      ],
    );
  }
}
