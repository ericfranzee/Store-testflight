import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/auth/auth_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/infrastructure/firebase/firebase_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

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
                CustomTextFormField(
                  validation: AppValidators.isNotEmptyValidator,
                  controller: widget.phone,
                  hint: AppHelper.getTrn(TrKeys.phoneNumber),
                  inputType: TextInputType.phone,
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
                                        if(AppConstants.isDemo && LocalStorage.getUiType() == null){
                                          AppRouteSetting.goSelectUIType(context: context);
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
