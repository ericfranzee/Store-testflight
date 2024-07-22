import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'layout_item.dart';

class LayoutScreen extends StatelessWidget {
  final CustomColorSet colors;
  final LayoutType selectType;

  const LayoutScreen(
      {super.key, required this.colors, required this.selectType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: colors.newBoxColor, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.layouts),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: AppConstants.filterLayouts
                .map((e) => ButtonEffectAnimation(
                    onTap: () {
                      context
                          .read<FilterBloc>()
                          .add(FilterEvent.selectType(selectType: e));
                    },
                    child: LayoutItem(
                      colors: colors,
                      type: e,
                      selectType: selectType,
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
