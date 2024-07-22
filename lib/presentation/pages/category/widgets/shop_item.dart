
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShopItemPage extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData shop;

  const ShopItemPage({Key? key, required this.colors, required this.shop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRouteShop.goShopPage(context: context, shop: shop);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.icon),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r)),
              child: CustomNetworkImage(
                  url: shop.backgroundImg ?? shop.logoImg ?? "",
                  height: 170,
                  width: double.infinity,
                  radius: 0),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shop.translation?.title ?? "",
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 16),
                      ),
                      4.verticalSpace,
                      Text(
                        TimeService.shopTime(shop.workingDays),
                        style: CustomStyle.interNormal(
                            color: colors.textHint, size: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/svg/start.svg"),
                  4.horizontalSpace,
                  Text(
                    shop.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 12),
                  )
                ],
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
