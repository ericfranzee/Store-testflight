part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(null) String? imagePath,
    @Default(false) bool isLoading,
    @Default(false) bool isLanguage,
    @Default(false) bool isCurrency,
    @Default(false) bool isDigitalLoading,
    @Default(false) bool isHelpLoading,
    @Default(true) bool isReferralLoading,
    @Default([]) List<LanguageData> languages,
    @Default([]) List<CurrencyData> currency,
    @Default([]) List<HelpModel> helps,
    @Default([]) List<DigitalProduct> digitalList,
    @Default([]) List<DownloadModel> progressList,
    @Default(null) ReferralModel? referralData,
    @Default(false) bool showNewPassword,
    @Default(false) bool showConfirmPassword,
    @Default(false) bool isPasswordLoading,
    @Default(null) Translation? policy,
    @Default(null) Translation? term,
  }) = _ProfileState;
}
