import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/product_items/product_info.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';
import 'package:provider/provider.dart';

import '../custom_network_image.dart';

class NewProductItem extends StatelessWidget {
  final ProductData product;

  const NewProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

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
              width: 250.r,
              height: 380.r,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: CustomStyle.icon),
                  color: CustomStyle.shimmerBase),
              child: Stack(
                children: [
                  CustomNetworkImage(
                      url: product.img ?? "",
                      width: 300.r,
                      height: 470.r,
                      radius: 24),
                  SizedBox(
                    height: 430.r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            16.horizontalSpace,
                            if(product.stocks?.isNotEmpty ?? false)
                            if (product.stocks?.first.discount != null)
                              SvgPicture.asset("assets/svg/discount.svg"),
                            const Spacer(),
                            IconButton(
                                splashColor: CustomStyle.transparent,
                                highlightColor: CustomStyle.transparent,
                                onPressed: () {
                                  LocalStorage.setLikedProductsList(
                                      product.id ?? 0);
                                  context
                                      .read<ProductBloc>()
                                      .add(const ProductEvent.updateState());
                                },
                                icon: LocalStorage.getLikedProductsList()
                                        .contains(product.id)
                                    ? Icon(
                                        FlutterRemix.heart_3_fill,
                                        color: CustomStyle.red,
                                        size: 24.r,
                                      )
                                    : Icon(
                                        FlutterRemix.heart_3_line,
                                        size: 24.r,
                                      ))
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colors.backgroundColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8.r)),
                            padding: const EdgeInsets.all(8.0),
                            child: ProductInfo(
                              product: product,
                              colors: colors,
                              width: 90,
                              listExtra: const [],
                            ),
                          ),
                        ),
                        16.verticalSpace
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
