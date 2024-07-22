import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class LooksShopOne extends StatelessWidget {
  final CustomColorSet colors;

  const LooksShopOne({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return state.looks.isNotEmpty
            ? SizedBox(
                height: 350.r,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.looks.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppRoute.goLookBottomSheet(
                              context, state.looks[index], colors);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16.r),
                              decoration: BoxDecoration(
                                  border: Border.all(color: colors.icon),
                                  borderRadius: BorderRadius.circular(24)),
                              child: CustomNetworkImage(
                                  url: state
                                          .looks[index].galleries?.first.path ??
                                      "",
                                  preview: state
                                      .looks[index].galleries?.first.preview,
                                  height: 250,
                                  width:
                                      MediaQuery.sizeOf(context).width - 64.r,
                                  radius: 24),
                            ),
                            16.verticalSpace,
                            Text(
                              state.looks[index].translation?.title ?? "",
                              style: CustomStyle.interNoSemi(
                                  color: colors.textBlack, size: 26),
                              maxLines: 1,
                            ),
                            8.verticalSpace,
                            Text(
                              state.looks[index].translation?.description ?? "",
                              style: CustomStyle.interRegular(
                                  color: colors.textBlack, size: 18),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
