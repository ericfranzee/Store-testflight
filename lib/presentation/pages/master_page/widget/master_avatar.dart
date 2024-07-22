import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class MasterAvatar extends StatelessWidget {
  final CustomColorSet colors;

  const MasterAvatar({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
                url: state.master?.img ?? "",
                height: 220.r + MediaQuery.paddingOf(context).top,
                width: double.infinity,
                radius: 0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${state.master?.firstname ?? ""} ${state.master?.lastname ?? ""}",
                        style: CustomStyle.interNoSemi(
                            color: colors.textBlack, size: 20),
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            FlutterRemix.map_pin_2_fill,
                            color: colors.textBlack,
                            size: 18.r,
                          ),
                          8.horizontalSpace,
                          ButtonEffectAnimation(
                            onTap: () {
                              AppRouteShop.goShopPage(
                                  context: context,
                                  shop: state.master?.invite?.shop);
                            },
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width-150.r,
                              child: Text(
                                state.master?.invite?.shop?.translation?.title ??
                                    "",
                                style: CustomStyle.interNoSemi(
                                    color: colors.textHint, size: 14),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelper.getTrn(TrKeys.startFrom),
                        style: CustomStyle.interRegular(
                            color: colors.textBlack, size: 14),
                      ),
                      6.verticalSpace,
                      Text(
                        AppHelper.numberFormat(
                            number: state.master?.serviceMinPrice),
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: CustomButton(
                  title: AppHelper.getTrn(TrKeys.bookNow),
                  bgColor: colors.textBlack,
                  titleColor: colors.textWhite,
                  onTap: () {
                    AppRouteService.goServiceListPage(
                        context: context, master: state.master);
                  }),
            ),
            30.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: const Divider())
          ],
        );
      },
    );
  }
}
