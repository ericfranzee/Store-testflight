import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/auth/auth_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/firebase/firebase_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/second_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/auth/confirm_screen.dart';
import 'package:ibeauty/presentation/pages/auth/forget_password.dart';
import 'package:ibeauty/presentation/pages/auth/login_cart.dart';
import 'package:ibeauty/presentation/pages/auth/sign_up_cart.dart';
import 'package:ibeauty/presentation/pages/auth/sign_up_field_cart.dart';
import 'package:ibeauty/presentation/pages/auth/update_password.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController phone;

  @override
  void initState() {
    phone = TextEditingController();
    FirebaseService.initDynamicLinks(context);
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.loginBg),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScaffold(
        bgColor: CustomStyle.transparent,
        body: (colors) => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                16.verticalSpace,
                Row(
                  children: [
                    Text(
                      AppHelper.getAppName(),
                      style: CustomStyle.interNormal(color: CustomStyle.white),
                    ),
                    const Spacer(),
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (l, n) {
                        return l.screenType != n.screenType;
                      },
                      builder: (context, state) {
                        return SecondButton(
                          title: AppHelper.getTrn(
                              state.screenType == AuthType.login
                                  ? TrKeys.signUp
                                  : TrKeys.signIn),
                          bgColor: CustomStyle.black,
                          titleColor: CustomStyle.white,
                          onTap: () {
                            context.read<AuthBloc>().add(AuthEvent.switchScreen(
                                state.screenType != AuthType.login
                                    ? AuthType.login
                                    : AuthType.signUpSendCode));
                          },
                        );
                      },
                    ),
                    8.horizontalSpace,
                    SecondButton(
                      title: AppHelper.getTrn(TrKeys.skip),
                      bgColor: CustomStyle.black,
                      titleColor: CustomStyle.white,
                      onTap: () {
                        if (LocalStorage.getAddress() == null) {
                          AppRouteSetting.goSelectCountry(context: context);
                          return;
                        }
                        if(AppConstants.isDemo && LocalStorage.getUiType() == null){
                          AppRouteSetting.goSelectUIType(context: context);
                          return;
                        }
                        AppRoute.goMain(context);
                      },
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  margin: MediaQuery.viewInsetsOf(context),
                  child: BlurWrap(
                    radius: BorderRadius.circular(24.r),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: colors.backgroundColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(24.r)),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        buildWhen: (l, n) {
                          return l.screenType != n.screenType;
                        },
                        builder: (context, state) {
                          switch (state.screenType) {
                            case AuthType.login:
                              return LoginCart(colors: colors);
                            case AuthType.signUpSendCode:
                              return SignUpCart(
                                colors: colors,
                                phone: phone,
                              );
                            case AuthType.confirm:
                              return ConfirmScreen(
                                colors: colors,
                                phone: phone.text,
                              );
                            case AuthType.signUpFull:
                              return SignUpFieldCart(
                                phone: phone.text,
                                colors: colors,
                                isPhone: AppHelper.checkPhone(
                                    phone.text.replaceAll(" ", "")),
                              );
                            case AuthType.forgetPassword:
                              return ForgetPasswordScreen(
                                  colors: colors, phone: phone);
                            case AuthType.updatePassword:
                              return UpdatePasswordScreen(
                                colors: colors,
                                phone: phone.text,
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
