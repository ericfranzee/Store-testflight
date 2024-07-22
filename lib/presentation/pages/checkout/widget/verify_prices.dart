import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/cart_calculate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/price_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class VerifyPrices extends StatelessWidget {
  final CustomColorSet colors;
  final CartCalculate? cart;

  const VerifyPrices({super.key, required this.colors, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceItem(title: TrKeys.productsSubtotal, price: cart?.price,colors: colors,),
        if (cart?.totalShopTax != 0 && cart?.totalShopTax != null)
          PriceItem(title: TrKeys.totalTax, price: cart?.totalShopTax,colors: colors,),
        if (cart?.serviceFee != 0 && cart?.serviceFee != null)
          PriceItem(
            title: TrKeys.serviceFee,
            price: cart?.serviceFee,
            colors: colors,
          ),
        if (cart?.deliveryFee?.fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue + (element.price ?? 0)) !=
                0 &&
            cart?.deliveryFee?.fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue + (element.price ?? 0)) !=
                null)
          PriceItem(
              title: TrKeys.deliveryFee,
              colors: colors,
              price: cart?.deliveryFee?.fold(
                  0.0,
                  (previousValue, element) =>
                      (previousValue ?? 0) + (element.price ?? 0))),
        if (cart?.coupon?.fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue + (element.price ?? 0)) !=
                0 &&
            cart?.coupon?.fold(
                    0.0,
                    (previousValue, element) =>
                        previousValue + (element.price ?? 0)) !=
                null)
          PriceItem(
              colors: colors,
              title: TrKeys.coupon,
              price: cart?.coupon?.fold(
                  0.0,
                  (previousValue, element) =>
                      (previousValue ?? 0) + (element.price ?? 0)),
              discount: true),
        if (cart?.totalDiscount != 0 && cart?.totalDiscount != null)
          PriceItem(
              colors: colors,
              title: TrKeys.discount,
              price: cart?.totalDiscount,
              discount: true),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Divider(
            color: colors.textHint,
          ),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelper.getTrn(TrKeys.total),
                style: CustomStyle.interBold(color: colors.textBlack, size: 14),
              ),
              Text(
                AppHelper.numberFormat(number: cart?.totalPrice),
                style: CustomStyle.interBold(color: colors.textBlack, size: 14),
              ),
            ],
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
