import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CustomToggle extends StatefulWidget {
  final bool isOnline;
  final String? onTitle;
  final String? offTitle;
  final ValueChanged<bool> onChange;
  final CustomColorSet colors;

  const CustomToggle(
      {Key? key,
      required this.isOnline,
      required this.onChange,
      required this.colors,
      this.onTitle,
      this.offTitle})
      : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  var controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    controller = ValueNotifier<bool>(widget.isOnline);
    controller.addListener(() {
      widget.onChange(controller.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: controller,
      activeColor: widget.colors.backgroundColor,
      inactiveColor: widget.colors.backgroundColor,
      borderRadius: BorderRadius.circular(100.r),
      width: 76.r,
      height: 34.r,
      enabled: true,
      disabledOpacity: 0.5,
      thumb: Container(
        margin: EdgeInsets.all(4.r),
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: widget.colors.newBoxColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.colors.socialButtonColor.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: double.infinity,
              width: 3.r,
              color: widget.colors.backgroundColor,
            ),
            2.horizontalSpace,
            Container(
              height: double.infinity,
              width: 3.r,
              color: widget.colors.backgroundColor,
            )
          ],
        ),
      ),
      activeChild: Padding(
        padding: EdgeInsets.only(left: 4.r),
        child: Text(
          widget.onTitle ?? AppHelper.getTrn(TrKeys.light),
          style: CustomStyle.interNormal(
            size: 14,
            letterSpacing: -0.3,
            color: widget.colors.textBlack,
          ),
        ),
      ),
      inactiveChild: Padding(
        padding: EdgeInsets.only(right: 4.r),
        child: Text(
          widget.offTitle ?? AppHelper.getTrn(TrKeys.dark),
          style: CustomStyle.interNormal(
            size: 14,
            letterSpacing: -0.3,
            color: widget.colors.textBlack,
          ),
        ),
      ),
    );
  }
}
