part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required BuildContext context,
      required String phone,
      required String password,
      VoidCallback? onSuccess}) = Login;

  const factory AuthEvent.signUp(
      {required BuildContext context,
      required String firstname,
      required String lastname,
      required String email,
      required String phone,
      required String password,
      required String referral,
      VoidCallback? onSuccess}) = SignUp;

  const factory AuthEvent.socialSignIn(
      {required BuildContext context,
      required IconData type,
      VoidCallback? onSuccess}) = SocialSignIn;

  const factory AuthEvent.setVerificationId({required String id}) =
      SetVerificationId;

  const factory AuthEvent.showPassword() = ShowPassword;

  const factory AuthEvent.showConfirmPassword() = ShowConfirmPassword;

  const factory AuthEvent.switchScreen(AuthType type) = SwitchScreen;

  const factory AuthEvent.checkVerify(
      {required BuildContext context,
      required String verifyId,
      required String code,
      bool? editPhone}) = CheckVerify;

  const factory AuthEvent.checkPhone(
      {required BuildContext context,
      required String phone,
      VoidCallback? onSuccess}) = CheckPhone;

  const factory AuthEvent.forgotPasswordAfter(
      {required BuildContext context,
      required String phone,
      required String password,
      VoidCallback? onSuccess}) = ForgotPasswordAfter;

  const factory AuthEvent.loadingChange() = LoadingChange;
}
