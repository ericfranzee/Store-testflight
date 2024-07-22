part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool isTransactionLoading,
    @Default(false) bool isButtonLoading,
    @Default(false) bool isSearchingLoading,
    @Default(1) int selectPayment,
    @Default([]) List<TransactionModel> transactions,
    @Default([]) List<PaymentData>? list,
    @Default([]) List<UserModel>? listOfUser,
  }) = _WalletState;
}
