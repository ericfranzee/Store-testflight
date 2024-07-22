import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ProductInfoOne extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData? product;

  const ProductInfoOne({
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
          if (product?.properties?.isNotEmpty ?? false)
            Theme(
              data: Theme.of(context).copyWith(
                  dividerColor: CustomStyle.transparent,
                  primaryColor: colors.textBlack,
                  unselectedWidgetColor: colors.textBlack,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                      secondary: colors.textBlack, primary: colors.textBlack)),
              child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    AppHelper.getTrn(TrKeys.additionInformation),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 22),
                  ),
                  children: product?.properties
                          ?.map((element) => Padding(
                                padding: EdgeInsets.only(top: 16.r),
                                child: Row(
                                  children: [
                                    Text(
                                      element.group?.translation?.title ?? "",
                                      style: CustomStyle.interRegular(
                                          color: colors.textBlack, size: 16),
                                    ),
                                    const Spacer(),
                                    Text(
                                      element.value?.value ?? "",
                                      style: CustomStyle.interRegular(
                                          color: colors.textBlack, size: 16),
                                    )
                                  ],
                                ),
                              ))
                          .toList() ??
                      []),
            )
        ],
      ),
    );
  }


}
