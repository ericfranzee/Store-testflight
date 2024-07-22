part of 'master_bloc.dart';

@freezed
abstract class MasterEvent with _$MasterEvent {
  const factory MasterEvent.fetchMasters(
      {required BuildContext context,
      bool? isRefresh,
      int? shopId,
      int? serviceId,
      List<int>? serviceIds,
      RefreshController? controller}) = FetchMasters;

  const factory MasterEvent.fetchLikeMasters({required BuildContext context}) =
      FetchLikeMasters;

  const factory MasterEvent.fetchMasterById(
      {required BuildContext context,
      required MasterModel master}) = FetchMasterById;

  const factory MasterEvent.fetchMasterImage(
      {required BuildContext context, required int id}) = FetchMasterImage;

  const factory MasterEvent.updateState() = UpdateState;
}
