part of 'membership_bloc.dart';

@freezed
abstract class MembershipEvent with _$MembershipEvent {
  const factory MembershipEvent.fetchMembership({required BuildContext context,
    bool? isRefresh,
    int? shopId,
    RefreshController? controller}) = FetchMembership;

  const factory MembershipEvent.selectPaymentId({required int id}) =
  SelectPaymentId;

  const factory MembershipEvent.fetchPayments({required BuildContext context}) =
  FetchPayments;

  const factory MembershipEvent.fetchWebView({required BuildContext context,
    required int membershipId,
    required VoidCallback? onSuccess
  }) = FetchWebView;

  const factory MembershipEvent.createTransaction(
      {required BuildContext context,
        required int membershipId,
        required VoidCallback? onSuccess}) = CreateTransaction;

  const factory MembershipEvent.myMemberships({required BuildContext context,
    bool? isRefresh,
    int? serviceId,
    int? shopId,
    RefreshController? controller}) = MyMemberships;
}
