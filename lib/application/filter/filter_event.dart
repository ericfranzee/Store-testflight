part of 'filter_bloc.dart';

@freezed
abstract class FilterEvent with _$FilterEvent {
  const factory FilterEvent.selectType({required LayoutType selectType}) =
      SelectType;

  const factory FilterEvent.fetchExtras(
      {required BuildContext context,
      String? type,
      required bool isPrice,
      int? categoryId,
      int? shopId}) = FetchExtras;

  const factory FilterEvent.setExtras({required int id}) = SetExtras;

  const factory FilterEvent.setRangePrice({required RangeValues price}) =
      SetRangePrice;

  const factory FilterEvent.setCategory({required int id}) = SetCategory;

  const factory FilterEvent.setBrands({required int id}) = SetBrands;

  const factory FilterEvent.clearFilter() = ClearFilter;

  const factory FilterEvent.setSort({required String? value}) = SetSort;

  const factory FilterEvent.setServiceType({required String? value}) =
      SetServiceType;

  const factory FilterEvent.setGender({required int index}) = SetGender;

  const factory FilterEvent.setAmenities({required int? value}) = SetAmenities;

  const factory FilterEvent.fetchTags({
    required BuildContext context,
  }) = FetchTags;

  const factory FilterEvent.setFilter(
      { required FilterShopModel? filter}) = SetFilter;
}
