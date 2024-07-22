import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

import 'widgets/drawer_item.dart';
import 'widgets/wallet_widget.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (colors, controller) {
        return KeyboardDismisser(
          isLtr: LocalStorage.getLangLtr(),
          child: Container(
            decoration: BoxDecoration(color: colors.backgroundColor),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.r),
              shrinkWrap: true,
              children: [
                32.verticalSpace,
                if (LocalStorage.getToken().isNotEmpty)
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: WalletScreen(colors: colors)),
                24.verticalSpace,
                if (LocalStorage.getToken().isEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.login_circle_line,
                    title: AppHelper.getTrn(TrKeys.login),
                    onTap: () {
                      AppRoute.goLogin(context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.user_6_line,
                    title: AppHelper.getTrn(TrKeys.myAccount),
                    onTap: () {
                      AppRouteSetting.goMyAccount(context: context);
                    },
                  ),
                if (AppConstants.isDemo)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.magic_line,
                    title: AppHelper.getTrn(TrKeys.selectUiType),
                    onTap: () {
                      AppRouteSetting.goSelectUIType(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty &&
                    AppHelper.getReferralActive())
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.money_dollar_circle_line,
                    title: AppHelper.getTrn(TrKeys.inviteFriend),
                    onTap: () {
                      AppRouteSetting.goMyReferral(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.file_list_2_line,
                    title: AppHelper.getTrn(TrKeys.orderHistory),
                    onTap: () {
                      AppRoute.goOrdersList(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.calendar_2_line,
                    title: AppHelper.getTrn(TrKeys.myAppointments),
                    onTap: () {
                      Navigator.pop(context);
                      context
                          .read<MainBloc>()
                          .add(const MainEvent.changeIndex(index: 2));
                      context.read<BookingBloc>().add(
                          BookingEvent.fetchBookUpcoming(
                              context: context, isRefresh: true));
                      context.read<BookingBloc>().add(
                          BookingEvent.fetchBookPast(
                              context: context, isRefresh: true));
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty && AppHelper.getParcel())
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.archive_line,
                    title: AppHelper.getTrn(TrKeys.parcel),
                    onTap: () {
                      AppRouteParcel.goParcel(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty && AppHelper.getParcel())
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.archive_drawer_line,
                    title: AppHelper.getTrn(TrKeys.parcelHistory),
                    onTap: () {
                      AppRouteParcel.goParcelList(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.file_list_3_line,
                    title: AppHelper.getTrn(TrKeys.myDigitalList),
                    onTap: () {
                      AppRoute.goMyDigitalList(context: context);
                    },
                  ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.heart_3_line,
                  title: AppHelper.getTrn(TrKeys.myWishlist),
                  onTap: () {
                    Navigator.pop(context);
                    context
                        .read<MainBloc>()
                        .add(const MainEvent.changeIndex(index: 3));
                    context
                        .read<ProductBloc>()
                        .add(ProductEvent.fetchLikeProduct(context: context));
                    context
                        .read<ShopBloc>()
                        .add(ShopEvent.fetchLikeShops(context: context));
                    context
                        .read<MasterBloc>()
                        .add(MasterEvent.fetchLikeMasters(context: context));
                  },
                ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.coupon_3_line,
                    title: AppHelper.getTrn(TrKeys.myMemberships),
                    onTap: () {
                      AppRouteSetting.goMyMemberships(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.gift_line,
                    title: AppHelper.getTrn(TrKeys.myGiftCarts),
                    onTap: () {
                      AppRouteSetting.goMyGiftCart(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.stack_line,
                    title: AppHelper.getTrn(TrKeys.compare),
                    onTap: () {
                      AppRoute.goComparePage(context: context);
                    },
                  ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.archive_line,
                  title: AppHelper.getTrn(TrKeys.categories),
                  onTap: () {
                    AppRoute.goCategoryPage(context: context);
                  },
                ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.store_2_line,
                  title: AppHelper.getTrn(TrKeys.shops),
                  onTap: () {
                    AppRouteShop.goShopListPage(context: context);
                  },
                ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.briefcase_line,
                    title: AppHelper.getTrn(TrKeys.forBusiness),
                    onTap: () {
                      AppRouteShop.goBecomeSeller(context: context);
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.team_line,
                    title: AppHelper.getTrn(TrKeys.groupOrder),
                    onTap: () {
                      AppRouteSetting.goGroupOrder(context, colors);
                    },
                  ),
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Text(
                    AppHelper.getTrn(TrKeys.setting).toUpperCase(),
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 12),
                  ),
                ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.settings_3_line,
                  title: AppHelper.getTrn(TrKeys.appSetting),
                  onTap: () {
                    AppRouteSetting.goAppSetting(context: context);
                  },
                ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.message_3_line,
                    title: AppHelper.getTrn(TrKeys.messages),
                    onTap: () {
                      AppRouteSetting.goChatsList(context: context);
                    },
                  ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.error_warning_line,
                  title: AppHelper.getTrn(TrKeys.helpInfo),
                  onTap: () {
                    AppRouteSetting.goHelp(context: context);
                  },
                ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.alarm_warning_line,
                  title: AppHelper.getTrn(TrKeys.privacy),
                  onTap: () {
                    AppRouteSetting.goPolicy(context: context);
                  },
                ),
                DrawerItem(
                  colors: colors,
                  icon: FlutterRemix.spam_line,
                  title: AppHelper.getTrn(TrKeys.terms),
                  onTap: () {
                    AppRouteSetting.goTerm(context: context);
                  },
                ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.logout_circle_line,
                    title: AppHelper.getTrn(TrKeys.logout),
                    onTap: () {
                      AppRoute.goLogin(context);
                      authRepository.logout();
                    },
                  ),
                if (LocalStorage.getToken().isNotEmpty)
                  DrawerItem(
                    colors: colors,
                    icon: FlutterRemix.logout_box_line,
                    title: AppHelper.getTrn(TrKeys.deleteAccount),
                    onTap: () {
                      AppHelper.showCustomDialog(
                          context: context,
                          content: Container(
                            decoration: BoxDecoration(
                                color: colors.backgroundColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            padding: EdgeInsets.all(16.r),
                            child: _deleteAlert(colors, context),
                          ));
                    },
                  ),
                16.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _deleteAlert(CustomColorSet colors, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppHelper.getTrn(TrKeys.areYouSureDeleteAccount),
          style: CustomStyle.interNormal(color: colors.textBlack, size: 18),
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                  title: AppHelper.getTrn(TrKeys.back),
                  bgColor: colors.newBoxColor,
                  titleColor: colors.textBlack,
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
            16.horizontalSpace,
            Expanded(
              child: CustomButton(
                  title: AppHelper.getTrn(TrKeys.yes),
                  bgColor: colors.primary,
                  titleColor: colors.white,
                  onTap: () {
                    AppRoute.goLogin(context);
                    authRepository.deleteAccount();
                  }),
            )
          ],
        )
      ],
    );
  }
}
