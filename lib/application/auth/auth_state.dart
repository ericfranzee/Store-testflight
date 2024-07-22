part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isShowPassword,
    @Default(false) bool isShowConfirmPassword,
    @Default(AuthType.login) AuthType screenType,
    @Default(false) bool isError,
    @Default("") String verificationId,
    @Default('05:00') String timerText,
  }) = _AuthState;
}
