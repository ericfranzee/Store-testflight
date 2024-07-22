import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../../domain/service/helper.dart';
import '../../../../domain/service/tr_keys.dart';

class ReviewCompare extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData product;

  const ReviewCompare({super.key, required this.colors, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.verticalSpace,
        Row(
          children: [
            const Icon(
              FlutterRemix.star_smile_fill,
              color: CustomStyle.starColor,
            ),
            4.horizontalSpace,
            Text(
              (product.ratingAvg ?? 0).toString(),
              style: CustomStyle.interNormal(color: colors.textBlack),
            ),
            const Spacer(),
            Text(
              "${product.reviews?.length ?? 0} ${AppHelper.getTrn(TrKeys.reviews)}",
              style: CustomStyle.interNormal(color: colors.textBlack),
            ),
          ],
        ),
        8.verticalSpace,
      ],
    );
  }
}
