import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/pages/review/widgets/review_item.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

class ReviewShop extends StatelessWidget {
  final CustomColorSet colors;
  final int shopId;

  const ReviewShop({
    super.key,
    required this.colors,
    required this.shopId,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            Text(
              AppHelper.getTrn(TrKeys.reviews),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
            ),
            20.verticalSpace,
            BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 48.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: controller.isDark
                        ? colors.socialButtonColor
                        : CustomStyle.reviewBoxColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (state.shop?.ratingAvg ?? 0).toStringAsFixed(1),
                        style: CustomStyle.interBold(
                            color: colors.textBlack, size: 40),
                      ),
                      8.verticalSpace,
                      SvgPicture.asset(
                        "assets/svg/medal.svg",
                        width: 30.r,
                        height: 30.r,
                      ),
                      10.verticalSpace,
                      Text(
                        AppHelper.reviewText(state.shop?.ratingAvg),
                        style: CustomStyle.interNoSemi(
                            color: colors.textBlack, size: 18),
                      ),
                      10.verticalSpace,
                      Text(
                        "${AppHelper.getTrn(TrKeys.basedOn)} ${state.shop?.ratingCount?.toStringAsFixed(0) ?? "0"}",
                        style: CustomStyle.interRegular(
                            color: colors.textBlack, size: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
            20.verticalSpace,
            BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (p, n) {
                return p.reviewOptions != n.reviewOptions;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    _reviewOptionsItem(
                        title: TrKeys.cleanliness,
                        value: state.reviewOptions?.cleanliness),
                    _reviewOptionsItem(
                        title: TrKeys.masters,
                        value: state.reviewOptions?.masters),
                    _reviewOptionsItem(
                        title: TrKeys.location,
                        value: state.reviewOptions?.location),
                    _reviewOptionsItem(
                        title: TrKeys.price, value: state.reviewOptions?.price),
                    _reviewOptionsItem(
                        title: TrKeys.interior,
                        value: state.reviewOptions?.interior),
                    _reviewOptionsItem(
                        title: TrKeys.serviceQuality,
                        value: state.reviewOptions?.service),
                    _reviewOptionsItem(
                        title: TrKeys.communication,
                        value: state.reviewOptions?.communication),
                    _reviewOptionsItem(
                        title: TrKeys.equipment,
                        value: state.reviewOptions?.equipment),
                  ],
                );
              },
            ),
            20.verticalSpace,
            BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 20.r),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return ReviewItem(
                        review: state.list[index],
                        colors: colors,
                      );
                    });
              },
            ),
            CustomButton(
                title: AppHelper.getTrn(TrKeys.viewMore),
                bgColor: colors.transparent,
                titleColor: colors.textBlack,
                borderColor: colors.textBlack,
                onTap: () {
                  AppRoute.goReviewPage(
                      context: context, colors: colors, shopId: shopId);
                })
          ],
        ),
      );
    });
  }

  Widget _reviewOptionsItem({
    required String title,
    required num? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.getTrn(title),
          style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
        ),
        8.verticalSpace,
        LinearProgressIndicator(
          minHeight: 6.r,
          value: (value?.toDouble() ?? 0) / 10,
          borderRadius: BorderRadius.circular(100.r),
          color: CustomStyle.reviewColor,
          backgroundColor: colors.icon,
        ),
        24.verticalSpace
      ],
    );
  }
}
