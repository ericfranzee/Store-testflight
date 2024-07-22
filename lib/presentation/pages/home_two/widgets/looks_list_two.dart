import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LooksListTwo extends StatelessWidget {
  final CustomColorSet colors;
  final RefreshController controller;
  final VoidCallback onLoading;

  const LooksListTwo(
      {super.key,
      required this.colors,
      required this.controller,
      required this.onLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return state.looks.isNotEmpty
            ? Container(
                height: 200.r,
                color: colors.newBoxColor,
                padding: EdgeInsets.symmetric(vertical: 16.r),
                child: SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: false,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  onLoading: onLoading,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.looks.length,
                    itemBuilder: (context, index) {
                      return _itemBanner(context, state, index);
                    },
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Padding _itemBanner(BuildContext context, BannerState state, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.r),
      child: ButtonEffectAnimation(
        onTap: () {
          AppRoute.goLookBottomSheet(context, state.looks[index], colors);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: colors.icon),
                  borderRadius: BorderRadius.circular(10.r)),
              child: CustomNetworkImage(
                  url: state.looks[index].galleries?.first.path ?? "",
                  preview: state.looks[index].galleries?.first.preview,
                  height: double.infinity,
                  width: MediaQuery.sizeOf(context).width - 96,
                  radius: 10),
            ),
            Positioned(
              bottom: 16.r,
              right: 16.r,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: colors.textWhite.withOpacity(0.75),
                ),
                child: Text(
                  "${state.looks[index].productsCount ?? 0} ${AppHelper.getTrn(TrKeys.products)}",
                  style: CustomStyle.interNormal(color: colors.textBlack),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
