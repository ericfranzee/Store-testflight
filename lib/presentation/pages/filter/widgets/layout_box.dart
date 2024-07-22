import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';

class LayoutBox extends StatelessWidget {
  final bool active;
  final double height;
  final double width;
  final double radius;

  const LayoutBox(
      {Key? key,
      required this.active,
      this.height = 40,
      this.width = 18,
      this.radius = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: active ? CustomStyle.primary : CustomStyle.unselectLayout,
      ),
      height: height.r,
      width: width.r,
    );
  }
}
