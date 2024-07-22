// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
class ProductTitleTwo extends StatelessWidget {
  final ProductData? product;
  final Stocks? selectStock;
  final CustomColorSet colors;

  const ProductTitleTwo(
      {Key? key, required this.product, required this.colors, this.selectStock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              product?.translation?.title ?? "",
              style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
              Text(
                AppHelper.numberFormat(number: selectStock?.totalPrice ?? 0),
                style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              ),
              if (selectStock?.discount != null)
                Padding(
                  padding: EdgeInsets.only(left: 16.r),
                  child: Text(
                    AppHelper.numberFormat(number: selectStock?.price ?? 0),
                    style: CustomStyle.interNoSemi(
                        color: CustomStyle.red,
                        size: 14,
                        decoration: TextDecoration.lineThrough),
                  ),
                )
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              RatingBar.builder(
                unratedColor: colors.textHint,
                initialRating: double.parse(
                    product?.ratingAvg?.toStringAsPrecision(2) ?? "0.0"),
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 24.r,
                glowColor: CustomStyle.starColor,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.r),
                onRatingUpdate: (rating) {},
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    FlutterRemix.star_smile_fill,
                    color: CustomStyle.starColor,
                  );
                },
              ),
              6.horizontalSpace,
              Text(
                product?.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
                style:
                CustomStyle.interNormal(color: colors.textBlack, size: 14),
              ),
              6.horizontalSpace,
              InkWell(
                onTap: () {
                  AppRoute.goReviewPage(
                      context: context,
                      colors: colors,
                      productId: product?.id,
                      productUuid: product?.uuid);
                },
                child: Text(
                  "${product?.ratingCount ?? 0} ${AppHelper.getTrn(TrKeys.reviews)}",
                  style: CustomStyle.interNormal(
                      color: colors.textBlack,
                      size: 14,
                      textDecoration: TextDecoration.underline),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
