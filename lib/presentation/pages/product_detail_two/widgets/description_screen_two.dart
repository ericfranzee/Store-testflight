// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:readmore/readmore.dart';

class DescriptionTwoScreen extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData? product;
  final Stocks? selectStock;

  const DescriptionTwoScreen({
    super.key,
    required this.colors,
    required this.product,
    required this.selectStock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product?.translation?.description != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.description),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 16),
                ),
                10.verticalSpace,
                ReadMoreText(
                  product?.translation?.description ?? "",
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: AppHelper.getTrn(TrKeys.showMore),
                  trimExpandedText: AppHelper.getTrn(TrKeys.showLess),
                  lessStyle: CustomStyle.interRegular(
                      color: colors.textBlack,
                      size: 14,
                      textDecoration: TextDecoration.underline),
                  moreStyle: CustomStyle.interRegular(
                      color: colors.textBlack,
                      size: 14,
                      textDecoration: TextDecoration.underline),
                  style: CustomStyle.interRegular(
                      color: colors.textBlack, size: 14),
                )
              ],
            ),
          16.verticalSpace,
          if (product?.brand != null)
            ButtonEffectAnimation(
              onTap: () async {
                if (product?.brand != null) {
                  await AppRoute.goProductList(
                      context: context,
                      brandId: product?.brandId,
                      title: product?.brand?.title);
                  if (context.mounted) {
                    context
                        .read<ProductDetailBloc>()
                        .add(const ProductDetailEvent.updateState());
                  }
                }
              },
              child: _item(
                  title: product?.brand?.title,
                  icon: CustomNetworkImage(
                      url: product?.brand?.img ?? "",
                      height: 36,
                      width: 70,
                      fit: BoxFit.contain,
                      radius: 2)),
            ),
          if (selectStock != null)
          _item(
              title: AppHelper.getTrn(TrKeys.inStock),
              icon: Column(
                children: [
                  ((selectStock?.quantity ?? 0) > 0)
                      ? SvgPicture.asset(
                          "assets/svg/inStock.svg",
                          height: 30.r,
                        )
                      : SvgPicture.asset(
                          "assets/svg/outOfStock.svg",
                          color: colors.textBlack,
                          height: 30.r,
                        ),
                  4.verticalSpace,
                  Text(
                    (selectStock?.quantity ?? 0).toString(),
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  )
                ],
              )),
          if (product?.shop != null)
          ButtonEffectAnimation(
            onTap: () async {
              if (product?.shop != null) {
                await AppRouteShop.goShopPage(
                    context: context, shop: product?.shop);
                if (context.mounted) {
                  context
                      .read<ProductDetailBloc>()
                      .add(const ProductDetailEvent.updateState());
                }
              }
            },
            child: _item(
                title: product?.shop?.translation?.title,
                icon: CustomNetworkImage(
                    url: product?.shop?.logoImg ?? "",
                    height: 40,
                    width: 40,
                    radius: 2)),
          ),
        ],
      ),
    );
  }

  Widget _item({required String? title, required Widget icon}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.r),
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 20.r),
      decoration: BoxDecoration(
          border: Border.all(color: colors.icon),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Text(
            title ?? "",
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
          ),
          const Spacer(),
          icon
        ],
      ),
    );
  }
}
