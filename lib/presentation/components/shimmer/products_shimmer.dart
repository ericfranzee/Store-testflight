import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';

class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(16.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8.r, crossAxisCount: 2, mainAxisExtent: 310.r),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.r),
            child: Container(
              margin: EdgeInsets.only(bottom: 24.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: CustomStyle.icon),
                  color: CustomStyle.shimmerBase),
            ),
          );
        });
  }
}
