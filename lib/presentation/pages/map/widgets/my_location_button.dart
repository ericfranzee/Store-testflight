import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class MyLocationButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final int width;
  final CustomColorSet colors;

  const MyLocationButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.width = 60,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular((width / 2).r),
      elevation: 2,
      color: colors.textWhite,
      child: InkWell(
        borderRadius: BorderRadius.circular((width / 2).r),
        onTap: onTap,
        child: Container(
          width: width.r,
          height: width.r,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Icon(
            iconData,
            size: 28.r,
            color: colors.textBlack,
          ),
        ),
      ),
    );
  }
}
