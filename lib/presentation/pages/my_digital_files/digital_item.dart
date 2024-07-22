import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/model/response/digital_list_response.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class DigitalItem extends StatelessWidget {
  final DigitalProduct product;
  final CustomColorSet colors;
  final VoidCallback download;
  final int? progress;

  const DigitalItem(
      {super.key,
      required this.product,
      required this.colors,
      required this.download,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.r),
      child: InkWell(
        onTap: () {
          AppRoute.goProductPage(
              context: context,
              product: product.digitalFile?.product ?? ProductData());
        },
        child: Row(
          children: [
            CustomNetworkImage(
                url: product.digitalFile?.product?.galleries?.first.path ?? "",
                preview: product.digitalFile?.product?.galleries?.first.preview,
                height: 120,
                width: 90,
                radius: 16),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.digitalFile?.product?.translation?.title ?? "",
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 14),
                  ),
                  if (product.digitalFile?.product?.stocks?.first.discount !=
                      null)
                    Padding(
                      padding: EdgeInsets.only(top: 4.r),
                      child: Text(
                        AppHelper.numberFormat(
                            number: product.digitalFile?.product?.stocks?.first
                                    .price ??
                                0),
                        style: CustomStyle.interNoSemi(
                            color: CustomStyle.red,
                            size: 14,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  4.verticalSpace,
                  Text(
                    AppHelper.numberFormat(
                        number: product.digitalFile?.product?.stocks?.first
                                .totalPrice ??
                            0),
                    style: CustomStyle.interSemi(
                        color: colors.textBlack, size: 16),
                  ),
                  16.verticalSpace,
                  progress == null
                      ? ButtonEffectAnimation(
                          onTap: download,
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors.transparent,
                                border: Border.all(color: colors.icon)),
                            child: Icon(
                              FlutterRemix.download_2_fill,
                              color: colors.textBlack,
                            ),
                          ),
                        )
                      : Text(
                          "$progress%",
                          style: CustomStyle.interNormal(
                              color: colors.textBlack, size: 16),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
