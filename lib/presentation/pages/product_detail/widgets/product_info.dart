import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'addition_information.dart';
import 'description_screen.dart';

class ProductInfo extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData? product;


  const ProductInfo({
    super.key,
    required this.colors,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        children: [
          _infoItem(
            title: AppHelper.getTrn(TrKeys.description),
            onTap: () {
              ((product?.translation?.description?.length ?? 0) > 1200)
                  ? AppHelper.showCustomModalBottomSheetDrag(
                      context: context,
                      modal: (c) => DescriptionScreen(
                          colors: colors,
                          controller: c,
                          description: product?.translation?.description),
                    )
                  : AppHelper.showCustomModalBottomSheet(
                      context: context,
                      modal: DescriptionScreen(
                          colors: colors,
                          description: product?.translation?.description),
                    );
            },
          ),
          if (product?.properties?.isNotEmpty ?? false)
            _infoItem(
              title: AppHelper.getTrn(TrKeys.additionInformation),
              onTap: () {
                AppHelper.showCustomModalBottomSheet(
                  context: context,
                  modal: AdditionInformation(
                    colors: colors,
                    list: product?.properties,
                  ),
                );
              },
            ),
          _infoItem(
            title: AppHelper.getTrn(TrKeys.reviews),
            onTap: () {
              AppRoute.goReviewPage(
                  context: context,
                  colors: colors,
                  productId: product?.id,
                  productUuid: product?.uuid);
            },
          ),
        ],
      ),
    );
  }

  Widget _infoItem({required String title, required VoidCallback onTap}) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: colors.newBoxColor,
        ),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: REdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomStyle.interNormal(color: colors.textBlack, size: 16),
            ),
            Icon(
              FlutterRemix.arrow_right_s_line,
              color: colors.textBlack,
            )
          ],
        ),
      ),
    );
  }
}
