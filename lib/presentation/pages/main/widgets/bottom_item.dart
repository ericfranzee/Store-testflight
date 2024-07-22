import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';

class BottomItem extends StatelessWidget {
  final bool isActive;
  final int bagCount;
  final String selectIcon;
  final String icon;
  final String? image;
  final String? name;
  final VoidCallback onTap;

  const BottomItem({
    Key? key,
    required this.isActive,
    required this.selectIcon,
    required this.icon,
    required this.onTap,
    this.image,
    this.bagCount = -1,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonEffectAnimation(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: icon.isNotEmpty ? 16.r : 8.r),
          child: Column(
            children: [
              icon.isNotEmpty
                  ? Badge(
                      label: Text(bagCount.toString()),
                      isLabelVisible: bagCount != -1,
                      child: SvgPicture.asset(
                        isActive ? selectIcon : icon,
                        height: 24.r,
                      ),
                    )
                  : CustomNetworkImage(
                      url: image ?? "",
                      height: 40,
                      width: 40,
                      radius: 20,
                      name: name,
                    ),
              const Spacer(),
              if (isActive)
                Container(
                  width: 24.r,
                  height: 4.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100.r),
                          topLeft: Radius.circular(100.r)),
                      color: CustomStyle.primary),
                )
            ],
          ),
        ),
      ),
    );
  }
}
