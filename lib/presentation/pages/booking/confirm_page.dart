import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/style/style.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.r),
                child: Text(
                  AppHelper.getTrn(TrKeys.confirmed),
                  style:
                      CustomStyle.interSemi(color: colors.textBlack, size: 22),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svg/verify.svg"),
                    6.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.confirmed),
                      style: CustomStyle.interBold(
                          color: colors.textBlack, size: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.r)
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SizedBox(
          height: 60.r,
          child: CustomButton(
            title: AppHelper.getTrn(TrKeys.returnHome),
            bgColor: colors.primary,
            titleColor: colors.white,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
