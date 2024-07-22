// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: (colors) => SafeArea(
              child: Column(
                children: [
                  Text(
                    AppHelper.getTrn(TrKeys.referral),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 18),
                  ),
                  24.verticalSpace,
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.isReferralLoading
                          ? const Loading()
                          : Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _info(state, colors,context),
                                  CustomButton(
                                    title: AppHelper.getTrn(TrKeys.share),
                                    bgColor: colors.primary,
                                    titleColor: colors.textWhite,
                                    onTap: () {
                                      FlutterShare.share(
                                          title:
                                              AppHelper.getTrn(TrKeys.referral),
                                          linkUrl:
                                              LocalStorage.getUser().referral ??
                                                  "");
                                    },
                                  ),
                                  16.verticalSpace,
                                  CustomButton(
                                    title: AppHelper.getTrn(TrKeys.copyCode),
                                    bgColor: colors.textBlack,
                                    titleColor: colors.textWhite,
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              LocalStorage.getUser().referral ??
                                                  ""));
                                      AppHelper.errorSnackBar(
                                          context: context,
                                          message: AppHelper.getTrn(
                                              TrKeys.copyCode));
                                    },
                                  ),
                                  16.verticalSpace,
                                  _balance(colors),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Widget _balance(CustomColorSet colors) {
    return Container(
      height: 74.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: colors.textBlack),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FlutterRemix.coins_fill,
              size: 45.r,
              color: colors.textBlack,
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.balance),
                  style: CustomStyle.interNormal(
                    size: 14,
                    color: colors.textBlack,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  AppHelper.numberFormat(
                      number: (LocalStorage.getUser().referralFromPrice ?? 0) -
                          (LocalStorage.getUser().referralFromWithdrawPrice ??
                              0)),
                  style: CustomStyle.interSemi(
                    size: 18,
                    color: colors.textBlack,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 1.r,
              height: 46.r,
              color: colors.textBlack,
            ),
            const Spacer(),
            Text(
              ((LocalStorage.getUser().referralFromPrice ?? 0) -
                      (LocalStorage.getUser().referralFromWithdrawPrice ?? 0))
                  .toString(),
              style: CustomStyle.interSemi(
                size: 18,
                color: colors.textBlack,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(
      ProfileState state, CustomColorSet colors, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: CustomNetworkImage(
            url: state.referralData?.img ?? "",
            height: 42.r,
            width: 42.r,
            radius: 8.r,
          ),
        ),
        16.verticalSpace,
        Text(
          state.referralData?.translation?.title ?? "",
          style: CustomStyle.interNoSemi(
            size: 20,
            color: colors.textBlack,
          ),
        ),
        16.verticalSpace,
        GestureDetector(
          onTap: () {
            AppHelper.openDialog(
                context: context,
                title: state.referralData?.translation?.shortDesc ?? "");
          },
          child: RichText(
            text: TextSpan(
                text: "${state.referralData?.translation?.description} ",
                style: CustomStyle.interNoSemi(
                  size: 14,
                  color: colors.textBlack,
                ),
                children: [
                  TextSpan(
                    text: AppHelper.getTrn(TrKeys.referralFaq).toLowerCase(),
                    style: CustomStyle.interNoSemi(
                        size: 14,
                        color: colors.textBlack,
                        decoration: TextDecoration.underline),
                  )
                ]),
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}
