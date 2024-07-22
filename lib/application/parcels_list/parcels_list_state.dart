part of 'parcels_list_bloc.dart';

@freezed
class ParcelsListState with _$ParcelsListState {
  const factory ParcelsListState({
    @Default(false) bool isActiveLoading,
    @Default(false) bool isHistoryLoading,
    @Default(0) int totalActiveCount,
    @Default([]) List<ParcelOrder> activeOrders,
    @Default([]) List<ParcelOrder> historyOrders,
  }) = _ParcelsListState;
}
