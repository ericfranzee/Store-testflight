import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class StepScreen extends StatelessWidget {
  final CustomColorSet colors;
  final int step;

  const StepScreen({super.key, required this.colors, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20.r),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomStyle.greenColor,
          ),
          child: Icon(
            step == 2
                ? FlutterRemix.bank_card_fill
                : step == 3
                    ? FlutterRemix.shield_check_fill
                    : FlutterRemix.truck_fill,
            color: CustomStyle.white,
          ),
        ),
        16.verticalSpace,
        Text(
          AppHelper.getTrn(step == 2
              ? TrKeys.payment
              : step == 3
                  ? TrKeys.verify
                  : TrKeys.shipping),
          style: CustomStyle.interBold(color: colors.textBlack, size: 16),
        ),
        2.verticalSpace,
        Text(
          AppHelper.getTrn(step == 2
              ? TrKeys.nextStepVerify
              : step == 2
                  ? TrKeys.lastStep
                  : TrKeys.nextStepPayment),
          style: CustomStyle.interNormal(color: colors.textBlack, size: 12),
        ),
      ],
    );
  }
}
