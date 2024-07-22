part of 'parcels_list_bloc.dart';

@freezed
abstract class ParcelsListEvent with _$ParcelsListEvent {

  const factory ParcelsListEvent.fetchActiveParcel(
      {required BuildContext context,
        bool? isRefresh,
        RefreshController? controller}) = FetchActiveParcel;

  const factory ParcelsListEvent.fetchHistoryParcel(
      {required BuildContext context,
        bool? isRefresh,
        RefreshController? controller}) = FetchHistoryParcel;


}
