part of 'filter_bloc.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default(LayoutType.twoH) LayoutType selectType,
    @Default(true) bool isLoading,
    @Default("category") String type,
    @Default(null) FilterResponse? filter,
    @Default(null) Price? filterPrices,
    @Default([]) List<int>? extras,
    @Default([]) List<int>? categories,
    @Default([]) List<int>? brands,
    @Default([]) List<int> prices,
    @Default(null) ShopFilterModel? shopFilter,
    @Default(null) String? serviceType,
    @Default(null) String? sort,
    @Default(null) int? tagId,
    @Default(2) int genderIndex,
    @Default(null) RangeValues? rangeValues,
  }) = _FilterState;
}
