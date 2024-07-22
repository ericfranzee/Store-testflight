import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

class GridProductItem extends StatelessWidget {
  final ProductData product;

  const GridProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, controller) {
      return InkWell(
        onTap: () async {
         await AppRoute.goProductPage(context: context, product: product);
         if (context.mounted) {
           context.read<ProductBloc>().add(const ProductEvent.updateState());
         }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: CustomStyle.icon),
                  color: CustomStyle.shimmerBase),
              child: Stack(
                children: [
                  CustomNetworkImage(
                      url: product.img ?? "",
                      height: 100,
                      width: 100,
                      radius: 20),
                  if(product.stocks?.isNotEmpty ?? false)
                  if (product.stocks?.first.discount != null)
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset("assets/svg/discount.svg"),
                    ),
                ],
              ),
            ),
            10.verticalSpace,
            Text(
              product.translation?.title ?? "",
              style: CustomStyle.interNormal(
                color: colors.textBlack,
                size: 16,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            4.verticalSpace,
            Row(
              children: [
                SvgPicture.asset("assets/svg/start.svg"),
                4.horizontalSpace,
                Text(
                  product.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 12),
                )
              ],
            ),
            12.verticalSpace,
            if(product.stocks?.isNotEmpty ?? false)
            if (product.stocks?.first.discount != null)
              Padding(
                padding: EdgeInsets.only(bottom: 4.r),
                child: Text(
                  AppHelper.numberFormat(
                    number: product.stocks?.first.price ?? 0,
                  ),
                  style: CustomStyle.interSemi(
                      color: CustomStyle.red,
                      size: 14,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            Text(
              AppHelper.numberFormat(
                number: product.stocks?.first.totalPrice ?? 0,
              ),
              style: CustomStyle.interSemi(color: colors.textBlack, size: 18),
            ),
          ],
        ),
      );
    });
  }
}
