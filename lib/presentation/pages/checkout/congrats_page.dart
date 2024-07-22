import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/style/style.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.checkout),
                style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              ),
              42.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Image.asset("assets/images/kingdom.png"),
              ),
              6.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.congrats),
                      style: CustomStyle.interBold(
                          color: colors.textBlack, size: 20),
                    ),
                    6.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.thankYouPurchase),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 14),
                    ),
                    Text(
                      AppHelper.getTrn(TrKeys.yourOrderShipping),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 14),
                    ),
                  ],
                ),
              ),
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
