import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BottomOneItem extends StatelessWidget {
  final bool isActive;
  final int bagCount;
  final String icon;
  final String name;
  final CustomColorSet colors;
  final VoidCallback onTap;

  const BottomOneItem({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onTap,
    this.bagCount = -1,
    required this.name,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonEffectAnimation(
        onTap: onTap,
        child: Column(
          children: [
            Badge(
              label: Text(bagCount.toString()),
              isLabelVisible: bagCount != -1,
              child: SvgPicture.asset(
                icon,
                height: 26.r,
                colorFilter: ColorFilter.mode(
                    isActive ? colors.primary : colors.textHint,
                    BlendMode.srcIn),
              ),
            ),
            Text(
              name,
              style: CustomStyle.interNormal(
                  color: isActive ? colors.primary : colors.textHint, size: 12),
            )
          ],
        ),
      ),
    );
  }
}
