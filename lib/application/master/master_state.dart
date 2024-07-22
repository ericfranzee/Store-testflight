part of 'master_bloc.dart';

@freezed
class MasterState with _$MasterState {
  const factory MasterState({
    @Default([]) List<MasterModel> masters,
    @Default(null) MasterModel? master,
    @Default([]) List<MasterModel> likeMasters,
    @Default([]) List<Galleries> masterImages,
    @Default(true) bool isLoading,
  }) = _MasterState;
}
