import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/review_pagination_response.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  final CustomColorSet colors;

  const ReviewItem({super.key, required this.review, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomNetworkImage(
              url: review.user?.img ?? "",
              height: 50,
              width: 50,
              radius: 10,
              name: review.user?.firstname ?? review.user?.lastname,
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${review.user?.firstname ?? ""} ${review.user?.lastname ?? ""}",
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 20),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text(
                      TimeService.dateFormatForNotification(
                          review.createdAt ?? DateTime.now()),
                      style: CustomStyle.interRegular(
                          color: colors.textHint, size: 16),
                    ),
                    10.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.textHint,
                      ),
                      height: 4.r,
                      width: 4.r,
                    ),
                    10.horizontalSpace,
                    Icon(
                      FlutterRemix.star_smile_fill,
                      color: CustomStyle.starColor,
                      size: 16.r,
                    ),
                    4.horizontalSpace,
                    Text(
                      review.rating.toString(),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 16),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        16.verticalSpace,
        if (review.galleries?.isNotEmpty ?? false)
          Padding(
            padding: EdgeInsets.only(bottom: 10.r),
            child: SizedBox(
              height: 130.r,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: review.galleries?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ButtonEffectAnimation(
                      onTap: () {
                        AppRoute.goReviewImages(
                            context: context,
                            index: index,
                            list: review.galleries ?? []);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: CustomNetworkImage(
                            url: review.galleries?[index].path ?? "",
                            preview: review.galleries?[index].preview,
                            height: 130,
                            width: 168,
                            radius: 8),
                      ),
                    );
                  }),
            ),
          ),
        Text(
          review.comment ?? "",
          style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
        ),
        24.verticalSpace,
      ],
    );
  }
}
