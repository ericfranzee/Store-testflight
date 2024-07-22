import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'widgets/button_item.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Column(
          children: [
            Row(
              children: [

                16.horizontalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.account),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      if (LocalStorage.getToken().isEmpty) {
                        AppRoute.goLogin(context);
                        return;
                      }
                      AppRouteSetting.goNotification(context: context);
                    },
                    icon: Badge(
                      label: (LocalStorage.getToken().isEmpty)
                          ? const Text("0")
                          : BlocBuilder<NotificationBloc, NotificationState>(
                        builder: (context, state) {
                          return Text(state.countOfNotifications?.notification
                              .toString() ??
                              "0");
                        },
                      ),
                      child: Icon(
                        FlutterRemix.notification_line,
                        color: colors.textBlack,
                      ),
                    ))
              ],
            ),
            24.verticalSpace,
            ButtonItem(
                icon: FlutterRemix.settings_3_line,
                title: AppHelper.getTrn(TrKeys.editAccount),
                onTap: () {
                  AppRouteSetting.goEditProfile(context: context, colors: colors);
                },
                colors: colors),
            ButtonItem(
                icon: FlutterRemix.lock_2_line,
                title: AppHelper.getTrn(TrKeys.changePassword),
                onTap: () {
                  AppRouteSetting.goChangePassword(context: context, colors: colors);
                },
                colors: colors),
            ButtonItem(
                icon: FlutterRemix.hotel_line,
                title: AppHelper.getTrn(TrKeys.deliveryAddress),
                onTap: () {
                  AppRouteSetting.goSelectCountry(context: context);
                },
                colors: colors),
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
