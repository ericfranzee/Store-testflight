import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cea_zed/app_constants.dart';
import 'package:cea_zed/application/auth/auth_bloc.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/domain/service/tr_keys.dart';
import 'package:cea_zed/infrastructure/firebase/firebase_service.dart';
import 'package:cea_zed/infrastructure/local_storage/local_storage.dart';
import 'package:cea_zed/presentation/components/button/custom_button.dart';
import 'package:cea_zed/presentation/route/app_route.dart';
import 'package:cea_zed/presentation/route/app_route_setting.dart';
import 'package:cea_zed/presentation/style/style.dart';
import 'package:cea_zed/presentation/style/theme/theme.dart';
import 'package:phone_text_field/phone_text_field.dart';

import 'widgets/social_button.dart';

class SignUpCart extends StatefulWidget {
  final CustomColorSet colors;
  final TextEditingController phone;

  const SignUpCart({
    Key? key,
    required this.colors,
    required this.phone,
  }) : super(key: key);

  @override
  State<SignUpCart> createState() => _SignUpCartState();
}

class _SignUpCartState extends State<SignUpCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.r,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.signUp),
                  style: CustomStyle.interNoSemi(
                      color: widget.colors.textBlack, size: 30),
                ),
                32.verticalSpace,
                PhoneTextField(
                  initialValue: widget.phone.text,
                  initialCountryCode: "NG",
                  isRequired: false,
                  textStyle:
                      CustomStyle.interNormal(color: widget.colors.textBlack),
                  locale: const Locale('en'),
                  decoration: const InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone number",
                  ),
                  searchFieldInputDecoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(),
                    ),
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search country",
                  ),
                  onChanged: (s) {
                    widget.phone.text = s.completeNumber;
                  },
                ),
                16.verticalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.hintNum),
                  style: CustomStyle.interNoSemi(
                      color: widget.colors.textHint, size: 10),
                ),
                16.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (l, n) {
                    return l.isLoading != n.isLoading;
                  },
                  builder: (context, state) {
                    return CustomButton(
                        isLoading: state.isLoading,
                        title: AppHelper.getTrn(TrKeys.signUp),
                        bgColor: widget.colors.primary,
                        titleColor: CustomStyle.white,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            if (AppHelper.checkPhone(
                                widget.phone.text.replaceAll(" ", ""))) {
                              context.read<AuthBloc>().add(AuthEvent.checkPhone(
                                  context: context,
                                  phone: widget.phone.text,
                                  onSuccess: () {
                                    FirebaseService.sendCode(
                                        phone: widget.phone.text,
                                        onSuccess: (id) {
                                          context.read<AuthBloc>().add(
                                              AuthEvent.setVerificationId(
                                                  id: id));
                                        },
                                        onError: (e) {
                                          AppHelper.errorSnackBar(
                                              context: context, message: e);
                                        });
                                  }));
                            } else {
                              AppHelper.errorSnackBar(
                                  context: context,
                                  message: AppHelper.getTrn(
                                      TrKeys.thisNotPhoneNumber));
                            }
                          }
                        });
                  },
                ),
                16.verticalSpace,
                Divider(
                  color: widget.colors.icon,
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: AppConstants.socialSignIn
                      .map((e) => SocialButton(
                            iconColor: widget.colors.textBlack,
                            bgColor: widget.colors.socialButtonColor,
                            icon: e,
                            onTap: () {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEvent.socialSignIn(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
