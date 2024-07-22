import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart' as l;

class DeliveryPointScreen extends StatelessWidget {
  final CustomColorSet colors;
  final List<DeliveryPoint> list;
  final int selectPointId;
  final Set<Marker>? markers;

  const DeliveryPointScreen(
      {super.key,
      required this.colors,
      required this.list,
      required this.selectPointId,
      required this.markers});

  @override
  Widget build(BuildContext context) {
    final point =
        list.firstWhere((element) => element.id == selectPointId, orElse: () {
      return DeliveryPoint();
    });
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      children: [
        list.isNotEmpty
            ? Column(
                children: [
                  24.verticalSpace,
                  ButtonEffectAnimation(
                    onTap: () {
                      AppRoute.goSelectDeliveryPoint(
                          context: context, list: list);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.r, horizontal: 10.r),
                      decoration: BoxDecoration(
                          color: colors.newBoxColor,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.textBlack),
                            padding: EdgeInsets.all(12.r),
                            child: Icon(
                              FlutterRemix.map_pin_range_fill,
                              color: colors.textWhite,
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelper.getTrn(TrKeys.selectPickupZone),
                                style: CustomStyle.interSemi(
                                    color: colors.textBlack, size: 14),
                              ),
                              Text(
                                point.translation?.title ?? "",
                                style: CustomStyle.interRegular(
                                    color: colors.textBlack, size: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            FlutterRemix.arrow_right_s_line,
                            color: colors.textBlack,
                          )
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  CustomNetworkImage(
                      url:
                          "https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=300x200&maptype=roadmap&markers=color:red%7C${double.tryParse(point.location?.latitude ?? "") ??  AppHelper.getInitialLatitude()},${double.tryParse(point.location?.longitude ?? "") ??  AppHelper.getInitialLongitude()}&key=${AppConstants.googleApiKey}",
                      height: 180.r,
                      width: double.infinity,
                      radius: 16.r),
                ],
              )
            : Column(
                children: [
                  l.Lottie.asset('assets/lottie/empty_review.json',
                      height: 160.r),
                  Text(
                    AppHelper.getTrn(TrKeys.thereAreNoDeliveryPointsHere),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 16),
                    textAlign: TextAlign.center,
                  ),
                  16.verticalSpace,
                  CustomButton(
                      title: AppHelper.getTrn(TrKeys.selectCountry),
                      bgColor: colors.primary,
                      titleColor: colors.white,
                      onTap: () {
                        Navigator.pop(context);
                        AppRouteSetting.goSelectCountry(context: context);
                      })
                ],
              ),
      ],
    );
  }
}
