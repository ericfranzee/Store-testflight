import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BottomTwoItem extends StatelessWidget {
  final bool isActive;
  final int bagCount;
  final String icon;
  final CustomColorSet colors;
  final VoidCallback onTap;

  const BottomTwoItem({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onTap,
    this.bagCount = -1,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? colors.textWhite : colors.transparent),
        child: Badge(
          label: Text(bagCount.toString()),
          isLabelVisible: bagCount != -1,
          child: SvgPicture.asset(
            icon,
            height: 26.r,
            colorFilter: ColorFilter.mode(
                isActive ? colors.textBlack : colors.textWhite,
                BlendMode.srcIn),

          ),
        ),
      ),
    );
  }
}
