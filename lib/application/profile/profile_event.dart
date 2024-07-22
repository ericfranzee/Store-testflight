part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.updateImagePath({required String? imagePath}) =
      UpdateImagePath;

  const factory ProfileEvent.updateUser(
      {required String firstName,
      required String lastName,
      required String phone,
      required String email,
      required BuildContext context,
      VoidCallback? onSuccess}) = UpdateUser;

  const factory ProfileEvent.updatePassword(
      {required String newPassword,
      required String confirmPassword,
      required BuildContext context,
      VoidCallback? onSuccess}) = UpdatePassword;

  const factory ProfileEvent.showPassword() = ShowPassword;

  const factory ProfileEvent.showConfirmPassword() = ShowConfirmPassword;

  const factory ProfileEvent.getLanguage({required BuildContext context}) =
      GetLanguage;

  const factory ProfileEvent.getCurrency({required BuildContext context}) =
      GetCurrency;

  const factory ProfileEvent.getHelps({required BuildContext context}) =
      GetHelps;

  const factory ProfileEvent.updateLan() = UpdateLan;

  const factory ProfileEvent.fetchProfile({required BuildContext context}) =
      FetchProfile;

  const factory ProfileEvent.fetchReferral({required BuildContext context}) =
  FetchReferral;

  const factory ProfileEvent.setProgress(
      {String? taskId, int? index, required int progress}) = SetProgress;

  const factory ProfileEvent.fetchDigitalList(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchDigitalList;


  const factory ProfileEvent.getPolicy({required BuildContext context}) = GetPolicy;

  const factory ProfileEvent.getTerm({required BuildContext context}) = GetTerm;
}
