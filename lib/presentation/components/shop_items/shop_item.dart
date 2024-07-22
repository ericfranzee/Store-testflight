import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShopItem extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData shop;
  final bool blurUi;

  const ShopItem(
      {super.key,
      required this.colors,
      required this.shop,
      this.blurUi = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await AppRouteShop.goShopPage(context: context, shop: shop);
        if (context.mounted) {
          context.read<ShopBloc>().add(const ShopEvent.updateState());
        }
      },
      child: blurUi
          ? Container(
              width: 252.r,
              decoration: BoxDecoration(
                border: Border.all(color: colors.icon),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Stack(
                children: [
                  CustomNetworkImage(
                    url: shop.backgroundImg ?? "",
                    height: double.infinity,
                    width: 294,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  _titleTwo(),
                ],
              ),
            )
          : _simpleShop(context),
    );
  }

  Container _simpleShop(BuildContext context) {
    return Container(
      width: 294.r,
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        border: Border.all(color: colors.icon),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                  url: shop.backgroundImg ?? "",
                  height: 170,
                  width: double.infinity,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
              24.verticalSpace,
              _title(),
            ],
          ),
          _likeAndReview(context),
          Positioned(
            top: 148.r,
            left: 16.r,
            child: Container(
              margin: REdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: colors.textWhite, width: 2.r),
                  color: colors.textWhite.withOpacity(0.8),
                  shape: BoxShape.circle),
              child: CustomNetworkImage(
                url: shop.logoImg ?? '',
                height: 40,
                width: 40,
                radius: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _likeAndReview(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ButtonEffectAnimation(
                onTap: () {
                  LocalStorage.setLikedShopsList(shop.id ?? 0);
                  context.read<ShopBloc>().add(const ShopEvent.updateState());
                },
                child: SvgPicture.asset(
                  LocalStorage.getLikedShopsList().contains(shop.id)
                      ? "assets/svg/likeButtom.svg"
                      : "assets/svg/unlike.svg",
                  width: 26.r,
                  height: 26.r,
                ),
              ),
              const Spacer(),
              Container(
                width: 30.r,
                height: 30.r,
                decoration: BoxDecoration(
                    border: Border.all(color: colors.textWhite),
                    color: colors.backgroundColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Text(
                    (shop.ratingAvg ?? 0).toStringAsFixed(1),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 12),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shop.translation?.title ?? "",
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          6.verticalSpace,
          Text(
            shop.translation?.description ?? "",
            style: CustomStyle.interRegular(color: colors.textHint, size: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          10.verticalSpace,
          Row(
            children: [
              Icon(
                FlutterRemix.map_pin_2_fill,
                color: colors.textBlack,
                size: 16.r,
              ),
              4.horizontalSpace,
              Expanded(
                child: Text(
                  shop.distance == null || shop.distance == 0
                      ? (shop.translation?.address ?? "")
                      : ("${AppHelper.getTrn(TrKeys.from)} ${shop.distance!.toStringAsFixed(1)} ${AppHelper.getTrn(TrKeys.km)}"),
                  style: CustomStyle.interRegular(
                      color: colors.textHint, size: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          const Divider(),
          Row(
            children: [
              Text(
                AppHelper.reviewText(shop.ratingAvg),
                style:
                    CustomStyle.interNormal(color: colors.textBlack, size: 12),
              ),
              8.horizontalSpace,
              Container(
                height: 4.r,
                width: 4.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.textBlack,
                ),
              ),
              8.horizontalSpace,
              Text(
                "${(shop.ratingCount ?? 0.0).toStringAsFixed(0)} ${AppHelper.getTrn(TrKeys.reviews)}",
                style:
                    CustomStyle.interNormal(color: colors.textBlack, size: 12),
              ),
            ],
          ),
          8.verticalSpace,
        ],
      ),
    );
  }

  Widget _titleTwo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 72.r,
        margin: EdgeInsets.all(8.r),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            color: colors.textWhite.withOpacity(0.9),
            border: Border.all(color: colors.textWhite),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.translation?.title ?? "",
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  6.verticalSpace,
                  Expanded(
                    child: Text(
                      shop.translation?.description ?? "",
                      style: CustomStyle.interRegular(
                          color: colors.textHint, size: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
            CustomNetworkImage(
              url: shop.logoImg ?? "",
              height: 46,
              width: 46,
              radius: 23,
            )
          ],
        ),
      ),
    );
  }
}
