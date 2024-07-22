import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class PriceCompare extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData product;

  const PriceCompare({super.key, required this.colors, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.verticalSpace,
        Text(
          "${AppHelper.getTrn(TrKeys.from)} ${AppHelper.findLowPriceStocks(product.stocks)}",
          style: CustomStyle.interNormal(color: colors.textBlack),
        ),
        4.verticalSpace,
        Text(
          "${product.stocks?.length ?? 0} ${AppHelper.getTrn(TrKeys.options)}",
          style: CustomStyle.interNormal(color: CustomStyle.seeAllColor),
        ),
        8.verticalSpace,
      ],
    );
  }
}
