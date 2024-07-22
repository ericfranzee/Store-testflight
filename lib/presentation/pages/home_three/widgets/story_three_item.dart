import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/story_model.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class StoryThreeItem extends StatelessWidget {
  final CustomColorSet colors;
  final StoryModel? story;
  final VoidCallback onTap;

  const StoryThreeItem({
    super.key,
    required this.colors,
    required this.story,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.r),
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
                border: Border.all(color: colors.primary),
                borderRadius: BorderRadius.circular(35.r)),
            child: CustomNetworkImage(
              url: story?.url ?? "",
              height: 70,
              width: 70,
              radius: 35,
              fit: BoxFit.cover,
            ),
          ),
          8.verticalSpace,
          SizedBox(
            width: 90.r,
            child: Text(
              story?.title ?? "",
              style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
