import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ParcelItem extends StatelessWidget {
  final CustomColorSet colors;
  final ParcelOrder? parcel;
  final int index;

  const ParcelItem(
      {super.key,
      required this.colors,
      required this.parcel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRouteParcel.goParcelOrderPage(context, parcel, colors);
      },
      child: SizedBox(
        height: 82.r,
        child: Row(
          children: [
            Container(
              height: 60.r,
              width: 14.r,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  index == 0
                      ? Padding(
                          padding: EdgeInsets.only(right: 16.r),
                          child: const Divider(),
                        )
                      : SizedBox(
                          height: 2.r,
                        ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.r),
                            child: Text(
                              "#${parcel?.id}",
                              style: CustomStyle.interBold(
                                  color: colors.textBlack, size: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.r, top: 8.r),
                            child: Row(
                              children: [
                                Text(
                                  AppHelper.numberFormat(
                                      number: parcel?.totalPrice),
                                  style: CustomStyle.interBold(
                                      color: colors.textBlack, size: 16),
                                ),
                                12.horizontalSpace,
                                Container(
                                  width: 4.r,
                                  height: 4.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.textHint,
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  TimeService.dateFormatMDYHm(
                                      parcel?.deliveryDate),
                                  style: CustomStyle.interNormal(
                                      color: colors.textBlack, size: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 16.r),
                        child: Icon(
                          FlutterRemix.arrow_right_s_line,
                          color: colors.textBlack,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
