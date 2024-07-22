import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';

class HProductShimmer extends StatelessWidget {
  const HProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.r),
            child: Container(
              width: 250.r,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: CustomStyle.shimmerBase,
                  borderRadius: BorderRadius.circular(24.r)),
            ),
          );
        });
  }
}
