import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../custom_network_image.dart';

class MasterItem extends StatelessWidget {
  final MasterModel master;
  final CustomColorSet colors;
  final double height;
  final bool selectService;
  final bool like;
  final VoidCallback? onTap;

  const MasterItem(
      {super.key,
      required this.master,
      required this.colors,
      this.height = 198,
      this.selectService = false,
      this.like = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap?.call();
          return;
        }
        AppRouteService.goMasterPage(context: context, master: master);
      },
      child: Container(
        width: 200.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colors.icon),
          color: colors.backgroundColor,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  url: master.img ?? "",
                  height: height,
                  width: 198,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${master.firstname ?? ""} ${master.lastname ?? ""}",
                        style: CustomStyle.interNormal(
                            color: colors.textBlack, size: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      10.verticalSpace,
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
                              if (!selectService) {
                                AppRouteShop.goShopPage(
                                    context: context,
                                    shop: master.invite?.shop);
                              }
                            },
                            child: SizedBox(
                              width: like
                                  ? 110.r
                                  : selectService
                                      ? 110.r
                                      : 140.r,
                              child: Text(
                                master.invite?.shop?.translation?.title ?? "",
                                style: CustomStyle.interRegular(
                                    color: colors.textHint,
                                    size: 14,
                                    textDecoration: TextDecoration.underline),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            AppHelper.getTrn(TrKeys.startFrom),
                            style: CustomStyle.interRegular(
                                color: colors.textBlack, size: 14),
                          ),
                          const Spacer(),
                          Text(
                            AppHelper.numberFormat(
                                number: selectService
                                    ? master.serviceMaster?.totalPrice
                                    : master.serviceMinPrice),
                            style: CustomStyle.interSemi(
                                color: colors.textBlack, size: 16),
                          ),
                        ],
                      ),
                      if (selectService)
                        Padding(
                          padding: EdgeInsets.only(top: 8.r),
                          child: Row(
                            children: [
                              Text(
                                AppHelper.getTrn(TrKeys.type),
                                style: CustomStyle.interRegular(
                                    color: colors.textBlack, size: 14),
                              ),
                              const Spacer(),
                              Text(
                                master.serviceMaster?.type ?? "",
                                style: CustomStyle.interNormal(
                                    color: colors.textBlack, size: 16),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 12.r,
              left: 12.r,
              child: ButtonEffectAnimation(
                onTap: () {
                  LocalStorage.setLikedMaster(master.id ?? 0);
                  context
                      .read<MasterBloc>()
                      .add(const MasterEvent.updateState());
                },
                child: SvgPicture.asset(
                  LocalStorage.getLikedMaster().contains(master.id)
                      ? "assets/svg/likeButtom.svg"
                      : "assets/svg/unlike.svg",
                  width: 26.r,
                  height: 26.r,
                ),
              ),
            ),
            Positioned(
              right: 12.r,
              top: (height - 12).r,
              child: Container(
                height: 30.r,
                width: 30.r,
                decoration: BoxDecoration(
                  color: colors.textWhite.withOpacity(0.9),
                  border: Border.all(color: colors.icon),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    master.rate?.toStringAsFixed(1) ?? "0",
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
