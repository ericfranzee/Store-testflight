import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'custom_network_image.dart';

class SubCategoryItem extends StatelessWidget {
  final CategoryData? categoryData;

  const SubCategoryItem({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () async {
       await AppRoute.goProductList(
            context: context,
            title: categoryData?.translation?.title ?? "",
            categoryId: categoryData?.id);
       if (context.mounted) {
         context
             .read<ProductBloc>()
             .add(const ProductEvent.updateState());
       }
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        width: 90.r,
        decoration: BoxDecoration(
            color: CustomStyle.subCategory,
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          children: [
            CustomNetworkImage(
                url: categoryData?.img ?? "", height: 64, width: 64, radius: 8),
            6.verticalSpace,
            Text(
              categoryData?.translation?.title ?? "",
              style:
                  CustomStyle.interNormal(color: CustomStyle.black, size: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
