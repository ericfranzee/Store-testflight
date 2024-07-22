part of 'service_bloc.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState({
    @Default([]) List<ServiceModel> services,
    @Default([]) List<CategoryData> categoryServices,
    @Default([]) List<ServiceModel> selectServices,
    @Default(true) bool isLoading,
    @Default(0) int selectIndex,
  }) = _ServiceState;
}
