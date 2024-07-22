import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/custom_toggle.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ChangeThemeButton extends StatelessWidget {
  final CustomColorSet colors;
  final AppTheme controller;

  const ChangeThemeButton(
      {Key? key, required this.colors, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: colors.newBoxColor, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              AppHelper.getTrn(TrKeys.appTheme),
              style: CustomStyle.interNormal(
                  color: colors.textBlack,
                  size:  16),
            ),
          ),
          CustomToggle(
              isOnline: !controller.mode.isDark,
              onChange: (s) {
                controller.toggle();
              },
              colors: colors)
        ],
      ),
    );
  }
}
