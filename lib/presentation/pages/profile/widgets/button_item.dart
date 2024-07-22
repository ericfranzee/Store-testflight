import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_toggle.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ButtonItem extends StatelessWidget {
  final CustomColorSet colors;
  final IconData icon;
  final String title;
  final String? selectValue;
  final String? onTitle;
  final String? offTitle;
  final VoidCallback onTap;
  final bool? value;

  const ButtonItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.colors,
    this.selectValue,
    this.value,
    this.onTitle,
    this.offTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      disabled: value == null,
      onTap: value == null ? onTap : null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
        decoration: BoxDecoration(
          color: colors.newBoxColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            Icon(
              icon,
              color: colors.textBlack,
            ),
            12.horizontalSpace,
            Text(
              title,
              style: CustomStyle.interNormal(color: colors.textBlack, size: 16),
            ),
            const Spacer(),
            Text(
              selectValue ?? "",
              style: CustomStyle.interNormal(color: colors.textBlack, size: 12),
            ),
            if (value == null)
              Icon(
                FlutterRemix.arrow_right_s_line,
                color: colors.textBlack,
              ),
            if (value != null)
              CustomToggle(
                  offTitle: offTitle,
                  onTitle: onTitle,
                  isOnline: value ?? false,
                  onChange: (s) {
                    onTap();
                  },
                  colors: colors)
          ],
        ),
      ),
    );
  }
}
