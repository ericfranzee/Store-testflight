// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/parcel/parcel_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_toggle.dart';
import 'package:ibeauty/presentation/pages/parcel/widgets/type_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';

class TypeAndTime extends StatelessWidget {
  final ParcelState state;
  final CustomColorSet colors;

  const TypeAndTime({super.key, required this.state, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (state.expand)
          InkWell(
            child: Container(
              margin: EdgeInsets.only(
                top: 16.r,
              ),
              decoration: BoxDecoration(
                  color: colors.newBoxColor,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelper.getTrn(TrKeys.remainAnonymous),
                        style: CustomStyle.interSemi(
                            size: 16, color: colors.textBlack),
                      ),
                      Text(
                        AppHelper.getTrn(TrKeys.dontNotifyRecipient),
                        style: CustomStyle.interRegular(
                            size: 14, color: colors.textBlack),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 76.r,
                    child: CustomToggle(
                      offTitle: AppHelper.getTrn(TrKeys.off),
                      onTitle: AppHelper.getTrn(TrKeys.on),
                      isOnline: false,
                      colors: colors,
                      onChange: (bool value) {},
                    ),
                  )
                ],
              ),
            ),
          ),
        InkWell(
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.dialOnly,
            );

            if (time != null) {
              if (time.hour < TimeOfDay.now().hour) {
                if (context.mounted) {
                  AppHelper.errorSnackBar(
                    context: context,
                    message: AppHelper.getTrn(TrKeys.thisTimeIsNotAvailable),
                  );
                }

                return;
              }
              if (time.hour == TimeOfDay.now().hour &&
                  time.minute < TimeOfDay.now().hour) {
                if (context.mounted) {
                  AppHelper.errorSnackBar(
                    context: context,
                    message: AppHelper.getTrn(TrKeys.thisTimeIsNotAvailable),
                  );
                }
                return;
              }
              context.read<ParcelBloc>().add(ParcelEvent.setTime(time: time));
            }
          },
          child: ButtonEffectAnimation(
            child: Container(
              margin: EdgeInsets.only(top: 16.r, bottom: 24.r),
              decoration: BoxDecoration(
                  color: colors.newBoxColor,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
              child: Row(
                children: [
                  Icon(
                    FlutterRemix.time_line,
                    color: colors.textBlack,
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelper.getTrn(TrKeys.deliveryTime),
                        style: CustomStyle.interRegular(
                            size: 12, color: colors.textBlack),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Text(
                          "${AppHelper.getTrn(TrKeys.pickupAt)} ${state.time?.format(context) ?? TimeOfDay.now().format(context)}",
                          style: CustomStyle.interSemi(
                              size: 16, color: colors.textBlack),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    FlutterRemix.arrow_right_s_line,
                    color: colors.textBlack,
                  )
                ],
              ),
            ),
          ),
        ),
        state.types.isNotEmpty
            ? Container(
                margin: EdgeInsets.only(top: 10.r, bottom: 24.r),

                decoration: BoxDecoration(
                  color: colors.newBoxColor,
                  borderRadius: BorderRadius.circular(16.r)
                ),
                padding: EdgeInsets.all(16.r),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.types.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return TypeItem(
                          colors: colors,
                          type: state.types[index],
                          index: index,
                          selectIndex: state.selectType);
                    }),
              )
            : Column(
                children: [
                  32.verticalSpace,
                  Lottie.asset("assets/lottie/empty_list.json"),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Text(
                      AppHelper.getTrn(TrKeys.ifYouWantToUseThisService),
                      style: CustomStyle.interNormal(color: colors.textBlack),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
