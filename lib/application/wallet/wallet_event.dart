part of 'wallet_bloc.dart';

@freezed
abstract class WalletEvent with _$WalletEvent {
  const factory WalletEvent.fetchTransactions(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller}) = FetchTransactions;

  const factory WalletEvent.fetchPayments({required BuildContext context}) =
      FetchPayments;

  const factory WalletEvent.selectPayment({required int index}) = SelectPayment;

  const factory WalletEvent.searchUser(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller,
      required String search}) = SearchUser;

  const factory WalletEvent.fillWallet(
      {required BuildContext context,
      required int walletId,
        required VoidCallback onSuccess,
      required String price}) = FillWallet;

  const factory WalletEvent.sendWallet(
      {required BuildContext context,
      required String price,
        required VoidCallback onSuccess,
      required String uuid}) = SendWallet;
}
