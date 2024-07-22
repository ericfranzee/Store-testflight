import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class PopButton extends StatelessWidget {
  final CustomColorSet colors;

  const PopButton({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            color: colors.textBlack, borderRadius: BorderRadius.circular(10.r)),
        child: Icon(
          FlutterRemix.arrow_left_s_line,
          color: colors.textWhite,
        ),
      ),
    );
  }
}
