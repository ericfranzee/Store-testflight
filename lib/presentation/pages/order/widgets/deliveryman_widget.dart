import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliverymanWidget extends StatelessWidget {
  final CustomColorSet colors;
  final UserModel? deliveryman;
  final String? status;
  final int? orderId;

  const DeliverymanWidget(
      {super.key,
      required this.colors,
      required this.deliveryman,
      this.status,
      this.orderId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (status == "delivered")
          ButtonEffectAnimation(
            onTap: () {
              AppRoute.goReviewPage(
                  context: context,
                  colors: colors,
                  driverId: deliveryman?.id,
                  orderId: orderId);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 16.r),
              child: Text(
                AppHelper.getTrn(TrKeys.addReview),
                style: CustomStyle.interNormal(
                    color: CustomStyle.seeAllColor, size: 14),
              ),
            ),
          ),
        Container(
          margin: EdgeInsets.only(top: 8.r),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 18.r),
          decoration: BoxDecoration(
              color: colors.backgroundColor,
              borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              CustomNetworkImage(
                url: deliveryman?.img ?? "",
                height: 50,
                width: 50,
                radius: 25,
                name: deliveryman?.firstname ?? deliveryman?.lastname,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2 - 56.r,
                    child: Text(
                      "${deliveryman?.firstname ?? ''} ${deliveryman?.lastname ?? ''}",
                      style: CustomStyle.interSemi(
                          color: colors.textBlack, size: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        AppHelper.getTrn(TrKeys.driver),
                        style: CustomStyle.interRegular(
                            color: colors.textHint, size: 14),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.r),
                        width: 4.r,
                        height: 4.r,
                        decoration: BoxDecoration(
                            color: colors.textBlack, shape: BoxShape.circle),
                      ),
                      SvgPicture.asset("assets/svg/start.svg"),
                      4.horizontalSpace,
                      Text(
                        (deliveryman?.rate ?? 0).toString(),
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              ButtonEffectAnimation(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: deliveryman?.phone ?? "",
                  );
                  await launchUrl(launchUri);
                },
                child: Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                      color: colors.textBlack, shape: BoxShape.circle),
                  child: Icon(
                    FlutterRemix.phone_fill,
                    color: colors.textWhite,
                  ),
                ),
              ),
              6.horizontalSpace,
              ButtonEffectAnimation(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'sms',
                    path: deliveryman?.phone ?? "",
                  );
                  await launchUrl(launchUri);
                },
                child: Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                      color: colors.primary, shape: BoxShape.circle),
                  child: Icon(
                    FlutterRemix.message_3_fill,
                    color: colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
