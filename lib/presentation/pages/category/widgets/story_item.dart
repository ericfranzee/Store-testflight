import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/story_model.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class StoryItem extends StatelessWidget {
  final CustomColorSet colors;
  final StoryModel? story;
  final VoidCallback onTap;

  const StoryItem({
    super.key,
    required this.colors,
    required this.story,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.r),
            decoration: BoxDecoration(
                border: Border.all(color: colors.icon),
                borderRadius: BorderRadius.circular(10.r)),
            child: CustomNetworkImage(
              url: story?.url ?? "",
              height: 160,
              width: 120,
              radius: 10,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 36.r),
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                  color: colors.icon.withOpacity(0.5),
                  border: Border.all(color: colors.icon),
                  shape: BoxShape.circle),
              child: CustomNetworkImage(
                  url: story?.logoImg ?? "", height: 40, width: 40, radius: 20),
            ),
          )
        ],
      ),
    );
  }
}
