import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../const/colors.dart';

class ButtonWidget extends StatelessWidget {
  final CustomColorSet colors;

  const ButtonWidget(
      {super.key,
      this.text,
      this.icon,
      required this.onPressed,
      required this.colors});

  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
            color: colors.newBoxColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: IconButton(
            color: colors.textBlack,
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 32.0,
            )),
      );
    }
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16.0)),
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor)),
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ));
  }
}
