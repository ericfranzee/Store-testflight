import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/second_button.dart';
import 'package:ibeauty/presentation/components/shimmer/category_shimmer.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryList extends StatelessWidget {
  final RefreshController categoryRefresh;
  final CustomColorSet colors;
  final bool onlyCategory;

  const CategoryList(
      {Key? key,
      required this.categoryRefresh,
      required this.colors,
      this.onlyCategory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.categories.isNotEmpty || state.isLoadingCategory
            ? Column(
                children: [
                  SizedBox(
                    height: 40.r,
                    child: Row(
                      children: [
                        if (state.categories.isNotEmpty)
                          Expanded(
                            child: SmartRefresher(
                              controller: categoryRefresh,
                              scrollDirection: Axis.horizontal,
                              enablePullUp: true,
                              enablePullDown: false,
                              onLoading: () {
                                context.read<CategoryBloc>().add(
                                    CategoryEvent.fetchCategory(
                                        context: context,
                                        controller: categoryRefresh));
                              },
                              child: onlyCategory
                                  ? ListView.builder(
                                      key: const PageStorageKey<String>("list"),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.r),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.categories.length,
                                      itemBuilder: (context, index) {
                                        return SecondButton(
                                          title: state.categories[index]
                                                  .translation?.title ??
                                              "",
                                          bgColor:
                                              state.selectCategoryTwo?.id ==
                                                      state.categories[index].id
                                                  ? colors.categoryColor
                                                  : CustomStyle.transparent,
                                          titleColor:
                                              state.selectCategoryTwo?.id !=
                                                      state.categories[index].id
                                                  ? colors.categoryTitleColor
                                                  : colors.white,
                                          onTap: () {
                                            if (state.categories[index].id !=
                                                state.selectCategoryTwo?.id) {
                                              context.read<CategoryBloc>().add(
                                                  CategoryEvent
                                                      .selectCategoryTwo(
                                                          context: context,
                                                          category:
                                                              state.categories[
                                                                  index]));
                                            }
                                          },
                                        );
                                      })
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.r),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.categories.length + 1,
                                      itemBuilder: (context, index) {
                                        return index == 0
                                            ? SecondButton(
                                                title: AppHelper.getTrn(
                                                    TrKeys.all),
                                                bgColor: state.selectCategory
                                                            ?.id ==
                                                        null
                                                    ? colors.categoryColor
                                                    : CustomStyle.transparent,
                                                titleColor: state.selectCategory
                                                            ?.id !=
                                                        null
                                                    ? colors.categoryTitleColor
                                                    : colors.white,
                                                onTap: () {
                                                  context
                                                      .read<CategoryBloc>()
                                                      .add(CategoryEvent
                                                          .selectCategory(
                                                              context:
                                                                  context));
                                                },
                                              )
                                            : SecondButton(
                                                title: state
                                                        .categories[index - 1]
                                                        .translation
                                                        ?.title ??
                                                    "",
                                                bgColor: state.selectCategory
                                                            ?.id ==
                                                        state
                                                            .categories[
                                                                index - 1]
                                                            .id
                                                    ? colors.categoryColor
                                                    : CustomStyle.transparent,
                                                titleColor: state.selectCategory
                                                            ?.id !=
                                                        state
                                                            .categories[
                                                                index - 1]
                                                            .id
                                                    ? colors.categoryTitleColor
                                                    : colors.white,
                                                onTap: () {
                                                  if (state
                                                          .categories[index - 1]
                                                          .id !=
                                                      state
                                                          .selectCategory?.id) {
                                                    context
                                                        .read<CategoryBloc>()
                                                        .add(CategoryEvent
                                                            .selectCategory(
                                                                context:
                                                                    context,
                                                                category: state
                                                                        .categories[
                                                                    index -
                                                                        1]));
                                                  }
                                                },
                                              );
                                      }),
                            ),
                          ),
                        if (state.isLoadingCategory) const CategoryShimmer(),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  const Divider(color: CustomStyle.dividerColor),
                  8.verticalSpace,
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
