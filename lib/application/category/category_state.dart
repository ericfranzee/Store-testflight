part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> categoriesOfService,
    @Default(true) bool isLoadingCategory,
    @Default(null) CategoryData? selectCategory,
    @Default(null) CategoryData? selectCategoryTwo,
  }) = _CategoryState;
}
