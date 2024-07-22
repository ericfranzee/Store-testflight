import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectButtonShop extends StatelessWidget {
  final CustomColorSet colors;

  const ConnectButtonShop({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return SpeedDial(
          spacing: 3,
          mini: true,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: (ctx, open, toggleChildren) {
            return ButtonEffectAnimation(
              onTap: toggleChildren,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.primary,
                    boxShadow: [
                      BoxShadow(
                          color: colors.primary,
                          offset: const Offset(0, 20),
                          blurRadius: 40,
                          spreadRadius: 0)
                    ]),
                padding: EdgeInsets.all(16.r),
                child: Icon(
                  open ? FlutterRemix.close_line : FlutterRemix.message_3_fill,
                  color: colors.white,
                  size: 30.r,
                ),
              ),
            );
          },
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: const StadiumBorder(),
          children: [
            SpeedDialChild(
              child: Icon(
                FlutterRemix.message_3_fill,
                color: colors.white,
              ),
              backgroundColor: colors.bottomBarColor,
              onTap: () {
                if (context.read<ShopBloc>().state.shop?.phone != null) {
                  try {
                    final Uri smsLaunchUri = Uri(
                      scheme: 'sms',
                      path: context.read<ShopBloc>().state.shop?.phone,
                      queryParameters: <String, String>{
                        'body': Uri.encodeComponent('Hello '),
                      },
                    );
                    launchUrl(smsLaunchUri);
                  } catch (e) {
                    AppHelper.openDialog(context: context, title: e.toString());
                  }
                  return;
                }
                AppHelper.openDialog(
                    context: context,
                    title: AppHelper.getTrn(TrKeys.thisShopDontEnterContact));
              },
            ),
            SpeedDialChild(
              child: Icon(
                FlutterRemix.phone_fill,
                color: colors.white,
              ),
              backgroundColor: colors.bottomBarColor,
              onTap: () {
                if (context.read<ShopBloc>().state.shop?.phone != null) {
                  try {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: context.read<ShopBloc>().state.shop?.phone,
                    );
                    launchUrl(launchUri);
                  } catch (e) {
                    AppHelper.openDialog(context: context, title: e.toString());
                  }
                  return;
                }
                AppHelper.openDialog(
                    context: context,
                    title: AppHelper.getTrn(TrKeys.thisShopDontEnterContact));
              },
            ),
            SpeedDialChild(
              child: Icon(
                FlutterRemix.messenger_fill,
                color: colors.white,
              ),
              backgroundColor: colors.bottomBarColor,
              onTap: () {
                if (LocalStorage.getToken().isEmpty) {
                  AppRoute.goLogin(context);
                  return;
                }
                AppRouteSetting.goChat(
                  context: context,
                  senderId: state.shop?.userId ?? 0,
                );
              },
            ),
            for (int i = 0; i < (state.shop?.socials?.length ?? 0); i++)
              SpeedDialChild(
                child: Icon(
                  AppConstants.socialIcon[state.shop?.socials?[i].type],
                  color: colors.white,
                ),
                backgroundColor: colors.bottomBarColor,
                onTap: () {
                  final Uri launchUri =
                      Uri.parse(state.shop?.socials?[i].content ?? "");
                  launchUrl(launchUri);
                },
              )
          ],
        );
      },
    );
  }
}
