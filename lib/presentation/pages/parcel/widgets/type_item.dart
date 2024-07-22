import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/parcel/parcel_bloc.dart';
import 'package:ibeauty/domain/model/response/parcel_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../../domain/service/tr_keys.dart';

class TypeItem extends StatelessWidget {
  final CustomColorSet colors;
  final TypeModel? type;
  final int index;
  final int selectIndex;

  const TypeItem(
      {super.key,
      required this.colors,
      required this.type,
      required this.index,
      required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == selectIndex) {
          AppHelper.showCustomModalBottomSheet(
            context: context,
            modal: Container(
              decoration: BoxDecoration(
                color: colors.backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.verticalSpace,
                  Center(
                    child: Container(
                      height: 4.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                          color: colors.textHint,
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.r))),
                    ),
                  ),
                  18.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Text(
                      type?.type ?? "",
                      style: CustomStyle.interSemi(
                          size: 16, color: colors.textBlack),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  14.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Text(
                      "${AppHelper.getTrn(TrKeys.upTo)} ${(type?.maxG ?? 1) / 1000} ${AppHelper.getTrn(TrKeys.kg)}, ${(type?.maxHeight ?? 1)}X${(type?.maxWidth ?? 1)} ${AppHelper.getTrn(TrKeys.sm)}",
                      style: CustomStyle.interRegular(
                          size: 14, color: colors.textBlack),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: CustomNetworkImage(
                        url: type?.img ?? "",
                        height: 210,
                        width: double.infinity,
                        radius: 10),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: CustomButton(
                      title: AppHelper.getTrn(TrKeys.gotIt),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      bgColor: colors.primary,
                      titleColor: colors.white,
                    ),
                  ),
                  32.verticalSpace,
                ],
              ),
            ),
          );
          return;
        }
        context
            .read<ParcelBloc>()
            .add(ParcelEvent.selectType(index: index, context: context));
      },
      child: ButtonEffectAnimation(
        child: Container(
          foregroundDecoration: BoxDecoration(
              color: selectIndex == index
                  ? colors.transparent
                  : colors.backgroundColor.withOpacity(0.8)),
          margin: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              border: Border.all(
                  color: selectIndex == index
                      ? colors.primary
                      : colors.transparent),
              color: colors.backgroundColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNetworkImage(
                  url: type?.img ?? "", height: 70, width: 70, radius: 8),
              8.verticalSpace,
              Text(
                type?.type ?? "",
                style: CustomStyle.interSemi(size: 16, color: colors.textBlack),
                maxLines: 1,
              ),
              8.verticalSpace,
              Text(
                "${AppHelper.getTrn(TrKeys.upTo)} ${(type?.maxG ?? 1) / 1000} ${AppHelper.getTrn(TrKeys.kg)}",
                style: CustomStyle.interSemi(size: 13, color: colors.textHint),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
