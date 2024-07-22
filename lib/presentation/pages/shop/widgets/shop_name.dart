import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShopName extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData? shop;
  final List<Galleries>? images;

  const ShopName(
      {Key? key, required this.colors, required this.shop, this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          8.verticalSpace,
          _info(),
          16.verticalSpace,
          _seePhoto(context),
          24.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: colors.newBoxColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FlutterRemix.time_fill,
                        color: colors.textBlack,
                      ),
                      12.verticalSpace,
                      Text(
                        AppHelper.getTrn(TrKeys.workedHours),
                        style: CustomStyle.interRegular(
                            color: colors.textBlack, size: 12),
                      ),
                      Text(
                        TimeService.shopTime(shop?.workingDays),
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 14),
                      )
                    ],
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: colors.newBoxColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FlutterRemix.money_dollar_circle_fill,
                        color: colors.textBlack,
                      ),
                      12.verticalSpace,
                      Text(
                        AppHelper.getTrn(TrKeys.serviceFee),
                        style: CustomStyle.interRegular(
                            color: colors.textBlack, size: 12),
                      ),
                      Text(
                        "${AppHelper.getTrn(TrKeys.from)} 10\$",
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 14),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ButtonEffectAnimation _seePhoto(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRoute.goOnlyImagePage(context: context, list: images ?? []);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.textBlack)),
        padding: EdgeInsets.symmetric(
          vertical: 10.r,
        ),
        child: Center(
          child: Text(
            "${AppHelper.getTrn(TrKeys.seeAll)} ${images?.length} ${AppHelper.getTrn(TrKeys.photos)}",
            style: CustomStyle.interNormal(color: colors.textBlack, size: 16),
          ),
        ),
      ),
    );
  }

  Widget _info() {
    return Row(
      children: [
        Text(
          AppHelper.reviewText(shop?.ratingAvg),
          style: CustomStyle.interNormal(color: colors.textBlack, size: 12),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          height: 4.r,
          width: 4.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.textHint,
          ),
        ),
        Text(
          "${(shop?.ratingCount ?? 0.0).toStringAsFixed(0)} ${AppHelper.getTrn(TrKeys.reviews)}",
          style: CustomStyle.interNormal(color: colors.textBlack, size: 12),
        ),
        Container(
          height: 4.r,
          width: 4.r,
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.textHint,
          ),
        ),
        Text(
          TimeService.shopCheckOpen(
              days: shop?.workingDays, closedDays: shop?.shopClosedDate),
          style: CustomStyle.interNormal(color: colors.textBlack, size: 12),
        )
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      children: [
        Icon(
          FlutterRemix.map_pin_2_fill,
          color: colors.textBlack,
          size: 16.r,
        ),
        4.horizontalSpace,
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 220.r,
              child: Text(
                shop?.translation?.address ?? "",
                style:
                    CustomStyle.interRegular(color: colors.textBlack, size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (shop?.distance != null)
              Text(
                " (${AppHelper.getTrn(TrKeys.from)} ${shop!.distance!.toStringAsFixed(1)} ${AppHelper.getTrn(TrKeys.km)})",
                style: CustomStyle.interRegular(
                    color: colors.textBlack, size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        const Spacer(),
        Container(
          height: 40.r,
          width: 40.r,
          decoration: BoxDecoration(
              border: Border.all(color: colors.textBlack),
              color: colors.backgroundColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: Text(
              (shop?.ratingAvg ?? 0).toStringAsFixed(1),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 14),
            ),
          ),
        )
      ],
    );
  }
}
