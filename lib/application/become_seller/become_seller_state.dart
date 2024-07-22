part of 'become_seller_bloc.dart';

@freezed
class BecomeSellerState with _$BecomeSellerState {
  const factory BecomeSellerState({
    @Default(null) String? logoPath,
    @Default(null) String? bgPath,
    @Default(TrKeys.month) String type,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _BecomeSellerState;
}
