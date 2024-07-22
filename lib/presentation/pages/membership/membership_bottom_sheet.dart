import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/membership_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class MembershipBottomSheet extends StatelessWidget {
  final CustomColorSet colors;
  final MembershipModel? membership;
  final ScrollController controller;
  final bool enableBuy;

  const MembershipBottomSheet({
    super.key,
    required this.colors,
    required this.controller,
    required this.membership,
     this.enableBuy = true,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        decoration: BoxDecoration(
          color: colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: ListView(
          controller: controller,
          padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
          children: [
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: colors.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            28.verticalSpace,
            Row(
              children: [
                Text(
                  membership?.translation?.title ?? "",
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 22),
                ),
                const Spacer(),
                Text(
                  AppHelper.numberFormat(number: membership?.price),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
              ],
            ),
            24.verticalSpace,
            Text(
              membership?.translation?.description ?? "",
              style:
                  CustomStyle.interRegular(color: colors.textBlack, size: 16),
            ),
            26.verticalSpace,
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: colors.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    AppHelper.getTrn(membership?.time ?? ""),
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: colors.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    membership?.sessions == 2
                        ? AppHelper.getTrn(TrKeys.unlimited)
                        : "${membership?.sessionsCount} ${AppHelper.getTrn(TrKeys.count)}",
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Text(
              membership?.translation?.term ?? "",
              style:
                  CustomStyle.interRegular(color: colors.textBlack, size: 16),
            ),
            24.verticalSpace,
            if(enableBuy)
            CustomButton(
                title: AppHelper.getTrn(TrKeys.buyNow),
                bgColor: colors.primary,
                titleColor: colors.white,
                onTap: () {
                  AppRouteShop.goMembershipPaymentBottomSheet(
                      context: context, model: membership, colors: colors);
                })
          ],
        ),
      ),
    );
  }
}
