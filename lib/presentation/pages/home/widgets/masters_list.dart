import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/master_item/master_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/shimmer/h_product_shimmer.dart';

class MastersList extends StatelessWidget {
  final CustomColorSet colors;
  final RefreshController controller;
  final VoidCallback onLoading;
  final bool isShop;

  const MastersList(
      {Key? key,
      required this.colors,
      required this.controller,
      required this.onLoading,
       this.isShop = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(
      builder: (context, state) {
        return state.masters.isNotEmpty || state.isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  TitleWidget(
                    title: isShop
                        ? AppHelper.getTrn(TrKeys.ourSpecialists)
                        : AppHelper.getTrn(TrKeys.theBestMasters),
                    titleColor: colors.textBlack,
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 325.r,
                    child: !state.isLoading
                        ? SmartRefresher(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            enablePullUp: true,
                            enablePullDown: false,
                            onLoading: onLoading,
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.masters.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.r),
                                    child: MasterItem(
                                        master: state.masters[index],
                                        colors: colors),
                                  );
                                }),
                          )
                        : const HProductShimmer(),
                  )
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
