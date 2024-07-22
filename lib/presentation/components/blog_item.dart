import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/blog_model.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

import 'custom_network_image.dart';

class BlogItem extends StatelessWidget {
  final BlogData blog;
  final bool isHomePage;

  const BlogItem({Key? key, required this.blog, this.isHomePage = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, controller) {
      return ButtonEffectAnimation(
        onTap: () {
          if (isHomePage) {
            AppRoute.goBlogBottomSheet(context, blog);
            return;
          }
          AppRoute.goBlogPage(context, blog);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8.r),
          height: 254.r,
          width: MediaQuery.sizeOf(context).width-100,
          decoration: BoxDecoration(
              border: Border.all(color: colors.icon),
              borderRadius: BorderRadius.circular(16.r),
              color: CustomStyle.icon),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    topLeft: Radius.circular(16.r)),
                child: CustomNetworkImage(
                    url: blog.img ?? "",
                    height: 160,
                    width: double.infinity,
                    radius: 0),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.translation?.title ?? "",
                        style: CustomStyle.interNormal(
                            color: colors.textBlack, size: 16),
                      ),
                      const Spacer(),
                      Text(
                        TimeService.dateFormatDMY(blog.updatedAt),
                        style: CustomStyle.interRegular(
                            color: colors.textBlack, size: 14),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
