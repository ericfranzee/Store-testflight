import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cea_zed/app_constants.dart';
import 'package:cea_zed/application/auth/auth_bloc.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/domain/service/tr_keys.dart';
import 'package:cea_zed/domain/service/validators.dart';
import 'package:cea_zed/infrastructure/local_storage/local_storage.dart';
import 'package:cea_zed/presentation/components/button/animation_button_effect.dart';
import 'package:cea_zed/presentation/components/button/custom_button.dart';
import 'package:cea_zed/presentation/components/custom_textformfield.dart';
import 'package:cea_zed/presentation/route/app_route.dart';
import 'package:cea_zed/presentation/route/app_route_setting.dart';
import 'package:cea_zed/presentation/style/style.dart';
import 'package:cea_zed/presentation/style/theme/theme.dart';
import 'dart:async'; // Import for Timer
import 'widgets/social_button.dart';

class LoginCart extends StatefulWidget {
  final CustomColorSet colors;

  const LoginCart({Key? key, required this.colors}) : super(key: key);

  @override
  State<LoginCart> createState() => _LoginCartState();
}

class _LoginCartState extends State<LoginCart> {
  late TextEditingController phone;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  OverlayEntry? _overlayEntry;
  Timer? _timer; // Timer to control the auto-dismiss of the tooltip

  @override
  void initState() {
    phone = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    _timer?.cancel(); // Cancel the timer if it's active
    _overlayEntry?.remove(); // Remove the overlay if it's active
    super.dispose();
  }

  void _showCustomTooltip(BuildContext context) {
    if (_overlayEntry != null) {
      _hideCustomTooltip(); // Hide tooltip if it's already visible
    } else {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context).insert(_overlayEntry!);

      _timer?.cancel(); // Cancel any existing timer
      _timer = Timer(const Duration(seconds: 3), () {
        _hideCustomTooltip(); // Hide the tooltip after 10 seconds
      });
    }
  }

  void _hideCustomTooltip() {
    _timer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        bottom: offset.dy + size.height + -50.0,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: widget.colors.textWhite,
          child: Container(
            padding: const EdgeInsets.only(right: 8.0), // Padding to the right
            decoration: BoxDecoration(
              color: widget.colors.icon, // Ash background color
              borderRadius: BorderRadius.circular(4), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppHelper.getTrn(TrKeys.hintNum),
                style: TextStyle(
                  color: widget.colors.textBlack, // Black text color
                  fontSize: 12, // Text size 12
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.r,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.login),
                      style: CustomStyle.interNoSemi(
                          color: widget.colors.textBlack, size: 30),
                    ),
                    32.verticalSpace,
                    CustomTextFormField(
                      validation: AppValidators.isNotEmptyValidator,
                      controller: phone,
                      hint: AppHelper.getTrn(TrKeys.phoneNumberOrEmail),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _showCustomTooltip(context); // Show tooltip on press
                        },
                        icon: Icon(
                          Icons.info, // Info icon
                          color: widget.colors.textHint, // White body
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (l, n) {
                        return l.isShowPassword != n.isShowPassword;
                      },
                      builder: (context, state) {
                        return CustomTextFormField(
                          obscure: state.isShowPassword,
                          controller: password,
                          maxLines: 1,
                          validation: AppValidators.isValidPassword,
                          hint: AppHelper.getTrn(TrKeys.password),
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.showPassword());
                            },
                            icon: Icon(
                              !state.isShowPassword
                                  ? FlutterRemix.eye_close_line
                                  : FlutterRemix.eye_line,
                              color: widget.colors.textHint,
                            ),
                          ),
                        );
                      },
                    ),
                    16.verticalSpace,
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (l, n) {
                        return l.isLoading != n.isLoading;
                      },
                      builder: (context, state) {
                        return CustomButton(
                            isLoading: state.isLoading,
                            title: AppHelper.getTrn(TrKeys.signIn),
                            bgColor: widget.colors.primary,
                            titleColor: CustomStyle.white,
                            onTap: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(AuthEvent.login(
                                    context: context,
                                    phone: phone.text,
                                    password: password.text,
                                    onSuccess: () {
                                      if (LocalStorage.getAddress() == null) {
                                        AppRouteSetting.goSelectCountry(
                                            context: context);
                                        return;
                                      }
                                      if (AppConstants.isDemo &&
                                          LocalStorage.getUiType() == null) {
                                        AppRouteSetting.goSelectUIType(
                                            context: context);
                                        return;
                                      }
                                      AppRoute.goMain(context);
                                    }));
                              }
                            });
                      },
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
              ButtonEffectAnimation(
                onTap: () {
                  context.read<AuthBloc>().add(
                      const AuthEvent.switchScreen(AuthType.forgetPassword));
                },
                child: Text(
                  AppHelper.getTrn(TrKeys.forgetPassword),
                  style:
                      CustomStyle.interNormal(color: widget.colors.textBlack),
                ),
              ),
              16.verticalSpace,
              Divider(color: widget.colors.icon),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: AppConstants.socialSignIn
                    .map((e) => SocialButton(
                          iconColor: widget.colors.textBlack,
                          bgColor: widget.colors.socialButtonColor,
                          icon: e,
                          onTap: () {
                            context.read<AuthBloc>().add(AuthEvent.socialSignIn(
                                context: context,
                                type: e,
                                onSuccess: () {
                                  if (LocalStorage.getAddress() == null) {
                                    AppRouteSetting.goSelectCountry(
                                        context: context);
                                    return;
                                  }
                                  if (AppConstants.isDemo &&
                                      LocalStorage.getUiType() == null) {
                                    AppRouteSetting.goSelectUIType(
                                        context: context);
                                    return;
                                  }
                                  AppRoute.goMain(context);
                                }));
                          },
                        ))
                    .toList(),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
