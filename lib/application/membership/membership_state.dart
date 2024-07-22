part of 'membership_bloc.dart';

@freezed
class MembershipState with _$MembershipState {
  const factory MembershipState({
    @Default([]) List<MembershipModel> memberships,
    @Default([]) List<MyMembershipModel> myMemberships,
    @Default(true) bool isLoading,
    @Default(false) bool isButtonLoading,
    @Default(true) bool isPaymentLoading,
    @Default(-1) int selectPayment,
    @Default([]) List<PaymentData>? list,
  }) = _MembershipState;
}
