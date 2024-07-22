import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CheckoutProductItem extends StatelessWidget {
  final CustomColorSet colors;
  final CartDetailProduct? cartItem;

  const CheckoutProductItem(
      {super.key, required this.colors, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: cartItem?.replaceStock != null
          ? _replaceProduct(context)
          : _product(context),
    );
  }

  Widget _product(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRoute.goProductPage(
            context: context,
            product: cartItem?.stocks?.product ?? ProductData());
      },
      child: Row(
        children: [
          Stack(
            children: [
              CustomNetworkImage(
                  url: (cartItem?.galleries?.isNotEmpty ?? false)
                      ? cartItem?.galleries?.first.path ?? ""
                      : cartItem?.stocks?.product?.img ?? "",
                  height: 86,
                  width: 64,
                  radius: 16),
              if (cartItem?.bonus ?? false)
                Container(
                  margin: EdgeInsets.only(top: 8.r),
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    children: [
                      Icon(
                        FlutterRemix.gift_line,
                        color: colors.white,
                        size: 16.r,
                      ),
                    ],
                  ),
                )
            ],
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem?.stocks?.product?.translation?.title ?? "",
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 14),
                ),
                if (cartItem?.stocks?.extras?.isNotEmpty ?? false)
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItem?.stocks?.extras?.length ?? 0,
                      itemBuilder: (context, index) {
                        bool typeColor =
                            cartItem?.stocks?.extras?[index].group?.type ==
                                "color";
                        return Padding(
                          padding: EdgeInsets.only(top: 4.r),
                          child: Text(
                            "${cartItem?.stocks?.extras?[index].group?.translation?.title ?? ""} : ${typeColor ? AppHelper.getNameColor(cartItem?.stocks?.extras?[index].value) : cartItem?.stocks?.extras?[index].value}",
                            style: CustomStyle.interNormal(
                                color: colors.textBlack, size: 12),
                          ),
                        );
                      }),
                4.verticalSpace,
                if (!(cartItem?.bonus ?? false))
                  Text(
                    "${AppHelper.numberFormat(number: cartItem?.stocks?.totalPrice)} X ${(cartItem?.quantity ?? 0) * (cartItem?.stocks?.product?.interval ?? 1)}",
                    style: CustomStyle.interBold(
                        color: colors.textBlack, size: 14),
                  ),
                if (cartItem?.bonus ?? false)
                  Text(
                    "${(cartItem?.quantity ?? 0) * (cartItem?.stocks?.product?.interval ?? 1)}",
                    style: CustomStyle.interBold(
                        color: colors.textBlack, size: 14),
                  ),
                6.verticalSpace,
                Text(
                  cartItem?.note ?? "",
                  style: CustomStyle.interRegular(
                      color: colors.textBlack,
                      size: 14,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _replaceProduct(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: (cartItem?.replaceStock != null)
                  ? colors.icon
                  : colors.transparent)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                    color: (cartItem?.replaceStock != null)
                        ? colors.error
                        : colors.transparent)),
            child: ButtonEffectAnimation(
              onTap: () {
                AppRoute.goProductPage(
                    context: context,
                    product: cartItem?.replaceStock?.product ?? ProductData());
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      CustomNetworkImage(
                          url: cartItem?.replaceStock?.product?.img ?? "",
                          height: 86,
                          width: 64,
                          radius: 16),
                      if (cartItem?.bonus ?? false)
                        Container(
                          margin: EdgeInsets.only(top: 8.r),
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: Row(
                            children: [
                              Icon(
                                FlutterRemix.gift_line,
                                color: colors.white,
                                size: 16.r,
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem?.replaceStock?.product?.translation?.title ??
                              "",
                          style: CustomStyle.interNormal(
                              color: colors.textBlack, size: 14),
                        ),
                        if (cartItem?.replaceStock?.extras?.isNotEmpty ?? false)
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  cartItem?.replaceStock?.extras?.length ?? 0,
                              itemBuilder: (context, index) {
                                bool typeColor = cartItem?.replaceStock
                                        ?.extras?[index].group?.type ==
                                    "color";
                                return Padding(
                                  padding: EdgeInsets.only(top: 4.r),
                                  child: Text(
                                    "${cartItem?.replaceStock?.extras?[index].group?.translation?.title ?? ""} : ${typeColor ? AppHelper.getNameColor(cartItem?.replaceStock?.extras?[index].value) : cartItem?.replaceStock?.extras?[index].value}",
                                    style: CustomStyle.interNormal(
                                        color: colors.textBlack, size: 12),
                                  ),
                                );
                              }),
                        4.verticalSpace,
                        if (!(cartItem?.bonus ?? false))
                          Text(
                            "${AppHelper.numberFormat(number: cartItem?.replaceStock?.totalPrice)} X ${(cartItem?.replaceQuantity ?? 0) * (cartItem?.replaceStock?.product?.interval ?? 1)}",
                            style: CustomStyle.interBold(
                                color: colors.textBlack, size: 14),
                          ),
                        if (cartItem?.bonus ?? false)
                          Text(
                            "${(cartItem?.quantity ?? 0) * (cartItem?.stocks?.product?.interval ?? 1)}",
                            style: CustomStyle.interBold(
                                color: colors.textBlack, size: 14),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          6.verticalSpace,
          Icon(
            FlutterRemix.arrow_down_line,
            color: colors.textBlack,
          ),
          6.verticalSpace,
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                    color: (cartItem?.replaceStock != null)
                        ? CustomStyle.greenColor
                        : colors.transparent)),
            child: _product(context),
          ),
          8.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              cartItem?.replaceNote ?? "",
              style: CustomStyle.interRegular(
                  color: colors.textBlack,
                  size: 16,
                  fontStyle: FontStyle.italic),
            ),
          ),
          6.verticalSpace,
        ],
      ),
    );
  }
}
