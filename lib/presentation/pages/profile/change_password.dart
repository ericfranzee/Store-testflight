import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ChangePassword extends StatefulWidget {
  final CustomColorSet colors;

  const ChangePassword({Key? key, required this.colors}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController newPassword;

  late TextEditingController confirmPassword;

  @override
  void initState() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
        margin: MediaQuery.viewInsetsOf(context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.verticalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.changePassword),
                  style: CustomStyle.interNoSemi(
                      color: widget.colors.textBlack, size: 22),
                ),
                24.verticalSpace,
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (l, n) {
                    return l.showNewPassword != n.showNewPassword;
                  },
                  builder: (context, state) {
                    return CustomTextFormField(
                      hint: AppHelper.getTrn(TrKeys.newPassword),
                      controller: newPassword,
                      maxLines: 1,
                      validation: AppValidators.isValidPassword,
                      obscure: state.showNewPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(const ProfileEvent.showPassword());
                        },
                        icon: Icon(
                          !state.showNewPassword
                              ? FlutterRemix.eye_close_line
                              : FlutterRemix.eye_line,
                          color: widget.colors.textBlack,
                        ),
                      ),
                    );
                  },
                ),
                16.verticalSpace,
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (l, n) {
                    return l.showConfirmPassword != n.showConfirmPassword;
                  },
                  builder: (context, state) {
                    return CustomTextFormField(
                      hint: AppHelper.getTrn(TrKeys.confirmPassword),
                      controller: confirmPassword,
                      validation: (s) =>
                          AppValidators.isValidConfirmPassword(
                              newPassword.text, s),
                      obscure: state.showConfirmPassword,
                      maxLines: 1,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(const ProfileEvent.showConfirmPassword());
                        },
                        icon: Icon(
                          !state.showConfirmPassword
                              ? FlutterRemix.eye_close_line
                              : FlutterRemix.eye_line,
                          color: widget.colors.textBlack,
                        ),
                      ),
                    );
                  },
                ),
                24.verticalSpace,
                BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (p, n) {
                    return p.isPasswordLoading != n.isPasswordLoading;
                  },
                  builder: (context, state) {
                    return CustomButton(
                        isLoading: state.isPasswordLoading,
                        title: AppHelper.getTrn(TrKeys.save),
                        bgColor: widget.colors.primary,
                        titleColor: widget.colors.white,
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.updatePassword(
                                newPassword: newPassword.text,
                                confirmPassword: confirmPassword.text,
                                context: context,
                                onSuccess: () => Navigator.pop(context),
                              ),
                            );
                          }
                        },
                    );
                  },
                ),
                32.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
