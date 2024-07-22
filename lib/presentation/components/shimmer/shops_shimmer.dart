import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';

class ShopsShimmer extends StatelessWidget {
  const ShopsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        padding: EdgeInsets.only(right: 16.r, left: 16.r, bottom: 100.r,top: 20.r),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.r,),
            height: 300.r,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomStyle.shimmerBase,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: CustomStyle.icon),
            ),
          );
        });
  }
}
