part of 'compare_bloc.dart';

@freezed
class CompareState with _$CompareState {
  const factory CompareState({
    @Default(false) bool isLoading,
    @Default([]) List<List<ProductData>> compare,
    @Default([]) List<GroupProperties> extraGroup,
    @Default([]) List<GroupProperties> propertyGroup,
  }) = _CompareState;
}
