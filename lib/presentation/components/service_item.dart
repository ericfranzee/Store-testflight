import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ServiceItem extends StatelessWidget {
  final CustomColorSet colors;
  final ServiceModel service;
  final bool bookButton;
  final bool booked;
  final int? shopId;
  final MasterModel? master;

  const ServiceItem(
      {super.key,
      required this.colors,
      required this.service,
      this.bookButton = true,
      this.shopId,
      this.booked = false,
      this.master});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouteService.goServiceBottomSheet(
            context: context,
            service: service,
            colors: colors,
            bookButton: bookButton,
            shopId: shopId);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          const Divider(),
          16.verticalSpace,
          Text(
            service.translation?.title ?? "",
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
          ),
          4.verticalSpace,
          Text(
            service.translation?.description ?? "",
            style: CustomStyle.interRegular(color: colors.textBlack, size: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          8.verticalSpace,
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.r,top: 8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: colors.textHint)),
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "${AppHelper.getTrn(TrKeys.from)} ${AppHelper.numberFormat(number: service.price)}",
                  style:
                      CustomStyle.interNormal(color: colors.textHint, size: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.r,top: 8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: colors.textHint)),
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "${service.interval ?? 0} ${AppHelper.getTrn(TrKeys.minute)}",
                  style:
                      CustomStyle.interNormal(color: colors.textHint, size: 12),
                ),
              ),
              if (service.type != null)
                Container(
                  margin: EdgeInsets.only(right: 8.r,top: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: colors.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                   AppHelper.getTrn(service.type ?? ""),
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(right: 8.r,top: 8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: colors.textHint)),
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  AppHelper.getTrn(service.gender == 1
                      ? TrKeys.male
                      : service.gender == 1
                          ? TrKeys.female
                          : TrKeys.both),
                  style:
                      CustomStyle.interNormal(color: colors.textHint, size: 12),
                ),
              )
            ],
          ),
          16.verticalSpace,
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
                        color: colors.textBlack, size: 22),
                  )
                ],
              ),
              const Spacer(),
              ButtonEffectAnimation(
                onTap: () {
                  if (bookButton) {
                    context
                        .read<ServiceBloc>()
                        .add(ServiceEvent.selectService(service: service));
                    return;
                  }
                  AppRouteService.goServiceListPage(context: context, shopId: shopId);
                },
                child: bookButton
                    ? Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                            color: booked ? colors.primary : colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: booked
                                    ? colors.primary
                                    : colors.textBlack)),
                        child: Center(
                          child: Icon(
                            booked
                                ? FlutterRemix.check_fill
                                : FlutterRemix.add_fill,
                            color: booked ? colors.textWhite : colors.textBlack,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.r, horizontal: 16.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: colors.textBlack)),
                        child: Text(
                          AppHelper.getTrn(TrKeys.book),
                          style: CustomStyle.interNormal(
                              color: colors.textBlack, size: 16),
                        ),
                      ),
              ),
            ],
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
