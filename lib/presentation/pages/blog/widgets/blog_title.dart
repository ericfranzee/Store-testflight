import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/domain/model/model/blog_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BlogTitle extends StatelessWidget {
  final CustomColorSet colors;
  final BlogData? blog;

  const BlogTitle({super.key, required this.blog, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TimeService.dateFormatDMY(blog?.updatedAt),
          style: CustomStyle.interRegular(color: colors.textHint, size: 14),
        ),
        8.verticalSpace,
        Text(
          blog?.translation?.title ?? "",
          style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
        ),
        12.verticalSpace,
        Row(
          children: [
            SvgPicture.asset("assets/svg/start.svg"),
            4.horizontalSpace,
            Text(
              "${blog?.rate ?? 0}",
              style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
            ),
            const Spacer(),
            ButtonEffectAnimation(
              onTap: () {
                AppRoute.goReviewPage(
                    context: context, colors: colors, blogId: blog?.id);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 11.r, horizontal: 14.r),
                decoration: BoxDecoration(
                  color: colors.textBlack,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FlutterRemix.message_3_fill,
                      color: colors.textWhite,
                    ),
                    10.horizontalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.comment),
                      style: CustomStyle.interNormal(
                          color: colors.textWhite, size: 14),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
