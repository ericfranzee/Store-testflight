import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class LooksShopTwo extends StatelessWidget {
  final CustomColorSet colors;

  const LooksShopTwo({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return state.looks.isNotEmpty
            ? Container(
                color: colors.newBoxColor,
                height: 172.r,
                child: ListView.builder(
                    padding: EdgeInsets.all(16.r),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.looks.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppRoute.goLookBottomSheet(
                              context, state.looks[index], colors);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16.r),
                          decoration: BoxDecoration(
                              border: Border.all(color: colors.icon),
                              borderRadius: BorderRadius.circular(24)),
                          child: CustomNetworkImage(
                              url: state.looks[index].galleries?.first.path ??
                                  "",
                              preview:
                                  state.looks[index].galleries?.first.preview,
                              height: 250,
                              width: MediaQuery.sizeOf(context).width - 64.r,
                              radius: 24),
                        ),
                      );
                    }),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
