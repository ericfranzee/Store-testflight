import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class TabBarItem extends StatelessWidget {
  final String? title;
  final String? image;

  final bool isActive;
  final CustomColorSet colors;
  final VoidCallback? onTap;

  const TabBarItem({
    Key? key,
    required this.isActive,
    this.onTap,
     this.title,
    this.image,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.r),
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        height: 40.r,
        decoration: BoxDecoration(
          color: isActive ? colors.textBlack : colors.transparent,
          border: Border.all(color: colors.textBlack),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            if(image?.isNotEmpty ?? false)
            Padding(
              padding:  EdgeInsets.only(right: 10.r),
              child: CustomNetworkImage(url: image ?? "", height: 20, width: 20),
            ),
            Text(
              title ?? "",
              style: CustomStyle.interRegular(
                  color: isActive ? colors.textWhite : colors.textBlack,
                  size: 16),
            )
          ],
        ),
      ),
    );
  }
}
