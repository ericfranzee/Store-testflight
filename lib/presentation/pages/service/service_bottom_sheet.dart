

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ServiceBottomSheet extends StatelessWidget {
  final CustomColorSet colors;
  final ServiceModel service;
  final ScrollController controller;
  final bool bookButton;
  final int? shopId;

  const ServiceBottomSheet(
      {super.key,
      required this.colors,
      required this.controller,
      required this.service,
      required this.bookButton,
      required this.shopId});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        decoration: BoxDecoration(
          color: colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: ListView(
          controller: controller,
          padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
          children: [
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: colors.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            28.verticalSpace,
            Row(
              children: [
                Text(
                  service.translation?.title ?? "",
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 22),
                ),
                const Spacer(),
                Text(
                  AppHelper.numberFormat(number: service.totalPrice),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
              ],
            ),
            20.verticalSpace,
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: colors.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    "${AppHelper.getTrn(TrKeys.from)} ${AppHelper.numberFormat(number: service.price)}",
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: colors.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    "${service.interval ?? 0} ${AppHelper.getTrn(TrKeys.minute)}",
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                )
              ],
            ),
            26.verticalSpace,
            Text(
              service.translation?.description ?? "",
              style:
                  CustomStyle.interRegular(color: colors.textBlack, size: 16),
            ),
            26.verticalSpace,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.price),
                      style: CustomStyle.interNormal(
                          color: colors.textHint, size: 14),
                    ),
                    Text(
                      AppHelper.numberFormat(number: service.totalPrice),
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 26),
                    ),
                  ],
                ),
                24.horizontalSpace,
                Expanded(
                  child: BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      return CustomButton(
                          title: state.selectServices
                                  .map((e) => e.id)
                                  .contains(service.id)
                              ? AppHelper.getTrn(TrKeys.remove)
                              : AppHelper.getTrn(TrKeys.bookNow),
                          bgColor: colors.textBlack,
                          titleColor: colors.textWhite,
                          onTap: () {
                            if (!bookButton) {
                              AppRouteService.goServiceListPage(
                                  context: context, shopId: shopId);
                              return;
                            }
                            context.read<ServiceBloc>().add(
                                ServiceEvent.selectService(service: service));

                            Navigator.pop(context);
                          });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
