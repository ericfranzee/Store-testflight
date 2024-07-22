import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/maps_list.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:map_launcher/map_launcher.dart';

class ShopLocationAndDate extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData? shop;

  const ShopLocationAndDate(
      {super.key, required this.colors, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.location),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
          ),
          20.verticalSpace,
          Row(
            children: [
              Icon(
                FlutterRemix.map_pin_2_fill,
                color: colors.textBlack,
                size: 16.r,
              ),
              4.horizontalSpace,
              ButtonEffectAnimation(
                onTap: () {
                  AppHelper.showCustomModalBottomSheet(
                      context: context,
                      modal: Container(
                        padding: EdgeInsets.only(top: 32.r),
                        decoration: BoxDecoration(
                          color: colors.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            topLeft: Radius.circular(16.r),
                          ),
                        ),
                        child: MapsList(
                            colors: colors,
                            location: Coords(
                                double.tryParse(
                                        shop?.location?.latitude ?? "") ??
                                    AppHelper.getInitialLatitude(),
                                double.tryParse(
                                        shop?.location?.longitude ?? "") ??
                                    AppHelper.getInitialLongitude()),
                            title: "Uzmart"),
                      ));
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 60.r,
                  child: Text(
                    shop?.translation?.address ?? "",
                    style: CustomStyle.interRegular(
                      color: colors.textBlack,
                      size: 14,
                      textDecoration: TextDecoration.underline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
          CustomNetworkImage(
            url:
                "https://maps.googleapis.com/maps/api/staticmap?center=${shop?.location?.latitude ?? AppHelper.getInitialLatitude()},${shop?.location?.longitude ?? AppHelper.getInitialLongitude()}&zoom=10&size=400x400&markers=color:black|label:${(shop?.ratingAvg ?? 0).toStringAsFixed(0)}|${shop?.location?.latitude ?? ""},${shop?.location?.longitude ?? ""}&key=${AppConstants.googleApiKey}",
            height: 390,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10.r),
          ),
          24.verticalSpace,
          if (shop?.workingDays?.isNotEmpty ?? false)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.businessHours),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 22),
                ),
                20.verticalSpace,
                ...shop?.workingDays?.map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 8.r),
                          child: Row(
                            children: [
                              Text(
                                AppHelper.getTrn(e.day ?? ""),
                                style: CustomStyle.interRegular(
                                    color: colors.textBlack, size: 18),
                              ),
                              const Spacer(),
                              Text(
                                "${e.from} - ${e.to}",
                                style: CustomStyle.interRegular(
                                    color: colors.textBlack, size: 18),
                              ),
                            ],
                          ),
                        )) ??
                    []
              ],
            )
        ],
      ),
    );
  }
}
