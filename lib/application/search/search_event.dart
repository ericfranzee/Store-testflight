part of 'search_bloc.dart';

@freezed
abstract class SearchEvent with _$SearchEvent {

  const factory SearchEvent.setQuery(
      {required String query,int? shopId}) = SetQuery;

  const factory SearchEvent.searchShops(
      {required BuildContext context}) = SearchShops;

  const factory SearchEvent.searchProduct(
      {required BuildContext context}) = SearchProduct;

  const factory SearchEvent.searchCategory(
      {required BuildContext context}) = SearchCategory;

  const factory SearchEvent.searchBrand(
      {required BuildContext context}) = SearchBrand;

  const factory SearchEvent.updateRecently() = UpdateRecently;


}
