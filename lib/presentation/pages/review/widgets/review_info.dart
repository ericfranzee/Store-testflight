import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/reivew_statistic_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'rating_bar.dart';

class ReviewInfo extends StatelessWidget {
  final CustomColorSet colors;
  final ReviewCountModel? reviewCount;

  const ReviewInfo(
      {super.key, required this.colors, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2 - 64.r,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colors.textWhite,
                    borderRadius: BorderRadius.circular(16.r)),
                padding: EdgeInsets.symmetric(
                  vertical: 16.r,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      reviewCount?.avg?.toStringAsFixed(2) ?? "0.0",
                      style: CustomStyle.interSemi(
                          color: colors.textBlack, size: 32),
                    ),
                    6.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.totalRating),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 12),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colors.textWhite,
                    borderRadius: BorderRadius.circular(16.r)),
                padding: EdgeInsets.symmetric(vertical: 16.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FlutterRemix.star_smile_fill,
                      color: CustomStyle.starColor,
                    ),
                    6.horizontalSpace,
                    Text(
                      "${reviewCount?.count ?? 0} ${AppHelper.getTrn(TrKeys.totalRating)}",
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: colors.textWhite, borderRadius: BorderRadius.circular(16.r)),
            child: CustomRatingBar(
              colors: colors,
              counts: [
                reviewCount?.group?["5"] ?? 0,
                reviewCount?.group?["4"] ?? 0,
                reviewCount?.group?["3"] ?? 0,
                reviewCount?.group?["2"] ?? 0,
                reviewCount?.group?["1"] ?? 0
              ],
            ),
          ),
        ),
      ],
    );
  }
}
