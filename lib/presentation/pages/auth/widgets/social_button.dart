import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';

class SocialButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton(
      {Key? key,
      required this.bgColor,
      required this.icon,
      required this.onTap, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(20.r),
        child: Icon(icon,color: iconColor,),
      ),
    );
  }
}
