import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 100.r),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            height: 90.r,
            margin: EdgeInsets.only(bottom: 8.r, left: 16.r, right: 16.r),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 22.r),
            decoration: BoxDecoration(
              color: CustomStyle.shimmerBase,
              borderRadius: BorderRadius.circular(10.r),
            ),
          );
        },
      ),
    );
  }
}
